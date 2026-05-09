import 'package:flutter/material.dart';
import 'package:flutter_extension/util/app_colors.dart';
import 'package:flutter_extension/util/app_text.dart';
import 'package:flutter_extension/views/base/custom_text_field.dart'; 
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ChangePass extends StatefulWidget {
  const ChangePass({super.key});

  @override
  State<ChangePass> createState() => _ChangePassState();
}

class _ChangePassState extends State<ChangePass> {
  final TextEditingController oldPassController = TextEditingController();
  final TextEditingController newPassController = TextEditingController();
  final TextEditingController confirmPassController = TextEditingController();

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
                    "Change Password",
                    style: AppFonts.custom(
                      size: 20.sp,
                      weight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),

              SizedBox(height: 24.h),

              _label("Old Password"),
              SizedBox(height: 8.h),
              _styledField(oldPassController),

              SizedBox(height: 16.h),

              
              _label("New Password"),
              SizedBox(height: 8.h),
              _styledField(newPassController),

              SizedBox(height: 16.h),

              
              _label("Confirm Password"),
              SizedBox(height: 8.h),
              _styledField(confirmPassController),

              const Spacer(),

             
              SizedBox(
                width: double.infinity,
                height: 48.h,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.zero,
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                  ),
                  onPressed: () {
                    if (newPassController.text !=
                        confirmPassController.text) {
                      Get.snackbar(
                        "Error",
                        "Passwords do not match",
                        backgroundColor: Colors.red,
                        colorText: Colors.white,
                      );
                    }
                  },
                  child: Ink(
                    decoration: BoxDecoration(
                      gradient: AppColors.buttonColor,
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Center(
                      child: Text(
                        "CHANGE NOW",
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

              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }

 
  Widget _label(String text) {
    return Text(
      text,
      style: AppFonts.custom(
        size: 14.sp,
        weight: FontWeight.w500,
        color: const Color(0xFF374151),
      ),
    );
  }

  Widget _styledField(TextEditingController controller) {
    return Container(
      height: 50.h,
      padding: EdgeInsets.only(
  left: 16.w,
  right: 8.w, 
),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(
          color: const Color(0xFFE7E8EA),
          width: 0.5,
        ),
        boxShadow: const [
          BoxShadow(
            color: Color(0x14000000),
            offset: Offset(0, 3),
            blurRadius: 8,
          ),
        ],
      ),
      child: CustomTextField(
        controller: controller,
        hintText: "Enter password",
        isPassword: true,
        
        filColor: Colors.transparent,
        showBorder: false,
        contentPaddingHorizontal: 8.w,
        contentPaddingVertical: 16.h,
        prefixIcon: Padding(
          padding: EdgeInsets.only(right: 8.w),
          child: SvgPicture.asset(
            'assets/images/lock.svg',
            height: 24,
            width: 24,
            colorFilter: const ColorFilter.mode(
              Color(0xFF9CA3AF),
              BlendMode.srcIn,
            ),
          ),
        ),
      ),
    );
  }
}