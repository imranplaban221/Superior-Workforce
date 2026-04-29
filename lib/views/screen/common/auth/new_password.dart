import 'package:flutter/material.dart';
import 'package:flutter_extension/controller/auth_controller.dart';
import 'package:flutter_extension/helper/route_helper.dart';
import 'package:flutter_extension/util/app_text.dart';
import 'package:flutter_extension/views/base/custom_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class NewPasswordScreen extends GetView<AuthController> {
  const NewPasswordScreen({super.key});

  bool _hasMinLength(AuthController auth) =>
      auth.newPasswordController.text.length >= 8;
  bool _hasUppercase(AuthController auth) =>
      RegExp(r'[A-Z]').hasMatch(auth.newPasswordController.text);
  bool _hasLowercase(AuthController auth) =>
      RegExp(r'[a-z]').hasMatch(auth.newPasswordController.text);
  bool _hasNumber(AuthController auth) =>
      RegExp(r'\d').hasMatch(auth.newPasswordController.text);
  bool _hasSpecial(AuthController auth) =>
      RegExp(r'[^A-Za-z0-9]').hasMatch(auth.newPasswordController.text);
  bool _hasAnyPasswordInput(AuthController auth) =>
      auth.newPasswordController.text.isNotEmpty ||
      auth.newPasswordConfirmController.text.isNotEmpty;
  bool _passwordsMismatch(AuthController auth) =>
      auth.newPasswordConfirmController.text.isNotEmpty &&
      auth.newPasswordConfirmController.text !=
          auth.newPasswordController.text;

  int _strengthCount(AuthController auth) => <bool>[
        _hasMinLength(auth),
        _hasUppercase(auth),
        _hasLowercase(auth),
        _hasNumber(auth),
        _hasSpecial(auth),
      ].where((bool ok) => ok).length;

  bool _isStrongPassword(AuthController auth) =>
      _strengthCount(auth) >= 4;

  void _onUpdatePassword(AuthController auth) {
    auth.newPasswordSubmitted.value = true;
    final bool canContinue = !_passwordsMismatch(auth) &&
        auth.newPasswordController.text.isNotEmpty &&
        auth.newPasswordConfirmController.text.isNotEmpty;
    if (!canContinue) {
      return;
    }
    auth.clearNewPasswordForm();
    Get.toNamed(AppRoutes.confirmationScreen);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEDEFF2),
      appBar: AppBar(
        backgroundColor: const Color(0xFFEDEFF2),
        elevation: 0,
        leading: IconButton(
          onPressed: Get.back,
          icon: const Icon(Icons.arrow_back_rounded, color: Color(0xFF3D4A57)),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 8.h),
              Text(
                'Add New Password',
                style: AppFonts.custom(
                  size: 28,
                  weight: FontWeight.w500,
                  color: const Color(0xFF3D4A57),
                  height: 1.0,
                ),
              ),
              SizedBox(height: 8.h),
              Text(
                'Add new password at least 6 digit',
                style: AppFonts.custom(
                  size: 14,
                  weight: FontWeight.w400,
                  color: const Color(0xFF4B5563),
                ),
              ),
              SizedBox(height: 20.h),
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(16.w),
                decoration: BoxDecoration(
                  color: const Color(0xFFF7F8FA),
                  borderRadius: BorderRadius.circular(16.r),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      color: const Color(0x0A000000),
                      blurRadius: 8.r,
                      offset: Offset(0, 4.h),
                    ),
                  ],
                ),
                child: Obx(() {
                  controller.newPasswordUiTick.value;
                  controller.newPasswordSubmitted.value;
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'New Password',
                        style: AppFonts.custom(
                          size: 14,
                          weight: FontWeight.w500,
                          color: const Color(0xFF3D4A57),
                        ),
                      ),
                      SizedBox(height: 8.h),
                      _passwordField(
                        controller: controller.newPasswordController,
                        obscureText: controller.newPasswordObscure.value,
                        hint: 'Enter new password',
                        onToggleVisibility: () {
                          controller.newPasswordObscure.value =
                              !controller.newPasswordObscure.value;
                        },
                        onChanged: (_) => controller.bumpNewPasswordUi(),
                      ),
                      SizedBox(height: 12.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            'Password Strength',
                            style: AppFonts.custom(
                              size: 13,
                              weight: FontWeight.w500,
                              color: const Color(0xFF4B5563),
                            ),
                          ),
                          Text(
                            _isStrongPassword(controller)
                                ? 'Strong'
                                : 'Weak',
                            style: AppFonts.custom(
                              size: 11,
                              weight: FontWeight.w500,
                              color: _isStrongPassword(controller)
                                  ? const Color(0xFF16A34A)
                                  : const Color(0xFFEF4444),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 8.h),
                      Row(
                        children: List<Widget>.generate(5, (int i) {
                          final bool active =
                              i < _strengthCount(controller);
                          return Expanded(
                            child: Container(
                              margin: EdgeInsets.only(right: i < 4 ? 4.w : 0),
                              height: 3.h,
                              decoration: BoxDecoration(
                                color: active
                                    ? (_isStrongPassword(controller)
                                        ? const Color(0xFF16A34A)
                                        : const Color(0xFFEF4444))
                                    : const Color(0xFFE5E7EB),
                                borderRadius: BorderRadius.circular(99.r),
                              ),
                            ),
                          );
                        }),
                      ),
                      SizedBox(height: 12.h),
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(
                          horizontal: 12.w,
                          vertical: 10.h,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFFDCE4EF),
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Password must contain:',
                              style: AppFonts.custom(
                                size: 11,
                                weight: FontWeight.w500,
                                color: const Color(0xFF3E4955),
                              ),
                            ),
                            SizedBox(height: 6.h),
                            _ruleLine(
                                'At least 8 character', _hasMinLength(controller)),
                            _ruleLine('one uppercase letter',
                                _hasUppercase(controller)),
                            _ruleLine('one lowercase letter',
                                _hasLowercase(controller)),
                            _ruleLine('one number', _hasNumber(controller)),
                            _ruleLine('one special character',
                                _hasSpecial(controller)),
                          ],
                        ),
                      ),
                      SizedBox(height: 14.h),
                      Text(
                        'Confirm Password',
                        style: AppFonts.custom(
                          size: 14,
                          weight: FontWeight.w500,
                          color: const Color(0xFF3D4A57),
                        ),
                      ),
                      SizedBox(height: 8.h),
                      _passwordField(
                        controller: controller.newPasswordConfirmController,
                        obscureText:
                            controller.newPasswordConfirmObscure.value,
                        hint: 'Confirm your password',
                        onToggleVisibility: () {
                          controller.newPasswordConfirmObscure.value =
                              !controller.newPasswordConfirmObscure.value;
                        },
                        onChanged: (_) => controller.bumpNewPasswordUi(),
                      ),
                      if (controller.newPasswordSubmitted.value &&
                          _hasAnyPasswordInput(controller) &&
                          _passwordsMismatch(controller))
                        ...<Widget>[
                          SizedBox(height: 8.h),
                          Text(
                            'Passwords do not match.',
                            style: AppFonts.custom(
                              size: 12,
                              weight: FontWeight.w500,
                              color: const Color(0xFFEF4444),
                            ),
                          ),
                        ],
                    ],
                  );
                }),
              ),
              const Spacer(),
              CustomButton(
                text: 'Update Password',
                onTap: () => _onUpdatePassword(controller),
                margin: EdgeInsets.only(bottom: 22.h),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _passwordField({
    required TextEditingController controller,
    required bool obscureText,
    required String hint,
    required VoidCallback onToggleVisibility,
    ValueChanged<String>? onChanged,
  }) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      onChanged: onChanged,
      cursorColor: const Color(0xFF0074BE),
      style: TextStyle(
        fontFamily: 'Inter',
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
        color: const Color(0xFF3E4955),
      ),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(
          fontFamily: 'Inter',
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
          color: const Color(0xFF9CA3AF),
        ),
        prefixIcon: Padding(
          padding: EdgeInsets.all(12.w),
          child: SvgPicture.asset(
            'assets/images/lock.svg',
            width: 18.w,
            height: 18.h,
            fit: BoxFit.contain,
          ),
        ),
        suffixIcon: IconButton(
          onPressed: onToggleVisibility,
          icon: Icon(
            obscureText
                ? Icons.visibility_outlined
                : Icons.visibility_off_outlined,
            color: const Color(0xFF9CA3AF),
            size: 20.w,
          ),
        ),
        filled: true,
        fillColor: Colors.white,
        contentPadding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(color: const Color(0xFFE5E7EB), width: 1.w),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(color: const Color(0xFF0074BE), width: 1.w),
        ),
      ),
    );
  }

  Widget _ruleLine(String text, bool ok) {
    return Padding(
      padding: EdgeInsets.only(top: 2.h),
      child: Row(
        children: <Widget>[
          Text(
            ok ? '✓' : '×',
            style: AppFonts.custom(
              size: 11,
              weight: FontWeight.w500,
              color: ok ? const Color(0xFF16A34A) : const Color(0xFF6B7280),
            ),
          ),
          SizedBox(width: 6.w),
          Text(
            text,
            style: AppFonts.custom(
              size: 11,
              weight: FontWeight.w400,
              color: ok ? const Color(0xFF16A34A) : const Color(0xFF3E4955),
            ),
          ),
        ],
      ),
    );
  }
}
