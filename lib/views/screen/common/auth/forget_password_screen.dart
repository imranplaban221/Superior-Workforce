import 'package:flutter/material.dart';
import 'package:flutter_extension/controller/auth_controller.dart';
import 'package:flutter_extension/helper/route_helper.dart';
import 'package:flutter_extension/util/app_text.dart';
import 'package:flutter_extension/util/otp_source.dart';
import 'package:flutter_extension/views/base/custom_button.dart';
import 'package:flutter_extension/views/base/custom_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ForgetPasswordScreen extends GetView<AuthController> {
  const ForgetPasswordScreen({super.key});

  void _goToOtp(AuthController auth) {
    if (auth.forgotPasswordFormKey.currentState?.validate() ?? false) {
      final String email = auth.forgotPasswordEmail;
      auth.pendingOtpEmail.value = email;
      auth.resetForgotPasswordFormUi();
      Get.toNamed(
        AppRoutes.getOtpScreen(),
        arguments: <String, dynamic>{
          'email': email,
          'source': OtpSource.forgotPassword,
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEDEFF2),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 8.h),
              IconButton(
                onPressed: Get.back,
                padding: EdgeInsets.zero,
                alignment: Alignment.centerLeft,
                icon: Icon(
                  Icons.arrow_back_rounded,
                  size: 32,
                  color: const Color(0xFF3D4A57),
                ),
              ),
              SizedBox(height: 12.h),
              Text(
                'Forgot Password?',
                style: AppFonts.custom(
                  size: 28.sp,
                  weight: FontWeight.w500,
                  color: const Color(0xFF3D4A57),
                  height: 1,
                ),
              ),
              SizedBox(height: 8.h),
              Text(
                'No worries, you can recover your password.',
                style: AppFonts.custom(
                  size: 16,
                  weight: FontWeight.w400,
                  color: const Color(0xFF4B5563),
                  height: 1.2,
                ),
              ),
              SizedBox(height: 24.h),
              Container(
                width: 390.w,
                constraints: BoxConstraints(minHeight: 175.h),
                padding: EdgeInsets.only(
                  top: 32.h,
                  right: 20.w,
                  bottom: 32.h,
                  left: 20.w,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFFF7F8FA),
                  borderRadius: BorderRadius.circular(20.r),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      color: const Color(0x0A000000),
                      blurRadius: 8.r,
                      offset: Offset(0, 4.h),
                    ),
                  ],
                ),
                child: Form(
                  key: controller.forgotPasswordFormKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
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
                        controller: controller.forgotPasswordEmailController,
                        keyboardType: TextInputType.emailAddress,
                        hintText: 'Enter email address',
                        filColor: Colors.white,
                        contentPaddingHorizontal: 12.w,
                        contentPaddingVertical: 12.h,
                        isEmail: true,
                        borderRadius: 12.r,
                        prefixIcon: Icon(
                          Icons.mail_outline,
                          color: const Color(0xFF9CA3AF),
                          size: 18.w,
                        ),
                      ),
                      SizedBox(height: 12.h),
                      Text(
                        'Enter your registered email or phone. You will '
                        'receive a 6 digit code to create a new password.',
                        style: AppFonts.custom(
                          size: 14,
                          weight: FontWeight.w400,
                          color: const Color(0xFF6B7280),
                          height: 1.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const Spacer(),
              CustomButton(
                text: 'Send Code',
                height: 48.h,
                onTap: () => _goToOtp(controller),
              ),
              SizedBox(height: 16.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Remember Password? ',
                    style: AppFonts.custom(
                      size: 14,
                      weight: FontWeight.w400,
                      color: const Color(0xFF9CA3AF),
                      height: 1.0,
                    ),
                  ),
                  GestureDetector(
                    onTap: Get.back,
                    child: Text(
                      'Back to Log In',
                      style: AppFonts.custom(
                        size: 14,
                        weight: FontWeight.w600,
                        color: const Color(0xFF0074BE),
                        height: 1.0,
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
    );
  }
}
