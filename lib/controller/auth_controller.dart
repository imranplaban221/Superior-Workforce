import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

/// Central place for auth + onboarding form state. Use getters when calling APIs.
class AuthController extends GetxController {
  static AuthController get to => Get.find<AuthController>();

  final ImagePicker _picker = ImagePicker();

  // --- Log in ---
  final TextEditingController loginEmailController = TextEditingController();
  final TextEditingController loginPasswordController = TextEditingController();
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final RxInt loginSelectedTab = 0.obs;
  final RxBool loginSubmitted = false.obs;

  // --- Sign up ---
  final TextEditingController signUpEmailController = TextEditingController();
  final TextEditingController signUpPasswordController = TextEditingController();
  final TextEditingController signUpConfirmPasswordController =
      TextEditingController();
  final Rxn<Uint8List> signUpProfileImageBytes = Rxn<Uint8List>();
  final GlobalKey<FormState> signUpFormKey = GlobalKey<FormState>();
  final RxBool signUpSubmitted = false.obs;
  final RxInt signUpUiTick = 0.obs;

  // --- Forgot password ---
  final TextEditingController forgotPasswordEmailController =
      TextEditingController();
  final GlobalKey<FormState> forgotPasswordFormKey = GlobalKey<FormState>();

  // --- OTP (6 digits) ---
  late final List<TextEditingController> otpDigitControllers;
  late final List<FocusNode> otpFocusNodes;

  // --- New / reset password ---
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController newPasswordConfirmController =
      TextEditingController();
  final RxBool newPasswordObscure = true.obs;
  final RxBool newPasswordConfirmObscure = true.obs;
  final RxBool newPasswordSubmitted = false.obs;
  /// Bumped from password fields so strength UI can use [Obx].
  final RxInt newPasswordUiTick = 0.obs;

  // --- Personal info (job seeker profile) ---
  final TextEditingController personalInfoFirstNameController =
      TextEditingController();
  final TextEditingController personalInfoLastNameController =
      TextEditingController();
  final TextEditingController personalInfoPhoneController =
      TextEditingController();
  final TextEditingController personalInfoLocationController =
      TextEditingController();
  final Rxn<Uint8List> personalInfoProfileImageBytes = Rxn<Uint8List>();

  /// Set before navigating to [OtpScreen] if you want a single place to read it for APIs.
  final Rxn<String> pendingOtpEmail = Rxn<String>();

  @override
  void onInit() {
    super.onInit();
    otpDigitControllers = List<TextEditingController>.generate(
      6,
      (_) => TextEditingController(),
    );
    otpFocusNodes = List<FocusNode>.generate(6, (_) => FocusNode());
  }

  @override
  void onClose() {
    loginEmailController.dispose();
    loginPasswordController.dispose();
    signUpEmailController.dispose();
    signUpPasswordController.dispose();
    signUpConfirmPasswordController.dispose();
    forgotPasswordEmailController.dispose();
    for (final TextEditingController c in otpDigitControllers) {
      c.dispose();
    }
    for (final FocusNode f in otpFocusNodes) {
      f.dispose();
    }
    newPasswordController.dispose();
    newPasswordConfirmController.dispose();
    personalInfoFirstNameController.dispose();
    personalInfoLastNameController.dispose();
    personalInfoPhoneController.dispose();
    personalInfoLocationController.dispose();
    super.onClose();
  }

  // --- Image pickers ---

  Future<void> pickSignUpProfileImage() async {
    final Uint8List? bytes = await _pickImageBytes();
    if (bytes != null) {
      signUpProfileImageBytes.value = bytes;
    }
  }

  Future<void> pickPersonalInfoProfileImage() async {
    final Uint8List? bytes = await _pickImageBytes();
    if (bytes != null) {
      personalInfoProfileImageBytes.value = bytes;
    }
  }

  Future<Uint8List?> _pickImageBytes() async {
    final XFile? image = await _picker.pickImage(
      source: ImageSource.gallery,
      maxWidth: 1024,
      maxHeight: 1024,
      imageQuality: 85,
    );
    if (image == null) {
      return null;
    }
    return image.readAsBytes();
  }

  void clearSignUpProfileImage() {
    signUpProfileImageBytes.value = null;
  }

  void clearPersonalInfoProfileImage() {
    personalInfoProfileImageBytes.value = null;
  }

  // --- Clear helpers (after navigation / success) ---

  void clearLoginForm() {
    loginEmailController.clear();
    loginPasswordController.clear();
  }

  void resetLoginFormUi() {
    clearLoginForm();
    loginSubmitted.value = false;
    loginFormKey.currentState?.reset();
  }

  void clearSignUpForm() {
    signUpEmailController.clear();
    signUpPasswordController.clear();
    signUpConfirmPasswordController.clear();
    clearSignUpProfileImage();
  }

  void resetSignUpFormUi() {
    clearSignUpForm();
    signUpSubmitted.value = false;
    signUpFormKey.currentState?.reset();
  }

  void bumpSignUpUi() => signUpUiTick.value++;

  void clearForgotPasswordForm() {
    forgotPasswordEmailController.clear();
  }

  void resetForgotPasswordFormUi() {
    clearForgotPasswordForm();
    forgotPasswordFormKey.currentState?.reset();
  }

  void clearOtpFields() {
    for (final TextEditingController c in otpDigitControllers) {
      c.clear();
    }
  }

  void clearNewPasswordForm() {
    newPasswordController.clear();
    newPasswordConfirmController.clear();
    newPasswordObscure.value = true;
    newPasswordConfirmObscure.value = true;
    newPasswordSubmitted.value = false;
  }

  void bumpNewPasswordUi() => newPasswordUiTick.value++;

  void clearPersonalInfoForm() {
    personalInfoFirstNameController.clear();
    personalInfoLastNameController.clear();
    personalInfoPhoneController.clear();
    personalInfoLocationController.clear();
    clearPersonalInfoProfileImage();
  }

  /// Full reset (e.g. after logout or abandoning onboarding).
  void resetAllAuthInputs() {
    clearLoginForm();
    clearSignUpForm();
    clearForgotPasswordForm();
    clearOtpFields();
    clearNewPasswordForm();
    clearPersonalInfoForm();
    pendingOtpEmail.value = null;
  }

  // --- Values for API / repository layer ---

  String get loginEmail => loginEmailController.text.trim();
  String get loginPassword => loginPasswordController.text;

  String get signUpEmail => signUpEmailController.text.trim();
  String get signUpPassword => signUpPasswordController.text;
  String get signUpConfirmPassword =>
      signUpConfirmPasswordController.text.trim();

  Uint8List? get signUpProfileImage => signUpProfileImageBytes.value;

  String get forgotPasswordEmail => forgotPasswordEmailController.text.trim();

  String get otpCode => otpDigitControllers
      .map((TextEditingController c) => c.text.trim())
      .join();

  String get newPassword => newPasswordController.text;
  String get newPasswordConfirm => newPasswordConfirmController.text;

  String get personalInfoFirstName =>
      personalInfoFirstNameController.text.trim();
  String get personalInfoLastName => personalInfoLastNameController.text.trim();
  String get personalInfoPhone => personalInfoPhoneController.text.trim();
  String get personalInfoLocation =>
      personalInfoLocationController.text.trim();

  Uint8List? get personalInfoProfileImage =>
      personalInfoProfileImageBytes.value;
}
