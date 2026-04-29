import 'package:flutter/material.dart';
import 'package:flutter_extension/controller/auth_controller.dart';
import 'package:flutter_extension/helper/route_helper.dart';
import 'package:flutter_extension/util/otp_source.dart';
import 'package:get/get.dart';

class OtpController extends GetxController {
  final RxInt uiTick = 0.obs;

  String? email;
  OtpSource source = OtpSource.forgotPassword;

  AuthController get auth => Get.find<AuthController>();

  void _bumpUi() => uiTick.value++;

  @override
  void onInit() {
    super.onInit();
    final Map<String, dynamic> args =
        (Get.arguments as Map<String, dynamic>?) ?? <String, dynamic>{};
    email = args['email'] as String?;
    source = args['source'] as OtpSource? ?? OtpSource.forgotPassword;

    auth.clearOtpFields();
    for (final FocusNode node in auth.otpFocusNodes) {
      node.addListener(_bumpUi);
    }
    for (final TextEditingController c in auth.otpDigitControllers) {
      c.addListener(_bumpUi);
    }
  }

  @override
  void onClose() {
    for (final FocusNode node in auth.otpFocusNodes) {
      node.removeListener(_bumpUi);
    }
    for (final TextEditingController c in auth.otpDigitControllers) {
      c.removeListener(_bumpUi);
    }
    super.onClose();
  }

  String maskedEmail(String value) {
    final String trimmed = value.trim();
    if (trimmed.isEmpty) {
      return 'your email';
    }
    final int at = trimmed.indexOf('@');
    if (at <= 0 || at == trimmed.length - 1) {
      return trimmed;
    }
    final String local = trimmed.substring(0, at);
    final String domainFull = trimmed.substring(at + 1);
    final int dot = domainFull.lastIndexOf('.');
    final String domainName =
        dot > 0 ? domainFull.substring(0, dot) : domainFull;
    final String tld = dot > 0 ? domainFull.substring(dot) : '';
    final String prefix = domainName.length > 4
        ? domainName.substring(0, 4)
        : domainName;
    return '$local@$prefix***$tld';
  }

  void onDigitChanged(int index, String value) {
    if (value.isEmpty) {
      if (index > 0) {
        auth.otpFocusNodes[index - 1].requestFocus();
      }
      _bumpUi();
      return;
    }
    if (value.length > 1) {
      auth.otpDigitControllers[index].text =
          value.substring(value.length - 1);
      auth.otpDigitControllers[index].selection =
          const TextSelection.collapsed(offset: 1);
    }
    if (value.isNotEmpty && index < 5) {
      auth.otpFocusNodes[index + 1].requestFocus();
    }
    _bumpUi();
  }

  void goToLogin() {
    auth.clearOtpFields();
    Get.offAllNamed(AppRoutes.loginScreen);
  }

  bool get isOtpComplete => auth.otpDigitControllers
      .every((TextEditingController c) => c.text.trim().isNotEmpty);

  void verifyAndContinue() {
    if (!isOtpComplete) {
      return;
    }
    auth.clearOtpFields();
    if (source == OtpSource.signUp) {
      Get.toNamed(AppRoutes.completeSignUpScreen);
      return;
    }
    if (source == OtpSource.forgotPassword) {
      Get.toNamed(AppRoutes.confirmationScreen);
      return;
    }
    Get.toNamed(AppRoutes.newPasswordScreen);
  }
}
