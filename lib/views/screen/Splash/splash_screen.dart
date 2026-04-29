import 'package:flutter/material.dart';
import 'package:flutter_extension/controller/splash_controller.dart';
import 'package:flutter_extension/util/app_colors.dart';
import 'package:flutter_extension/util/app_text.dart';
import 'package:flutter_extension/util/images.dart';
import 'package:flutter_extension/views/base/custom_loading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SplashScreen extends GetView<SplashController> {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(Images.logo, fit: BoxFit.contain),
          SizedBox(height: 16.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Text(
              'Connecting professionals with the right opportunities, anytime, anywhere.',
              textAlign: TextAlign.center,
              style: AppFonts.custom(
                size: 16,
                weight: FontWeight.w400,
                color: AppColors.blackSwatch.shade500,
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: SafeArea(
        child: Container(
          height: 60.h,
          alignment: Alignment.center,
          child: CustomLoadingText(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: AppColors.primaryColor,
          ),
        ),
      ),
    );
  }
}
