import 'package:flutter/material.dart';
import 'package:flutter_extension/controller/role_controller.dart';
import 'package:flutter_extension/helper/route_helper.dart';
import 'package:flutter_extension/util/app_text.dart';
import 'package:flutter_extension/views/base/custom_button.dart';
import 'package:flutter_extension/views/base/custom_role_card.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class RoleScreen extends GetView<RoleController> {
  const RoleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEDEFF2),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 22.h),
              Image.asset(
                'assets/images/logo2.png',
                width: 48.w,
                height: 40.h,
                fit: BoxFit.contain,
              ),
              SizedBox(height: 24.h),
              Text(
                'Welcome to Medistaff',
                style: AppFonts.custom(
                  size: 28,
                  weight: FontWeight.w500,
                  color: const Color(0xFF3D4A57),
                  height: 1.0,
                ),
              ),
              SizedBox(height: 10.h),
              Text(
                "Let's personalize your experience. How do you want to use the app?",
                style: AppFonts.custom(
                  size: 16,
                  weight: FontWeight.w400,
                  color: const Color(0xFF4B5563),
                  height: 1.2,
                ),
              ),
              SizedBox(height: 26.h),
              Obx(
                () => CustomRoleCard(
                  title: 'Healthcare Professional',
                  subtitle: 'I am looking for jobs',
                  description:
                      'Find healthcare positions that match your skills and experience',
                  iconPath: 'assets/images/role1.svg',
                  isSelected: controller.selectedRole.value == 0,
                  unselectedSubtitleColor: const Color(0xFF3E4955),
                  onTap: () => controller.selectedRole.value = 0,
                ),
              ),
              SizedBox(height: 16.h),
              Obx(
                () => CustomRoleCard(
                  title: 'Employer',
                  subtitle: 'I am hiring',
                  description:
                      'Post jobs and connect with qualified healthcare professionals',
                  iconPath: 'assets/images/role2.svg',
                  isSelected: controller.selectedRole.value == 1,
                  unselectedSubtitleColor: const Color(0xFF3E4955),
                  onTap: () => controller.selectedRole.value = 1,
                ),
              ),
              const Spacer(),
              CustomButton(
                text: 'Continue',
                onTap: () {
                  Get.toNamed(AppRoutes.loginScreen);
                },
                margin: EdgeInsets.only(bottom: 22.h),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
