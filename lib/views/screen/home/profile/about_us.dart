import 'package:flutter/material.dart';
import 'package:flutter_extension/util/app_colors.dart';
import 'package:flutter_extension/util/app_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({super.key});

  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,

      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              SizedBox(height: 16.h),

       
              Row(
                children: [
                  GestureDetector(
                    onTap: () => Get.back(),
                    child: const Icon(Icons.arrow_back),
                  ),

                  SizedBox(width: 12.w),

                  Text(
                    "About Us",
                    style: AppFonts.custom(
                      size: 24.sp,
                      weight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),

              SizedBox(height: 16.h),

           
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(20.w),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16.r),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x14000000),
                      offset: Offset(0, 4),
                      blurRadius: 4,
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    
                    Image.asset(
                      'assets/images/logo.png',
                      width: 48.w,
                      height: 48.h,
                      fit: BoxFit.contain,
                    ),

                    SizedBox(height: 12.h),

                
                    Text(
                      "We are a dedicated healthcare job marketplace designed to connect skilled professionals—doctors, nurses, and CNAs—with trusted hospitals and clinics. Our platform simplifies the hiring process by providing a fast, transparent, and reliable way to discover opportunities and fill urgent staffing needs. Whether you're seeking your next role or looking to hire qualified talent, we ensure a seamless experience with verified profiles, real-time communication, and smart matching. Our mission is to support the healthcare community by making staffing more efficient, accessible, and dependable for everyone.",
                      style: AppFonts.custom(
                        size: 14.sp,
                        weight: FontWeight.w400,
                        color: Colors.black,
                        height: 1.5,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}