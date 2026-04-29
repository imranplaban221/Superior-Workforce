import 'package:flutter/material.dart';
import 'package:flutter_extension/helper/route_helper.dart';
import 'package:flutter_extension/util/app_text.dart';
import 'package:flutter_extension/views/base/custom_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ConfirmationScreen extends StatelessWidget {
  const ConfirmationScreen({super.key});

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
            children: <Widget>[
              const Spacer(),
              SvgPicture.asset(
                'assets/images/confirmation.svg',
                width: 64.w,
                height: 64.h,
                fit: BoxFit.contain,
              ),
              SizedBox(height: 5.h),
              Text(
                'Password\nSuccessfully Updated',
                textAlign: TextAlign.center,
                style: AppFonts.custom(
                  size: 24,
                  weight: FontWeight.w500,
                  color: const Color(0xFF3D4A57),
                  height: 1.0,
                ),
              ),
              SizedBox(height: 16.h),
              Text(
                'Your password has been changed successfully. You can'
                'now login with your new password.',
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
                text: 'Back to Log In',
                onTap: () => Get.offAllNamed(AppRoutes.loginScreen),
                margin: EdgeInsets.only(bottom: 22.h),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
