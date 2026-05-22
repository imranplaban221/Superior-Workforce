import 'package:flutter/material.dart';
import 'package:flutter_extension/helper/route_helper.dart';
import 'package:flutter_extension/util/app_colors.dart';
import 'package:flutter_extension/util/app_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class EmployerHomeTab extends StatefulWidget {
  const EmployerHomeTab({super.key});

  @override
  State<EmployerHomeTab> createState() => _EmployerHomeTabState();
}

class _EmployerHomeTabState extends State<EmployerHomeTab> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,

      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 14.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                SizedBox(height: 16.h),

          
                Row(
                  children: [

                    Expanded(
                      child: Column(
                        crossAxisAlignment:
                            CrossAxisAlignment.start,
                        children: [

                          Text(
                            "City Hospital",
                            style: AppFonts.custom(
                              size: 28.sp,
                              weight: FontWeight.w600,
                              color:
                                  const Color(0xFF374151),
                            ),
                          ),

                          SizedBox(height: 4.h),

                          Text(
                            "Post & Hire",
                            style: AppFonts.custom(
                              size: 14.sp,
                              weight: FontWeight.w400,
                              color:
                                  const Color(0xFF374151),
                            ),
                          ),
                        ],
                      ),
                    ),

                    _topIcon(
                      icon: 'assets/images/heart.svg',
                       onTap: () {

    Get.toNamed(AppRoutes.favoriteEmployees);

  },
                    ),

                    SizedBox(width: 8.w),

                    _topIcon(
                      icon: 'assets/images/message.svg',
                      showBadge: true,
                       onTap: () {

    Get.toNamed(AppRoutes.messageScreen);

  },
                    ),

                    SizedBox(width: 8.w),

                    _topIcon(
                      icon: 'assets/images/notification.svg',
                      showBadge: true,
                       onTap: () {

    Get.toNamed(AppRoutes.notificationScreen);

  },
                    ),
                  ],
                ),

                SizedBox(height: 24.h),

             
                Row(
                  mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,
                  children: [

                    _statCard(
                      icon: 'assets/images/job.svg',
                      iconBg: const Color(0xFFE5F1FF),
                      iconColor: const Color(0xFF0074BE),
                      number: "12",
                      title: "Active Jobs",
                    ),

                    SizedBox(width: 16.w,),

                    _statCard(
                      icon:
                          'assets/images/completed.svg',
                      iconBg: const Color(0xFFFFF1EB),
                      iconColor: const Color(0xFFFF6B35),
                      number: "48",
                      title: "Completed",
                    ),

                    SizedBox(width: 16.w,),

                    _statCard(
                      icon:
                          'assets/images/upcoming.svg',
                      iconBg: const Color(0xFFE9F9EE),
                      iconColor: const Color(0xFF22C55E),
                      number: "8",
                      title: "Upcoming",
                    ),
                  ],
                ),

                SizedBox(height: 18.h),

               
                SizedBox(
                  width: double.infinity,
                  height: 50.h,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.zero,
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(12.r),
                      ),
                    ),
                    onPressed: () {
                      Get.toNamed(AppRoutes.postJobs);
                    },
                    child: Ink(
                      decoration: BoxDecoration(
                        gradient: AppColors.buttonColor,
                        borderRadius:
                            BorderRadius.circular(12.r),
                      ),
                      child: Center(
                        child: Text(
                          "+ Post a New Job",
                          style: AppFonts.custom(
                            size: 16.sp,
                            weight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 20.h),

                Text(
                  "Recent Assign Employees",
                  style: AppFonts.custom(
                    size: 16.sp,
                    weight: FontWeight.w400,
                    color: const Color(0xFF4B5563),
                  ),
                ),

                SizedBox(height: 14.h),

                _jobCard(
                  name: "Miss. Sarah",
                  role: "CNA",
                  status: "Upcoming",
                  location: "Los Angeles, CA",
                  pay: "\$ 22 / hour",
                  shift: "Night Shift",
                  jobType: "Full-time",
                  date: "12 March, 2026",
                  remainingTime: "8h remaining",
                  rating: "4.8",
                   onTap: () {

    Get.toNamed(AppRoutes.candidateProfile);

  },
                ),

                SizedBox(height: 16.h),

                _jobCard(
                  name: "John Smith",
                  role: "CNA",
                  status: "Completed",
                  location: "New York, USA",
                  pay: "\$ 35 / hour",
                  shift: "Morning Shift",
                  jobType: "Part-time",
                  date: "15 April, 2026",
                  remainingTime: "Completed",
                  rating: "4.9",
                   onTap: () {

    Get.toNamed(AppRoutes.candidateProfile);

  },
                ),
                SizedBox(height: 16.h),

                 _jobCard(
                  name: "Miss. Sarah",
                  role: "CNA",
                  status: "Ongoing",
                  location: "Los Angeles, CA",
                  pay: "\$ 22 / hour",
                  shift: "Night Shift",
                  jobType: "Full-time",
                  date: "12 March, 2026",
                  remainingTime: "8h remaining",
                  rating: "4.8",
                   onTap: () {

    Get.toNamed(AppRoutes.candidateProfile);

  },
                ),

                SizedBox(height: 20.h),
              ],
            ),
          ),
        ),
      ),
    );
  }

  
  Widget _jobCard({
    required String name,
    required String role,
    required String status,
    required String location,
    required String pay,
    required String shift,
    required String jobType,
    required String date,
    required String remainingTime,
    required String rating,
    required VoidCallback onTap,
  }) {
    return InkWell(
       borderRadius: BorderRadius.circular(16.r),
  onTap: onTap,
      child: Container(
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
          children: [
      
            Row(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [
      
               Container(
        width: 48.w,
        height: 48.w,
        decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(14.r),
        ),
        clipBehavior: Clip.antiAlias, 
        child: Image.asset(
      'assets/images/spider_man.jpg',
      fit: BoxFit.cover,
        ),
      ),
      
                SizedBox(width: 12.w),
      
                Expanded(
                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start,
                    children: [
      
                      Row(
                        children: [
      
                          Expanded(
                            child: Text(
                              name,
                              style: AppFonts.custom(
                                size: 22.sp,
                                weight: FontWeight.w600,
                                color:
                                    const Color(0xFF374151),
                              ),
                            ),
                          ),
      
                          Container(
                            padding:
                                EdgeInsets.symmetric(
                              horizontal: 10.w,
                              vertical: 5.h,
                            ),
                            decoration: BoxDecoration(
                              color:
                                  const Color(0xFFFEFCE8),
                              borderRadius:
                                  BorderRadius.circular(
                                      20.r),
                            ),
                            child: Row(
                              children: [
      
                                SvgPicture.asset(
                                  'assets/images/star.svg',
                                  height: 12.h,
                                ),
      
                                SizedBox(width: 4.w),
      
                                Text(
                                  rating,
                                  style:
                                      AppFonts.custom(
                                    size: 12.sp,
                                    weight:
                                        FontWeight.w600,
                                    color: const Color(
                                        0xFFA65F00),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
      
                      SizedBox(height: 2.h),
      
                      Row(
                        children: [
      
                          Text(
                            role,
                            style: AppFonts.custom(
                              size: 13.sp,
                              weight:
                                  FontWeight.w600,
                              color: const Color(
                                  0xFF0074BE),
                            ),
                          ),
      
                          SizedBox(width: 6.w),
      
                          Text(
                            status,
                            style: AppFonts.custom(
                              size: 12.sp,
                              weight:
                                  FontWeight.w400,
                              color: const Color(
                                  0xFF6B7280),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
      
            SizedBox(height: 14.h),
      
            _infoRow(
              icon: 'assets/images/location.svg',
              text: location,
            ),
      
            SizedBox(height: 10.h),
      
            _infoRow(
              icon: 'assets/images/money.svg',
              text: pay,
              textColor: const Color(0xFF22C55E),
            ),
      
            SizedBox(height: 10.h),
      
            Row(
              children: [
      
                SvgPicture.asset(
                  'assets/images/clock.svg',
                  height: 16.h,
                  colorFilter:
                      const ColorFilter.mode(
                    Color(0xFF6B7280),
                    BlendMode.srcIn,
                  ),
                ),
      
                SizedBox(width: 6.w),
      
                Text(
                  shift,
                  style: AppFonts.custom(
                    size: 13.sp,
                    weight: FontWeight.w400,
                    color: const Color(0xFF4B5563),
                  ),
                ),
      
                SizedBox(width: 6.w),
      
                Text(
                  "•",
                  style: AppFonts.custom(
                    size: 14.sp,
                    color: const Color(0xFF6B7280),
                  ),
                ),
      
                SizedBox(width: 6.w),
      
                Text(
                  jobType,
                  style: AppFonts.custom(
                    size: 13.sp,
                    weight: FontWeight.w400,
                    color: const Color(0xFF4B5563),
                  ),
                ),
      
                const Spacer(),
      
                Text(
                  date,
                  style: AppFonts.custom(
                    size: 12.sp,
                    weight: FontWeight.w400,
                    color: const Color(0xFF6B7280),
                  ),
                ),
              ],
            ),
      
            SizedBox(height: 16.h),
      
            Divider(
              color: const Color(0xFFE5E7EB),
              height: 1.h,
            ),
      
            SizedBox(height: 14.h),
      
            Row(
              children: [
      
                SvgPicture.asset(
                  'assets/images/clock.svg',
                  height: 14.h,
                  colorFilter:
                      const ColorFilter.mode(
                    Color(0xFF3B82F6),
                    BlendMode.srcIn,
                  ),
                ),
      
                SizedBox(width: 6.w),
      
                Text(
                  remainingTime,
                  style: AppFonts.custom(
                    size: 12.sp,
                    weight: FontWeight.w500,
                    color: const Color(0xFF3B82F6),
                  ),
                ),
      
                const Spacer(),
      
                _circleButton(
                  icon: 'assets/images/heart.svg',
                ),
      
                SizedBox(width: 8.w),
      
                _circleButton(
                  icon: 'assets/images/message.svg',
                ),
      
                SizedBox(width: 10.w),
      
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 14.w,
                    vertical: 8.h,
                  ),
                  decoration: BoxDecoration(
                    gradient: AppColors.buttonColor,
                    borderRadius:
                        BorderRadius.circular(8.r),
                  ),
                  child: Text(
                    "View Details",
                    style: AppFonts.custom(
                      size: 12.sp,
                      weight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  
  Widget _topIcon({
  required String icon,
  bool showBadge = false,
  VoidCallback? onTap,
}) {
  return GestureDetector(
    onTap: onTap,

    child: Stack(
      children: [

        Container(
          width: 36.w,
          height: 36.w,
          decoration: const BoxDecoration(
            color: Color(0xFFE7E8EA),
            shape: BoxShape.circle,
          ),
          child: Center(
            child: SvgPicture.asset(
              icon,
              height: 18.h,
              colorFilter: const ColorFilter.mode(
                Color(0xFF6B7280),
                BlendMode.srcIn,
              ),
            ),
          ),
        ),

        if (showBadge)
          Positioned(
            top: 0,
            right: 0,
            child: Container(
              width: 14.w,
              height: 14.w,
              decoration: const BoxDecoration(
                color: Color(0xFFEF4444),
                shape: BoxShape.circle,
                 boxShadow: [
   
    BoxShadow(
      offset: Offset(0, 1.2),
      blurRadius: 2.4,
      spreadRadius: -1.2,
      color: Color(0x1A000000), 
    ),
    // Second Shadow
    BoxShadow(
      offset: Offset(0, 2.4),
      blurRadius: 3.6,
      spreadRadius: -0.6,
      color: Color(0x1A000000), 
    ),
  ],
              ),
              child: Center(
                child: Text(
                  "2",
                  style: TextStyle(
                    fontSize: 7.sp,
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ),
      ],
    ),
  );
}

  
  Widget _statCard({
    required String icon,
    required Color iconBg,
    required Color iconColor,
    required String number,
    required String title,
  }) {
    return Container(
      
      width: 120.w,
      padding: EdgeInsets.symmetric(
        vertical: 16.h,
      ),
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
        children: [

          Container(
            width: 32.w,
            height: 32.w,
            decoration: BoxDecoration(
              color: iconBg,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: SvgPicture.asset(
                icon,
                height: 18.h,
                colorFilter: ColorFilter.mode(
                  iconColor,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ),

          SizedBox(height: 2.h),

          Text(
            number,
            style: AppFonts.custom(
              size: 18.sp,
              weight: FontWeight.w500,
              color: const Color(0xFF374151),
            ),
          ),

          SizedBox(height: 2.h),

          Text(
            title,
            style: AppFonts.custom(
              size: 12.sp,
              weight: FontWeight.w400,
              color: const Color(0xFF6B7280),
            ),
          ),
        ],
      ),
    );
  }

  
  Widget _infoRow({
    required String icon,
    required String text,
    Color textColor = const Color(0xFF4B5563),
  }) {
    return Row(
      children: [

        SvgPicture.asset(
          icon,
          height: 16.h,
          colorFilter: ColorFilter.mode(
            textColor,
            BlendMode.srcIn,
          ),
        ),

        SizedBox(width: 6.w),

        Text(
          text,
          style: AppFonts.custom(
            size: 14.sp,
            weight: FontWeight.w500,
            color: textColor,
          ),
        ),
      ],
    );
  }

  
  Widget _circleButton({
    required String icon,
  }) {
    return Container(
      width: 30.w,
      height: 30.w,
      decoration: const BoxDecoration(
        color: Color(0xFFE5F1FF),
        shape: BoxShape.circle,
      ),
      child: Center(
        child: SvgPicture.asset(
          icon,
          height: 14.h,
          colorFilter: const ColorFilter.mode(
            Color(0xFF0074BE),
            BlendMode.srcIn,
          ),
        ),
      ),
    );
  }
}