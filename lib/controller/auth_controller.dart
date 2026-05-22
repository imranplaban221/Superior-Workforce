// ignore_for_file: avoid_print

import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_extension/data/api/auth_services.dart';
import 'package:flutter_extension/helper/route_helper.dart';
import 'package:flutter_extension/util/otp_source.dart';
import 'package:flutter_extension/controller/role_controller.dart';
import 'package:flutter_extension/helper/prefs_helper.dart';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AuthController extends GetxController {

  static AuthController get to => Get.find<AuthController>();

 

  final ImagePicker _picker = ImagePicker();

  final Rxn<String> pendingOtpEmail = Rxn<String>();

  final RxBool isSigningUp = false.obs;
  final RxBool isLoggingIn = false.obs;
  final RxBool isSendingOtp = false.obs;
  final RxBool isVerifyingOtp = false.obs;
  final RxBool isResettingPassword = false.obs;



  final TextEditingController loginEmailController =
      TextEditingController();

  final TextEditingController loginPasswordController =
      TextEditingController();

  final GlobalKey<FormState> loginFormKey =
      GlobalKey<FormState>();

  final RxBool loginSubmitted = false.obs;

  final RxInt loginSelectedTab = 0.obs;

  String get loginEmail =>
      loginEmailController.text.trim();

  String get loginPassword =>
      loginPasswordController.text;

  
  final TextEditingController signUpFullNameController =
    TextEditingController();
  final TextEditingController signUpEmailController =
      TextEditingController();

  final TextEditingController signUpPasswordController =
      TextEditingController();

  final TextEditingController signUpConfirmPasswordController =
      TextEditingController();

  final GlobalKey<FormState> signUpFormKey =
      GlobalKey<FormState>();

  final RxBool signUpSubmitted = false.obs;

  final RxInt signUpUiTick = 0.obs;

  final Rxn<Uint8List> signUpProfileImageBytes =
      Rxn<Uint8List>();

      String get signUpFullName =>
    signUpFullNameController.text.trim();

  String get signUpEmail =>
      signUpEmailController.text.trim();

  String get signUpPassword =>
      signUpPasswordController.text;

  String get signUpConfirmPassword =>
      signUpConfirmPasswordController.text.trim();

  Uint8List? get signUpProfileImage =>
      signUpProfileImageBytes.value;

  

  final TextEditingController forgotPasswordEmailController =
      TextEditingController();

  final GlobalKey<FormState> forgotPasswordFormKey =
      GlobalKey<FormState>();

  String get forgotPasswordEmail =>
      forgotPasswordEmailController.text.trim();

  

  late final List<TextEditingController> otpDigitControllers;

  late final List<FocusNode> otpFocusNodes;

  String get otpCode =>
      otpDigitControllers
          .map((TextEditingController c) => c.text.trim())
          .join();

  

  final TextEditingController newPasswordController =
      TextEditingController();

  final TextEditingController newPasswordConfirmController =
      TextEditingController();

  final RxBool newPasswordObscure = true.obs;

  final RxBool newPasswordConfirmObscure = true.obs;

  final RxBool newPasswordSubmitted = false.obs;

  final RxInt newPasswordUiTick = 0.obs;

  String get newPassword =>
      newPasswordController.text;

  String get newPasswordConfirm =>
      newPasswordConfirmController.text;

  

  final TextEditingController personalInfoFirstNameController =
      TextEditingController();

  final TextEditingController personalInfoLastNameController =
      TextEditingController();

  final TextEditingController personalInfoPhoneController =
      TextEditingController();

  final TextEditingController personalInfoLocationController =
      TextEditingController();

  final Rxn<Uint8List> personalInfoProfileImageBytes =
      Rxn<Uint8List>();

  String get personalInfoFirstName =>
      personalInfoFirstNameController.text.trim();

  String get personalInfoLastName =>
      personalInfoLastNameController.text.trim();

  String get personalInfoPhone =>
      personalInfoPhoneController.text.trim();

  String get personalInfoLocation =>
      personalInfoLocationController.text.trim();

  Uint8List? get personalInfoProfileImage =>
      personalInfoProfileImageBytes.value;

 

  @override
  void onInit() {

    super.onInit();

    otpDigitControllers =
        List<TextEditingController>.generate(
      6,
      (_) => TextEditingController(),
    );

    otpFocusNodes =
        List<FocusNode>.generate(
      6,
      (_) => FocusNode(),
    );
  }

  @override
  void onClose() {

    
    loginEmailController.dispose();
    loginPasswordController.dispose();

    signUpFullNameController.dispose();
    signUpEmailController.dispose();
    signUpPasswordController.dispose();
    signUpConfirmPasswordController.dispose();

   
    forgotPasswordEmailController.dispose();

    
    for (final TextEditingController c
        in otpDigitControllers) {
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

  

  Future<Uint8List?> pickImageBytes() async {

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

  Future<void> pickSignUpProfileImage() async {

    final Uint8List? bytes =
        await pickImageBytes();

    if (bytes != null) {
      signUpProfileImageBytes.value = bytes;
    }
  }

  Future<void> pickPersonalInfoProfileImage() async {

    final Uint8List? bytes =
        await pickImageBytes();

    if (bytes != null) {
      personalInfoProfileImageBytes.value = bytes;
    }
  }

  

  void clearLoginForm() {

    loginEmailController.clear();
    loginPasswordController.clear();
  }

  void clearSignUpForm() {


    signUpFullNameController.clear();

    signUpEmailController.clear();
    signUpPasswordController.clear();
    signUpConfirmPasswordController.clear();

    signUpProfileImageBytes.value = null;
  }

  void clearForgotPasswordForm() {

    forgotPasswordEmailController.clear();
  }

  void clearOtpFields() {

    for (final TextEditingController c
        in otpDigitControllers) {
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

  void clearPersonalInfoForm() {

    personalInfoFirstNameController.clear();
    personalInfoLastNameController.clear();
    personalInfoPhoneController.clear();
    personalInfoLocationController.clear();

    personalInfoProfileImageBytes.value = null;
  }



  void resetLoginFormUi() {

    clearLoginForm();

    loginSubmitted.value = false;

    loginFormKey.currentState?.reset();
  }

  void resetSignUpFormUi() {

    clearSignUpForm();

    signUpSubmitted.value = false;

    signUpFormKey.currentState?.reset();
  }

  void resetForgotPasswordFormUi() {

    clearForgotPasswordForm();

    forgotPasswordFormKey.currentState?.reset();
  }

  void resetAllAuthInputs() {

    clearLoginForm();
    clearSignUpForm();
    clearForgotPasswordForm();
    clearOtpFields();
    clearNewPasswordForm();
    clearPersonalInfoForm();

    pendingOtpEmail.value = null;
  }



  void bumpSignUpUi() =>
      signUpUiTick.value++;

  void bumpNewPasswordUi() =>
      newPasswordUiTick.value++;



  Future<void> signUp() async {

    signUpSubmitted.value = true;

    if (!(signUpFormKey.currentState
            ?.validate() ??
        false)) {
      return;
    }

    if (signUpPassword !=
        signUpConfirmPassword) {

      Get.snackbar(
        'Error',
        'Passwords do not match',
      );

      return;
    }

    try {

      isSigningUp.value = true;

      final String email = signUpEmail;

      final RoleController roleController =
    Get.find<RoleController>();

final String userType =
    roleController.selectedRole.value == 0
        ? 'employee'
        : 'employer';

     final response =
    await AuthService.signUp(
      fullName: signUpFullName,
      email: email,
      password: signUpPassword,
      userType: userType,
    );
      final int statusCode =
          (response['statusCode'] as int?) ?? 0;

      debugPrint('=====> [signUp controller] '
          'statusCode=$statusCode, '
          'success=${response['success']}, '
          'message=${response['message']}');

      if (response['success'] == true) {

        pendingOtpEmail.value = email;

        Get.snackbar(
          'Success',
          response['message'] ??
              'Signup successful',
        );

        resetSignUpFormUi();

        Get.toNamed(
          AppRoutes.getOtpScreen(),
          arguments: <String, dynamic>{
            'email': email,
            'source': OtpSource.signUp,
          },
        );

      } else if (statusCode == 409) {

        
        debugPrint('=====> [signUp controller] '
            'Account exists. Attempting to resend OTP for: $email');

        pendingOtpEmail.value = email;

        try {
          await AuthService.resendOtp(email: email);
        } catch (_) {
         
          debugPrint('=====> [signUp controller] '
              'resendOtp failed, navigating anyway.');
        }

        Get.snackbar(
          'Account Exists',
          'This email is already registered. '
              'Please verify your account with the OTP sent to your email.',
        );

        resetSignUpFormUi();

        Get.toNamed(
          AppRoutes.getOtpScreen(),
          arguments: <String, dynamic>{
            'email': email,
            'source': OtpSource.signUp,
          },
        );

      } else {

        Get.snackbar(
          'Error',
          response['message'] ??
              'Signup failed',
        );
      }

    } catch (e) {

      Get.snackbar(
        'Error',
        e.toString(),
      );

    } finally {

      isSigningUp.value = false;
    }
  }




Future<void> login() async {

  loginSubmitted.value = true;

  if (!(loginFormKey.currentState
          ?.validate() ??
      false)) {
    return;
  }

  try {

    isLoggingIn.value = true;

    final response =
        await AuthService.login(
      email: loginEmail,
      password: loginPassword,
    );

    print(
      'LOGIN RESULT => $response',
    );

  if (response['success'] == true) {

  await PrefsHelper.setString(
    'access_token',
    response['data']['access'],
  );

  await PrefsHelper.setInt(
    'user_id',
    response['data']['user']['id'],
  );

  await PrefsHelper.setString(
    'user_name',
    response['data']['user']['full_name'],
  );

  await PrefsHelper.setString(
    'user_email',
    response['data']['user']['email'],
  );

  print(
    'TOKEN => ${response['data']['access']}',
  );

  Get.snackbar(
    'Success',
    response['message'] ??
        'Login successful',
  );

  Get.toNamed(
    AppRoutes.otpScreen,
    arguments: {
      'email': loginEmail,
      'source': OtpSource.login,
    },
  );




    } else {

      Get.snackbar(
        'Error',
        response['message'] ??
            'Invalid credentials',
      );
    }

  } catch (e) {

    Get.snackbar(
      'Error',
      e.toString(),
    );

  } finally {

    isLoggingIn.value = false;
  }
}
  

  
 }