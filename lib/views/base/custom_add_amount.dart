import 'package:flutter/material.dart';
import 'package:flutter_extension/util/app_colors.dart';
import 'package:flutter_extension/util/app_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../helper/route_helper.dart';

class CustomAddAmount extends StatelessWidget {
  const CustomAddAmount({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: const [
          BoxShadow(
            color: Color(0x14000000),
            offset: Offset(0, 4),
            blurRadius: 8,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Row(
            children: [
              Container(
                width: 40.w,
  height: 40.w,
                
                decoration: BoxDecoration(
                  color:  Colors.white,
                  borderRadius: BorderRadius.circular(12.r),
                   border: Border.all(
      color: const Color(0xFFE5E7EB), 
      width: 0.5,
    ),
     boxShadow: const [
      BoxShadow(
        color: Color(0x1A000000), 
        offset: Offset(0, 2.86),
        blurRadius: 4.29,
        spreadRadius: -0.71,
      ),
    ],
                ),
                child: Center(
                  child: SvgPicture.asset(
                    'assets/images/payments.svg',
                    height: 22,
                    width: 22,
                     colorFilter: const ColorFilter.mode(
        Color(0xFF374151), 
        BlendMode.srcIn,
      ),
                  ),
                ),
              ),

              SizedBox(width: 10.w),

              Text(
                "Digital Wallet",
                style: AppFonts.custom(
                  size: 18.sp,
                  weight: FontWeight.w600,
                  color:  Colors.black,
                ),
              ),
            ],
          ),

          SizedBox(height: 16.h),

          
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 20.h),
            decoration: BoxDecoration(
              color: const Color(0xFFE5F1FF),
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: Column(
              children: [
                Text(
                  "Total",
                  style: AppFonts.custom(
                    size: 14.sp,
                    weight: FontWeight.w500,
                    color: AppColors.primaryColor,
                  ),
                ),

                // SizedBox(height: 2.h),

                Text(
                  "\$1,250",
                  style: AppFonts.custom(
                    size: 40.sp,
                    weight: FontWeight.w700,
                    color: AppColors.primaryColor,
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 16.h),

         
          SizedBox(
            width: double.infinity,
            height: 44.h,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
                shadowColor: Colors.transparent,
                padding: EdgeInsets.zero,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
              ),
              onPressed:(){
                Get.toNamed(AppRoutes.addAmount);
              },
              child: Ink(
                decoration: BoxDecoration(
                  gradient: AppColors.buttonColor,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Center(
                  child: Text(
                    "ADD AMOUNT",
                    style: AppFonts.custom(
                      size: 14.sp,
                      weight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}