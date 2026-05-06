import 'package:flutter/material.dart';
import 'package:flutter_extension/controller/profile_progress_controller.dart';
import 'package:flutter_extension/helper/route_helper.dart';
import 'package:flutter_extension/util/app_text.dart';
import 'package:flutter_extension/views/base/custom_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ProfileSummery extends StatelessWidget {
  const ProfileSummery({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ProfileProgressController>();

    return Scaffold(
      backgroundColor: const Color(0xFFF3F4F6),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 8.h),
              Row(
                children: [
                  IconButton(
                    onPressed: Get.back,
                    icon: Icon(Icons.arrow_back, size: 22.w),
                    padding: EdgeInsets.zero,
                  ),
                  SizedBox(width: 6.w),
                  Text(
                    "Profile Summery",
                    style: AppFonts.custom(
                      size: 22.sp,
                      weight: FontWeight.w600,
                      color: const Color(0xFF374151),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8.h),
              Padding(
                padding: EdgeInsets.only(left: 44.w, right: 16.w),
                child: Text(
                  "Your uploaded documents will be reviewed, and we will provide you with an update shortly.",
                  style: AppFonts.custom(
                    size: 13,
                    weight: FontWeight.w400,
                    color: const Color(0xFF6B7280),
                  ),
                ),
              ),
              SizedBox(height: 40.h),
              Center(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    SizedBox(
                      width: 180.w,
                      height: 180.w,
                      child: Obx(() => CircularProgressIndicator(
                        value: controller.profileStrength.value / 100,
                        strokeWidth: 15.w,
                        backgroundColor: const Color(0xFFE5E7EB),
                        valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFF0074BE)),
                      )),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Obx(() => Text(
                          "${controller.profileStrength.value}%",
                          style: AppFonts.custom(
                            size: 36.sp,
                            weight: FontWeight.w700,
                            color: const Color(0xFF374151),
                          ),
                        )),
                        Text(
                          "Complete",
                          style: AppFonts.custom(
                            size: 14,
                            weight: FontWeight.w500,
                            color: const Color(0xFF6B7280),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 40.h),
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(20.w),
                decoration: BoxDecoration(
                  color: const Color(0xFF22C55E),
                  borderRadius: BorderRadius.circular(16.r),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.1),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Profile Strength",
                          style: AppFonts.custom(
                            size: 18.sp,
                            weight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                        Obx(() => Text(
                          "${controller.profileStrength.value}%",
                          style: AppFonts.custom(
                            size: 18.sp,
                            weight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        )),
                      ],
                    ),
                    SizedBox(height: 12.h),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10.r),
                      child: Obx(() => LinearProgressIndicator(
                        value: controller.profileStrength.value / 100,
                        minHeight: 8.h,
                        backgroundColor: Colors.white.withValues(alpha: 0.3),
                        valueColor: const AlwaysStoppedAnimation<Color>(Colors.white),
                      )),
                    ),
                    SizedBox(height: 16.h),
                    Text(
                      "Your profile is looking great! Complete your documents to reach 100%.",
                      style: AppFonts.custom(
                        size: 13,
                        weight: FontWeight.w400,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 220.h),
              SummaryActionButtons(
                  primaryText: "Complete Profile Set Up",
                  secondaryText: "Skip it For Now",
                  onPrimaryTap: () =>
                      Get.toNamed(AppRoutes.homeScreen),
                  onSecondaryTap: () =>  Get.toNamed(AppRoutes.homeScreen),
                ),
                   
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }
}
