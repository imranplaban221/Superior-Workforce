import 'package:flutter/material.dart';
import 'package:flutter_extension/controller/auth_controller.dart';
import 'package:flutter_extension/helper/route_helper.dart';
import 'package:flutter_extension/util/app_text.dart';
import 'package:flutter_extension/util/otp_source.dart';
import 'package:flutter_extension/views/base/custom_button.dart';
import 'package:flutter_extension/views/base/custom_image_picker.dart';
import 'package:flutter_extension/views/base/custom_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class SignUpScreen extends GetView<AuthController> {
  const SignUpScreen({super.key});

  bool _hasMinLength(AuthController auth) =>
      auth.signUpPasswordController.text.length >= 8;
  bool _hasUppercase(AuthController auth) =>
      RegExp(r'[A-Z]').hasMatch(auth.signUpPasswordController.text);
  bool _hasLowercase(AuthController auth) =>
      RegExp(r'[a-z]').hasMatch(auth.signUpPasswordController.text);
  bool _hasNumber(AuthController auth) =>
      RegExp(r'\d').hasMatch(auth.signUpPasswordController.text);
  bool _hasSpecial(AuthController auth) =>
      RegExp(r'[^A-Za-z0-9]').hasMatch(auth.signUpPasswordController.text);

  int _strengthCount(AuthController auth) => <bool>[
        _hasMinLength(auth),
        _hasUppercase(auth),
        _hasLowercase(auth),
        _hasNumber(auth),
        _hasSpecial(auth),
      ].where((bool ok) => ok).length;

  bool _isStrongPassword(AuthController auth) => _strengthCount(auth) >= 4;

  void _goToLogin(AuthController auth) {
    auth.resetSignUpFormUi();
    Get.offAllNamed(AppRoutes.loginScreen);
  }

  void _onSignUpTap(AuthController auth) {
    auth.signUpSubmitted.value = true;
    if (auth.signUpFormKey.currentState?.validate() ?? false) {
      final String email = auth.signUpEmail;
      auth.pendingOtpEmail.value = email;
      auth.clearSignUpForm();
      auth.signUpSubmitted.value = false;
      auth.signUpFormKey.currentState?.reset();
      Get.toNamed(
        AppRoutes.getOtpScreen(),
        arguments: <String, dynamic>{
          'email': email,
          'source': OtpSource.signUp,
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEDEFF2),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints viewport) =>
              SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: viewport.maxHeight),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 22.h),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Image.asset(
                        'assets/images/logo2.png',
                        width: 48.w,
                        height: 40.h,
                        fit: BoxFit.contain,
                      ),
                      const Spacer(),
                      Obx(
                        () => CustomImagePicker(
                          imageBytes: controller.signUpProfileImageBytes.value,
                          onTap: controller.pickSignUpProfileImage,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.h),
                  Text(
                    'Create Account',
                    style: AppFonts.custom(
                      size: 28.sp,
                      weight: FontWeight.w500,
                      color: const Color(0xFF3D4A57),
                      height: 1,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    'Join thousands of healthcare professionals',
                    style: AppFonts.custom(
                      size: 16,
                      weight: FontWeight.w400,
                      color: const Color(0xFF4B5563),
                    ),
                  ),
                  SizedBox(height: 18.h),
                  CustomLoginSignUpButtons(
                    selectedIndex: 1,
                    onLoginTap: () => _goToLogin(controller),
                    onSignUpTap: () {},
                  ),
                  SizedBox(height: 16.h),
                  Obx(
                    () => Form(
                      key: controller.signUpFormKey,
                      autovalidateMode: controller.signUpSubmitted.value
                          ? AutovalidateMode.onUserInteraction
                          : AutovalidateMode.disabled,
                      child: Container(
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
                          controller.signUpUiTick.value;
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'Email',
                                style: AppFonts.custom(
                                  size: 14,
                                  weight: FontWeight.w500,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(height: 8.h),
                              CustomTextField(
                                controller: controller.signUpEmailController,
                                hintText: 'Enter email address',
                                filColor: Colors.white,
                                contentPaddingHorizontal: 12.w,
                                contentPaddingVertical: 12.h,
                                isEmail: true,
                                prefixIcon: Icon(
                                  Icons.mail_outline,
                                  color: const Color(0xFF9CA3AF),
                                  size: 18.w,
                                ),
                              ),
                              SizedBox(height: 12.h),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                      margin: EdgeInsets.only(
                                          right: i < 4 ? 4.w : 0),
                                      height: 3.h,
                                      decoration: BoxDecoration(
                                        color: active
                                            ? (_isStrongPassword(controller)
                                                ? const Color(0xFF16A34A)
                                                : const Color(0xFFEF4444))
                                            : const Color(0xFFE5E7EB),
                                        borderRadius:
                                            BorderRadius.circular(99.r),
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
                                    _ruleLine('At least 8 characters',
                                        _hasMinLength(controller)),
                                    _ruleLine('One uppercase letter',
                                        _hasUppercase(controller)),
                                    _ruleLine('One lowercase letter',
                                        _hasLowercase(controller)),
                                    _ruleLine(
                                        'One number', _hasNumber(controller)),
                                    _ruleLine('One special character',
                                        _hasSpecial(controller)),
                                  ],
                                ),
                              ),
                              SizedBox(height: 14.h),
                              Text(
                                'Password',
                                style: AppFonts.custom(
                                  size: 14,
                                  weight: FontWeight.w500,
                                  color: const Color(0xFF3D4A57),
                                ),
                              ),
                              SizedBox(height: 8.h),
                              CustomTextField(
                                controller:
                                    controller.signUpPasswordController,
                                hintText: 'Enter your password',
                                filColor: Colors.white,
                                contentPaddingHorizontal: 12.w,
                                contentPaddingVertical: 12.h,
                                isPassword: true,
                                obscure: '•',
                                onChanged: (_) => controller.bumpSignUpUi(),
                                prefixIcon: Padding(
                                  padding: EdgeInsets.all(2.w),
                                  child: SvgPicture.asset(
                                    'assets/images/lock.svg',
                                    width: 18.w,
                                    height: 18.h,
                                    fit: BoxFit.contain,
                                  ),
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
                              CustomTextField(
                                controller: controller
                                    .signUpConfirmPasswordController,
                                hintText: 'Confirm your password',
                                filColor: Colors.white,
                                contentPaddingHorizontal: 12.w,
                                contentPaddingVertical: 12.h,
                                validator: (dynamic value) {
                                  final String v = (value ?? '').toString();
                                  if (v.isEmpty) {
                                    return 'Please enter confirm your password';
                                  }
                                  if (v !=
                                      controller
                                          .signUpPasswordController.text) {
                                    return 'Passwords do not match.';
                                  }
                                  return null;
                                },
                                isPassword: true,
                                obscure: '•',
                                onChanged: (_) => controller.bumpSignUpUi(),
                                prefixIcon: Padding(
                                  padding: EdgeInsets.all(2.w),
                                  child: SvgPicture.asset(
                                    'assets/images/lock.svg',
                                    width: 18.w,
                                    height: 18.h,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                            ],
                          );
                        }),
                      ),
                    ),
                  ),
                  SizedBox(height: 20.h),
                  CustomButton(
                    text: 'Sign Up',
                    height: 48.h,
                    onTap: () => _onSignUpTap(controller),
                  ),
                  SizedBox(height: 16.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Already have an account? ',
                        style: AppFonts.custom(
                          size: 14,
                          weight: FontWeight.w400,
                          color: const Color(0xFF9CA3AF),
                        ),
                      ),
                      GestureDetector(
                        onTap: () => _goToLogin(controller),
                        child: Text(
                          'Log In',
                          style: AppFonts.custom(
                            size: 14,
                            weight: FontWeight.w600,
                            color: const Color(0xFF0074BE),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 22.h),
                ],
              ),
            ),
          ),
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
