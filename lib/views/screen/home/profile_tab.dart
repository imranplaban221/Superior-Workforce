import 'package:flutter/material.dart';
import 'package:flutter_extension/helper/route_helper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_extension/util/app_colors.dart';
import 'package:flutter_extension/util/app_text.dart';

import 'package:get/get.dart';

class ProfileTab extends StatefulWidget {
  const ProfileTab({super.key});

    

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              SizedBox(height: 16.h),

              
              Text(
                "Profile",
                style: AppFonts.custom(
                  size: 24.sp,
                  weight: FontWeight.w600,
                  color: Colors.black,
                ),
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

                    
                    Row(
                      children: [

                        
                        Container(
                          width: 64.w,
                          height: 64.w,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.grey.shade300),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: Image.asset(
                              'assets/images/cat.jpg',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),

                        SizedBox(width: 12.w),

                        
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              Row(
                                children: [
                                  Text(
                                    "Sarah Johnson",
                                    style: AppFonts.custom(
                                      size: 18.sp,
                                      weight: FontWeight.w600,
                                    ),
                                  ),

                                  SizedBox(width: 36.w),

                                  Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10.w, vertical: 6.h),
                          decoration: BoxDecoration(
                            color: const Color(0xFFFEF3C7),
                            borderRadius: BorderRadius.circular(20.r),
                          ),
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                'assets/images/star.svg',
                                height: 14.sp,
                                
                                colorFilter: const ColorFilter.mode(
                                  Color(0xFFF59E0B),
                                  BlendMode.srcIn,
                                ),
                              ),
                              SizedBox(width: 4.w),
                              Text(
                                "4.8",
                                style: AppFonts.custom(
                                  size: 14.sp,
                  weight: FontWeight.w600,
                                  
                                  color: const Color(0xFF92400E),
                                ),
                              ),
                            ],
                          ),
                        ),
                                ],
                              ),

                              SizedBox(height: 4.h),

                              Row(
                                children: [
                                  SvgPicture.asset(
                                    'assets/images/badge.svg',
                                    height: 16,
                                  ),
                                  SizedBox(width: 6.w),
                                  Text(
                                    "Registered Nurse",
                                    style: AppFonts.body(
                                      color: const Color(0xFF0074BE),
                                    ),
                                  ),
                                ],
                              ),

                              SizedBox(height: 4.h),

                              Row(
                                children: [
                                  SvgPicture.asset(
                                    'assets/images/location.svg',
                                    height: 14,
                                  ),
                                  SizedBox(width: 6.w),
                                  Text(
                                    "San Francisco, CA",
                                    style: AppFonts.body(),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),

                      
                        
                      ],
                    ),

                    SizedBox(height: 12.h),

                    Text(
                      "Motivated and detail-oriented individual seeking opportunities to apply my skills, grow professionally, and contribute effectively to a dynamic organization.",
                      style: AppFonts.custom(
                        size: 12.sp,
                                  weight: FontWeight.w400,
                        color: const Color(0xFF6B7280),
                      ),
                    ),

                    SizedBox(height: 16.h),

                    Container(
                      padding: EdgeInsets.all(16.w),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.r),
                        border: Border.all(
                          color: const Color(0xFFE5E7EB),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          Row(
                            children: [
                             Container(
  width: 32.w,
  height: 32.w,
 
  decoration: BoxDecoration(
    color: const Color(0xFF22C55E),
    borderRadius: BorderRadius.circular(12.r), 
  ),
  child: Center(
    child: SvgPicture.asset(
      'assets/images/score.svg',
      height: 12.h, 
      width: 20.w,
      colorFilter: const ColorFilter.mode(
        Colors.white,
        BlendMode.srcIn,
      ),
    ),
  ),
),

                              SizedBox(width: 10.w),

                              Text(
                                "Total Score",
                                style: AppFonts.custom(
                                  size: 16.sp,
                                  weight: FontWeight.w600,
                                ),
                              ),

                              const Spacer(),

                              Text(
                                "98",
                                style: AppFonts.custom(
                                  size: 24.sp,
                                  weight: FontWeight.w700,
                                  color: const Color(0xFF22C55E),
                                ),
                              ),
                            ],
                          ),

                          SizedBox(height: 12.h),

                          Container(
                            padding: EdgeInsets.all(12.w),
                            decoration: BoxDecoration(
                              color: const Color(0xFFD9E4F2),
                              borderRadius: BorderRadius.circular(12.r),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Unlock More Instant Accept Shifts",
                                  style: AppFonts.custom(
                                    size: 14.sp,
                                    weight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(height: 6.h),
                                Text(
                                  "A score above 90 qualifies you for more instant accept shift at participating facilities.",
                                  style: AppFonts.custom(
                                    size: 12.sp,
                                  weight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 16.h),

                    
                    SizedBox(
                      width: double.infinity,
                      height: 48.h,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.zero,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                        ),
                        onPressed: () {
                          Get.toNamed(AppRoutes.scoreSummery);
                        },
                        child: Ink(
                          decoration: BoxDecoration(
                            gradient: AppColors.buttonColor,
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                          child: Center(
                            child: Text(
                              "Score Summery",
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
              ),



              SizedBox(height: 20.h),



              Container(
  width: double.infinity,
  decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(16.r),
    border: Border.all(
      color: const Color(0xFFE7E8EA),
      width: 0.5,
    ),
    boxShadow: const [
      BoxShadow(
        color: Color(0x0A000000), // #0000000A
        offset: Offset(0, 4),
        blurRadius: 4,
      ),
    ],
  ),
  child: Column(
    children: [

      _menuItem(
        icon: 'assets/images/view_profile.svg',
        title: 'View Profile',
        onTap: () {
          Get.toNamed(AppRoutes.viewProfile);
        },
      ),

      _divider(),

      _menuItem(
        icon: 'assets/images/password.svg',
        title: 'Change Password',
        onTap: () {
          Get.toNamed(AppRoutes.changePass);
        },
      ),

      _divider(),

      _menuItem(
        icon: 'assets/images/terms.svg',
        title: 'Terms & Policies',
        onTap: () {
          Get.toNamed(AppRoutes.termsPolicies);
        },
      ),

      _divider(),

      _menuItem(
        icon: 'assets/images/profile.svg',
        title: 'About Us',
        onTap: () {
          Get.toNamed(AppRoutes.aboutUs);
        },
      ),

      _divider(),

      _menuItem(
        icon: 'assets/images/support.svg',
        title: 'Support',
        onTap: () {
          Get.toNamed(AppRoutes.support);
        },
      ),

      _divider(),

      _menuItem(
        icon: 'assets/images/delete.svg',
        title: 'Delete Account',
        onTap: () {
         showDeleteDialog(context);
        },
      ),

      _divider(),

      _menuItem(
        icon: 'assets/images/logout.svg',
        title: 'Log Out',
        isLogout: true,
        onTap: () {
          showLogoutDialog(context);
        },
      ),
    ],
  ),
),


              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget _divider() {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 16.w),
    child: Divider(
      height: 1,
      thickness: 1,
      color: const Color(0xFFE7E8EA),
    ),
  );
}


  Widget _menuItem({
  required String icon,
  required String title,
  required VoidCallback onTap,
  bool isLogout = false,
}) {
  return InkWell(
    onTap: onTap,
    borderRadius: BorderRadius.circular(12.r),
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      child: Row(
        children: [

          
          SvgPicture.asset(
            icon,
            height: 24,
            width: 24,
            colorFilter: ColorFilter.mode(
              isLogout ? Colors.red : const Color(0xFF374151),
              BlendMode.srcIn,
            ),
          ),

          SizedBox(width: 12.w),

          
          Expanded(
            child: Text(
              title,
              style: AppFonts.custom(
                size: 14.sp,
                weight: FontWeight.w500,
                color: isLogout
                    ? Colors.red
                    : const Color(0xFF374151),
              ),
            ),
          ),

          
          SvgPicture.asset(
            'assets/images/arrow_right.svg',
            height: 22.h,
            width: 22.w,
            colorFilter: const ColorFilter.mode(
              Colors.black,
              BlendMode.srcIn,
            ),
          ),
        ],
      ),
    ),
  );
}

void showLogoutDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierColor: Colors.black.withOpacity(0.5), 
    barrierDismissible: false,
    builder: (context) {
      return Dialog(
        backgroundColor: Colors.transparent,
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Are sure want to log \nout?",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF374151),
                  fontFamily: 'Inter',
                ),
              ),

              

              const SizedBox(height: 20),

              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Color(0xFF0074BE)),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () {
                        // Get.offAll(() =>  loginScreen());
                        
                          Get.toNamed(AppRoutes.loginScreen);
                      },
                      child: const Text(
                        "YES",
                        style: TextStyle(color: Color(0xFF0074BE)),
                      ),
                    ),
                  ),

                  const SizedBox(width: 10),

                  Expanded(
                    child: Container(
                      height: 36.h,
                      width: 156.w,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [
                            Color(0xFF004A8F),
                            Color(0xFF008290),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          shadowColor: Colors.transparent,
                        ),
                        onPressed: () {
                         
                          Get.back();
                        },
                        child: const Text("NO",
                        style: TextStyle(color: Colors.white),),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
}






void showDeleteDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierColor: Colors.black.withOpacity(0.5), 
    barrierDismissible: false,
    builder: (context) {
      return Dialog(
        backgroundColor: Colors.transparent,
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Are sure want to \ndelete account",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF374151),
                  fontFamily: 'Inter',
                ),
              ),

              

              const SizedBox(height: 20),

              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Color(0xFF0074BE)),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () {
                        // Get.offAll(() =>  loginScreen());
                        
                          Get.toNamed(AppRoutes.loginScreen);
                      },
                      child: const Text(
                        "YES",
                        style: TextStyle(color: Color(0xFF0074BE)),
                      ),
                    ),
                  ),

                  const SizedBox(width: 10),

                  Expanded(
                    child: Container(
                      height: 36.h,
                      width: 156.w,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [
                            Color(0xFF004A8F),
                            Color(0xFF008290),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          shadowColor: Colors.transparent,
                        ),
                        onPressed: () {
                         
                          Get.back();
                        },
                        child: const Text("NO",
                        style: TextStyle(color: Colors.white),),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
}
}