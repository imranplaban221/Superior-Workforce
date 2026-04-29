import 'package:flutter/material.dart';
import 'package:flutter_extension/controller/auth_controller.dart';
import 'package:flutter_extension/helper/route_helper.dart';
import 'package:flutter_extension/util/app_text.dart';
import 'package:flutter_extension/views/base/custom_button.dart';
import 'package:flutter_extension/views/base/custom_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class LogInScreen extends GetView<AuthController> {
  const LogInScreen({super.key});

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
              SizedBox(height: 22.h),
              Image.asset(
                'assets/images/logo2.png',
                width: 48.w,
                height: 40.h,
                fit: BoxFit.contain,
              ),
              SizedBox(height: 20.h),
              Text(
                'Welcome Back',
                style: AppFonts.custom(
                  size: 28.sp,
                  weight: FontWeight.w500,
                  color: const Color(0xFF3D4A57),
                  height: 1,
                ),
              ),
              SizedBox(height: 8.h),
              Text(
                'Sign in to continue your healthcare journey',
                style: AppFonts.custom(
                  size: 16,
                  weight: FontWeight.w400,
                  color: const Color(0xFF4B5563),
                ),
              ),
              SizedBox(height: 18.h),
              Obx(
                () => CustomLoginSignUpButtons(
                  selectedIndex: controller.loginSelectedTab.value,
                  onLoginTap: () => controller.loginSelectedTab.value = 0,
                  onSignUpTap: () {
                    controller.resetLoginFormUi();
                    Get.toNamed(AppRoutes.signUpScreen);
                  },
                ),
              ),
              SizedBox(height: 16.h),
              Obx(
                () => Form(
                  key: controller.loginFormKey,
                  autovalidateMode: controller.loginSubmitted.value
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
                    child: Column(
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
                          controller: controller.loginEmailController,
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
                          controller: controller.loginPasswordController,
                          hintText: 'Enter your password',
                          filColor: Colors.white,
                          contentPaddingHorizontal: 12.w,
                          contentPaddingVertical: 12.h,
                          isPassword: true,
                          obscure: '•',
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
                        SizedBox(height: 10.h),
                        Align(
                          alignment: Alignment.centerRight,
                          child: GestureDetector(
                            onTap: () {
                              controller.resetLoginFormUi();
                              Get.toNamed(AppRoutes.forgetPasswordScreen);
                            },
                            child: Text(
                              'Forgot Password?',
                              style: AppFonts.custom(
                                size: 14,
                                weight: FontWeight.w500,
                                color: const Color(0xFFEF4444),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const Spacer(),
              CustomButton(
                text: 'Log In',
                height: 48.h,
                onTap: () {
                  controller.loginSubmitted.value = true;
                  controller.loginFormKey.currentState?.validate();
                },
              ),
              SizedBox(height: 16.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Don't have an account? ",
                    style: AppFonts.custom(
                      size: 14,
                      weight: FontWeight.w400,
                      color: const Color(0xFF9CA3AF),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      controller.resetLoginFormUi();
                      Get.toNamed(AppRoutes.signUpScreen);
                    },
                    child: Text(
                      'Sign Up',
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
    );
  }
}
