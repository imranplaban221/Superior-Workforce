// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_extension/helper/route_helper.dart';
import 'package:flutter_extension/util/app_colors.dart';
import 'package:flutter_extension/util/app_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class EmployerProfileTab extends StatefulWidget {
  const EmployerProfileTab({super.key});

  @override
  State<EmployerProfileTab> createState() =>
      _EmployerProfileTabState();
}

class _EmployerProfileTabState
    extends State<EmployerProfileTab> {

      bool isContactExpanded = true;
      bool isActionsExpanded = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          AppColors.backgroundColor,

      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding:
                EdgeInsets.symmetric(
                    horizontal: 16.w),
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [

                SizedBox(height: 18.h),

                Row(
                  children: [

                    Expanded(
                      child: Text(
                        "Profile",
                        style:
                            AppFonts.custom(
                          size: 24.sp,
                          weight:
                              FontWeight.w600,
                          color:
                              const Color(
                                  0xFF374151),
                        ),
                      ),
                    ),

                    _topIcon(
                      icon:
                          'assets/images/message.svg',
                    ),

                    SizedBox(width: 12.w),

                    _topIcon(
                      icon:
                          'assets/images/notification.svg',
                    ),
                  ],
                ),

                SizedBox(height: 24.h),

       
                Container(
                  width: double.infinity,
                  padding:
                      EdgeInsets.all(20.w),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.circular(
                            20.r),
                    boxShadow: const [
                      BoxShadow(
                        color:
                            Color(0x14000000),
                        offset: Offset(0, 4),
                        blurRadius: 8,
                      ),
                    ],
                  ),
                  child: Column(
                    children: [

                      Row(
                        crossAxisAlignment:
                            CrossAxisAlignment
                                .start,
                        children: [

                   
                          Container(
                            width: 64.w,
                            height: 64.w,
                            decoration:
                                BoxDecoration(
                              borderRadius:
                                  BorderRadius
                                      .circular(
                                          100.r),
                            ),
                            clipBehavior:
                                Clip.antiAlias,
                            child: Image.asset(
                              'assets/images/cat.jpg',
                              fit: BoxFit.cover,
                            ),
                          ),

                          SizedBox(width: 14.w),

                          Expanded(
                            child: Column(
                              crossAxisAlignment:
                                  CrossAxisAlignment
                                      .start,
                              children: [

                                Row(
                                  crossAxisAlignment:
                                      CrossAxisAlignment
                                          .start,
                                  children: [

                                    Expanded(
                                      child: Text(
                                        "Stanford Medical Center",
                                        style:
                                            AppFonts.custom(
                                          size:
                                              16.sp,
                                          weight:
                                              FontWeight.w600,
                                          color:
                                              const Color(0xFF374151),
                                        ),
                                      ),
                                    ),

                                    SizedBox(
                                        width:
                                            10.w),

                                    Container(
                                      padding:
                                          EdgeInsets.symmetric(
                                        horizontal:
                                            10.w,
                                        vertical:
                                            6.h,
                                      ),
                                      decoration:
                                          BoxDecoration(
                                        color:
                                            const Color(0xFFFFF4E8),
                                        borderRadius:
                                            BorderRadius.circular(
                                                30.r),
                                      ),
                                      child:
                                          Row(
                                        children: [

                                          SvgPicture
                                              .asset(
                                            'assets/images/star.svg',
                                            height:
                                                14.h,
                                            width:
                                                14.w,
                                            colorFilter:
                                                const ColorFilter.mode(
                                              Color(
                                                  0xFFF59E0B),
                                              BlendMode
                                                  .srcIn,
                                            ),
                                          ),

                                          SizedBox(
                                              width:
                                                  4.w),

                                          Text(
                                            "4.8",
                                            style:
                                                AppFonts.custom(
                                              size:
                                                  14.sp,
                                              weight:
                                                  FontWeight.w600,
                                              color:
                                                  const Color(0xFFA65F00),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),

                                // SizedBox(
                                //     height: 8.h),


                                Row(
                                  children: [

                                    SvgPicture
                                        .asset(
                                      'assets/images/location.svg',
                                      height:
                                          16.h,
                                      width:
                                          16.w,
                                      colorFilter:
                                          const ColorFilter.mode(
                                        Color(
                                            0xFF4B5563),
                                        BlendMode
                                            .srcIn,
                                      ),
                                    ),

                                    SizedBox(
                                        width:
                                            6.w),

                                    Text(
                                      "San Francisco, CA",
                                      style:
                                          AppFonts.custom(
                                        size:
                                            14.sp,
                                        weight:
                                            FontWeight.w400,
                                        color:
                                            const Color(0xFF4B5563),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 18.h),

      
                      Text(
                        "Stanford Medicine is a leading academic health system providing world-class patient care, groundbreaking research, and innovative medical education.",
                        style: AppFonts.custom(
                          size: 12.sp,
                          weight:
                              FontWeight.w400,
                          color:
                              const Color(
                                  0xFF6B7280),
                          height: 1.5,
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 20.h),

                Row(
                  children: [

                    Expanded(
                      child: _statsCard(
                        icon:
                            'assets/images/ongoing.svg',
                        iconBg:
                            const Color(
                                0xFFE5F1FF),
                        iconColor:
                            const Color(
                                0xFF0074BE),
                        number: "12",
                        title:
                            "Ongoing Jobs",
                      ),
                    ),

                    SizedBox(width: 14.w),

                    Expanded(
                      child: _statsCard(
                        icon:
                            'assets/images/completed_job.svg',
                        iconBg:
                            const Color(
                                0xFFE9F9EE),
                        iconColor:
                            const Color(
                                0xFF22C55E),
                        number: "34",
                        title:
                            "Completed Jobs",
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 24.h),

                
Column(
  children: [


    GestureDetector(
      onTap: () {

        setState(() {

          isContactExpanded =
              !isContactExpanded;
        });
      },

      child: Row(
        children: [

          Expanded(
            child: Text(
              "Contact Information",
              style: AppFonts.custom(
                size: 16.sp,
                weight: FontWeight.w400,
                color: const Color(0xFF374151),
              ),
            ),
          ),

          AnimatedRotation(
            turns:
                isContactExpanded
                    ? 0
                    : 0.5,

            duration: const Duration(
                milliseconds: 200),

            child: Icon(
              Icons.keyboard_arrow_up_rounded,
              size: 24.sp,
              color: const Color(0xFF6B7280),
            ),
          ),
        ],
      ),
    ),

    SizedBox(height: 12.h),

   
    if (isContactExpanded)
      Container(
        width: double.infinity,
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius:
              BorderRadius.circular(20.r),
          boxShadow: const [
            BoxShadow(
              color: Color(0x14000000),
              offset: Offset(0, 4),
              blurRadius: 8,
            ),
          ],
        ),
        child: Column(
          children: [

            _contactItem(
              icon:
                  'assets/images/email.svg',
              title: "Email",
              value:
                  "sarah.johnson@email.com",
            ),

            SizedBox(height: 14.h),

            _contactItem(
              icon:
                  'assets/images/phone.svg',
              title: "Phone",
              value: "+1 (415) 555-0123",
            ),

            SizedBox(height: 14.h),

            _contactItem(
              icon:
                  'assets/images/location.svg',
              title: "Location",
              value: "San Francisco, CA",
            ),
          ],
        ),
      ),
  ],
),

SizedBox(height: 24.h),


Column(
  children: [

    
    GestureDetector(
      onTap: () {

        setState(() {

          isActionsExpanded =
              !isActionsExpanded;
        });
      },

      child: Row(
        children: [

          Expanded(
            child: Text(
              "Actions",
              style: AppFonts.custom(
                size: 16.sp,
                weight: FontWeight.w400,
                color: const Color(0xFF374151),
              ),
            ),
          ),

          AnimatedRotation(
            turns:
                isActionsExpanded
                    ? 0
                    : 0.5,

            duration: const Duration(
                milliseconds: 200),

            child: Icon(
              Icons.keyboard_arrow_up_rounded,
              size: 24.sp,
              color: const Color(0xFF6B7280),
            ),
          ),
        ],
      ),
    ),

    SizedBox(height: 12.h),

    
    if (isActionsExpanded)
      Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius:
              BorderRadius.circular(20.r),
          boxShadow: const [
            BoxShadow(
              color: Color(0x14000000),
              offset: Offset(0, 4),
              blurRadius: 8,
            ),
          ],
        ),
        child: Column(
          children: [

            _actionTile(
              icon:
                  'assets/images/view_profile.svg',
              title: "Edit Company Setup",

              onTap: () {

                
                // Get.toNamed(AppRoutes.employerJobDetails);
              },
            ),

            _divider(),

            _actionTile(
              icon:
                  'assets/images/password.svg',
              title: "Change Password",

              onTap: () {

                
                Get.toNamed(AppRoutes.changePass);
              },
            ),

            _divider(),

            _actionTile(
              icon:
                  'assets/images/terms.svg',
              title: "Terms & Policies",

              onTap: () {

                
                Get.toNamed(AppRoutes.termsPolicies);
              },
            ),

            _divider(),

            _actionTile(
              icon:
                  'assets/images/profile.svg',
              title: "About Us",

              onTap: () {

               
               Get.toNamed(AppRoutes.aboutUs);
              },
            ),

            _divider(),

            _actionTile(
              icon:
                  'assets/images/support.svg',
              title: "Support",

              onTap: () {

               
                Get.toNamed(AppRoutes.support);
              },
            ),

            _divider(),

            _actionTile(
              icon:
                  'assets/images/delete.svg',
              title: "Delete Account",

              onTap: () {

                
                showDeleteDialog(context);
              },
            ),

            _divider(),

            _actionTile(
              icon:
                  'assets/images/logout.svg',
              title: "Log Out",
              isLogout: true,

              onTap: () {

                
                showLogoutDialog(context);
              },
            ),
          ],
        ),
      ),
  ],
),

SizedBox(height: 24.h),
              ],
            ),
          ),
        ),
      ),
    );
  }


  Widget _topIcon({
    required String icon,
  }) {
    return Stack(
      children: [

        Container(
          width: 42.w,
          height: 42.w,
          decoration:
              const BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          child: Center(
            child: SvgPicture.asset(
              icon,
              height: 20.h,
              width: 20.w,
              colorFilter:
                  const ColorFilter.mode(
                Color(0xFF4B5563),
                BlendMode.srcIn,
              ),
            ),
          ),
        ),

        Positioned(
          top: 0,
          right: 0,
          child: Container(
            width: 16.w,
            height: 16.w,
            decoration:
                BoxDecoration(
              color:
                  const Color(0xFFEF4444),
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.white,
                width: 2,
              ),
            ),
            child: Center(
              child: Text(
                "3",
                style: TextStyle(
                  fontSize: 8.sp,
                  fontWeight:
                      FontWeight.w700,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  
  Widget _statsCard({
    required String icon,
    required Color iconBg,
    required Color iconColor,
    required String number,
    required String title,
  }) {
    return Container(
      height: 112.h,
      width: 184.w,
      padding: const EdgeInsets.all(
         10,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius:
            BorderRadius.circular(18.r),
        boxShadow: const [
          BoxShadow(
            color: Color(0x14000000),
            offset: Offset(0, 4),
            blurRadius: 8,
          ),
        ],
      ),
      child: Column(
        children: [

          Container(
            width: 32.w,
            height: 32.w,
            decoration: BoxDecoration(
              color: iconBg,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(12)
            ),
            child: Center(
              child: SvgPicture.asset(
                icon,
                height: 18.h,
                width: 18.w,
                colorFilter:
                    ColorFilter.mode(
                  iconColor,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ),

          

          Text(
            number,
            style: AppFonts.custom(
              size: 18.sp,
              weight: FontWeight.w500,
              color: const Color(0xFF374151),
            ),
          ),

       

          Text(
            title,
            style: AppFonts.custom(
              size: 12.sp,
              weight: FontWeight.w400,
              color:
                  const Color(0xFF4B5563),
            ),
          ),
        ],
      ),
    );
  }

 
Widget _contactItem({
  required String icon,
  required String title,
  required String value,
}) {
  return Row(
    children: [

      Container(
        width: 40.w,
        height: 40.w,
        decoration: BoxDecoration(
          color: const Color(0xFFF3F4F6),
          borderRadius:
              BorderRadius.circular(14.r),
        ),
        child: Center(
          child: SvgPicture.asset(
            icon,
            height: 18.h,
            width: 18.w,
            colorFilter:
                const ColorFilter.mode(
              Color(0xFF6B7280),
              BlendMode.srcIn,
            ),
          ),
        ),
      ),

      SizedBox(width: 12.w),

      Expanded(
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,
          children: [

            Text(
              title,
              style: AppFonts.custom(
                size: 12.sp,
                weight: FontWeight.w400,
                color: const Color(0xFF9CA3AF),
              ),
            ),

            SizedBox(height: 2.h),

            Text(
              value,
              style: AppFonts.custom(
                size: 16.sp,
                weight: FontWeight.w500,
                color: const Color(0xFF374151),
              ),
            ),
          ],
        ),
      ),
    ],
  );
}
Widget _divider() {
  return const Divider(
    height: 1,
    thickness: 1,
    color: Color(0xFFE5E7EB),
  );
}

Widget _actionTile({
  required String icon,
  required String title,
  required VoidCallback onTap,
  bool isLogout = false,
}) {
  return GestureDetector(
    onTap: onTap,

    child: Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: 20.w,
        vertical: 20.h,
      ),

      child: Row(
        children: [

          SvgPicture.asset(
            icon,
            height: 24.h,
            width: 24.w,
            colorFilter: ColorFilter.mode(
              isLogout
                  ? const Color(0xFFEF4444)
                  : const Color(0xFF6B7280),
              BlendMode.srcIn,
            ),
          ),

          SizedBox(width: 16.w),

          Expanded(
            child: Text(
              title,
              style: AppFonts.custom(
                size: 16.sp,
                weight: FontWeight.w400,
                color: isLogout
                    ? const Color(0xFFEF4444)
                    : const Color(0xFF4B5563),
              ),
            ),
          ),

          Icon(
            Icons.arrow_forward_ios_rounded,
            size: 22.sp,
            color: const Color(0xFF6B7280),
          ),
        ],
      ),
    ),
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
              const Text(
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
                      height: 46.h,
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
              const Text(
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
                      height: 46.h,
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