import 'package:flutter/material.dart';
import 'package:flutter_extension/helper/route_helper.dart';
import 'package:flutter_extension/util/app_text.dart';
import 'package:flutter_extension/views/base/custom_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CompleteSignUpScreen extends StatelessWidget {
  const CompleteSignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEDEFF2),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            children: <Widget>[
              SizedBox(height: 8.h),
              Align(
                alignment: Alignment.centerLeft,
                child: IconButton(
                  onPressed: Get.back,
                  padding: EdgeInsets.zero,
                  icon: Icon(
                    Icons.arrow_back_rounded,
                    size: 20.w,
                    color: const Color(0xFF3D4A57),
                  ),
                ),
              ),
              const Spacer(),
              SvgPicture.asset(
                'assets/images/confirmation.svg',
                width: 64.w,
                height: 64.h,
                fit: BoxFit.contain,
              ),
              SizedBox(height: 5.h),
              Text(
                'Account Created\nSuccessfully',
                textAlign: TextAlign.center,
                style: AppFonts.custom(
                  size: 24.sp,
                  weight: FontWeight.w500,
                  color: const Color(0xFF3D4A57),
                  height: 1.0,
                ),
              ),
              SizedBox(height: 16.h),
              Text(
                'Your account has been created successfully. You can now'
                'set up your profile.',
                textAlign: TextAlign.center,
                style: AppFonts.custom(
                  size: 14,
                  weight: FontWeight.w400,
                  color: const Color(0xFF4B5563),
                  height: 1.2,
                ),
              ),
              const Spacer(),
              CustomButton(
                text: 'Next',
                onTap: () => Get.toNamed(AppRoutes.personalInfoScreen),
                margin: EdgeInsets.only(bottom: 22.h),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
