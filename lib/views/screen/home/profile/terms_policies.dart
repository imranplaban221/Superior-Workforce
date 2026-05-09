import 'package:flutter/material.dart';
import 'package:flutter_extension/util/app_colors.dart';
import 'package:flutter_extension/util/app_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class TermsPolicies extends StatefulWidget {
  const TermsPolicies({super.key});

  @override
  State<TermsPolicies> createState() => _TermsPoliciesState();
}

class _TermsPoliciesState extends State<TermsPolicies> {
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
                    "Terms & Policies",
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
                      color: Color(0x14000000), // #00000014
                      offset: Offset(0, 4),
                      blurRadius: 4,
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    
                    Container(
                      width: 40.w,
                      height: 40.w,
                      padding: EdgeInsets.all(8.w),
                      decoration: BoxDecoration(
                        color: const Color(0xFFE6EDF3),
                        borderRadius: BorderRadius.circular(50.r),
                      ),
                      child: SvgPicture.asset(
                        'assets/images/privacy.svg', 
                        fit: BoxFit.contain,
                      ),
                    ),

                    SizedBox(height: 12.h),

                    Text(
                      "We value your privacy and are committed to protecting your personal information. Our platform collects essential data such as your profile details, professional credentials, and communication activity to provide a secure and efficient job-matching experience. All information is stored securely and used only to improve our services, verify user authenticity, and facilitate connections between healthcare professionals and employers. We do not sell or share your personal data with third parties without your consent, except when required by law. By using our app, you agree to our data practices designed to ensure safety, transparency, and trust.",
                      style: AppFonts.custom(
                        size: 14.sp,
                        weight: FontWeight.w400,
                        color:  Colors.black,
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