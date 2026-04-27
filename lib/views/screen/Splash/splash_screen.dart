import 'package:flutter/material.dart';
import 'package:flutter_extension/controller/splash_controller.dart';
import 'package:flutter_extension/helper/route_helper.dart';
import 'package:flutter_extension/util/app_colors.dart';
import 'package:flutter_extension/util/app_text.dart';
import 'package:flutter_extension/util/images.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 2), () {
      Get.find<SplashController>().jumpNextScreen();
    });
  }

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
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'Connecting professionals with the right opportunities, anytime, anywhere.',
              textAlign: TextAlign.center,
              style: AppFonts.custom(
                size: 16,
                weight: FontWeight.w400,
                color: AppColors.blackColor,
              ),
            ),
          ),
        ],
      ),

      bottomNavigationBar: SafeArea(
        child: Container(
          height: 60.h,
          alignment: Alignment.center,
          child: Text(
            'Loading...',
            style: AppFonts.custom(
              size: 14,
              weight: FontWeight.w500,
              color: AppColors.primaryColor,
            ),
          ),
        ),
      ),
    );
  }
}
