import 'package:flutter/material.dart';
import 'package:flutter_extension/helper/route_helper.dart';
import 'package:flutter_extension/util/app_colors.dart';
import 'package:flutter_extension/util/app_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class FavoriteEmployees extends StatefulWidget {
  const FavoriteEmployees({super.key});

  @override
  State<FavoriteEmployees> createState() =>
      _FavoriteEmployeesState();
}

class _FavoriteEmployeesState
    extends State<FavoriteEmployees> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,

      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 14.w),
          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.start,
            children: [

              SizedBox(height: 16.h),

           
              Row(
                children: [

                  Expanded(
                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start,
                      children: [

                        Row(
                          children: [
                            Text(
                              "Favorite Employees",
                              style: AppFonts.custom(
                                size: 24.sp,
                                weight: FontWeight.w600,
                                color:
                                    const Color(0xFF374151),
                              ),
                            ),
                          SizedBox(width: 36.w),

                             _topIcon(
                    icon: 'assets/images/heart.svg',
                  ),

                  SizedBox(width: 8.w),

                  _topIcon(
                    icon: 'assets/images/message.svg',
                    showBadge: true,
                  ),

                  SizedBox(width: 8.w),

                  _topIcon(
                    icon: 'assets/images/notification.svg',
                    showBadge: true,
                  ),
                          ],
                        ),

                        SizedBox(height: 4.h),

                        Text(
                          "4 Employees",
                          style: AppFonts.custom(
                            size: 16.sp,
                            weight: FontWeight.w400,
                            color:
                                const Color(0xFF4B5563),
                          ),
                        ),
                      ],
                    ),
                  ),

                 
                ],
              ),

              SizedBox(height: 24.h),

          
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

                    _employeeCard(),
                    SizedBox(height: 12.h),

                    _employeeCard(),
                    SizedBox(height: 12.h),

                    _employeeCard(),
                    SizedBox(height: 12.h),

                    _employeeCard(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  
  Widget _employeeCard() {



    
    return InkWell(

        onTap: () {

      
      

      
       Get.toNamed(AppRoutes.candidateProfile);

    },

      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(
          horizontal: 12.w,
          vertical: 12.h,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14.r),
          border: Border.all(
            color: const Color(0xFFE5E7EB),
            width: 1,
          ),
        ),
        child: Row(
          children: [
      
         
            Container(
              width: 40.w,
              height: 40.w,
              decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.circular(50.r),
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
      
                  Text(
                    "Mr. Rahan",
                    style: AppFonts.custom(
                      size: 18.sp,
                      weight: FontWeight.w500,
                      color: const Color(0xFF374151),
                    ),
                  ),
      
                  SizedBox(height: 2.h),
      
                  Text(
                    "CNA",
                    style: AppFonts.custom(
                      size: 14.sp,
                      weight: FontWeight.w600,
                      color: const Color(0xFF0074BE),
                    ),
                  ),
                ],
              ),
            ),
      
      
            _actionButton(
              icon: 'assets/images/message.svg',
              bgColor: const Color(0xFFE5F1FF),
              iconColor: const Color(0xFF0074BE),
              onTap: () {},
            ),
      
            SizedBox(width: 8.w),
      
            _actionButton(
              icon: 'assets/images/phone.svg',
              bgColor: const Color(0xFFE5F1FF),
              iconColor: const Color(0xFF0074BE),
              onTap: () {},
            ),
      
            SizedBox(width: 8.w),
      
            _actionButton(
              icon: 'assets/images/trash.svg',
              bgColor: const Color(0xFFFFF1EB),
              iconColor: const Color(0xFFFF6B6B),
              onTap: () {},
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


 
  Widget _actionButton({
    required String icon,
    required Color bgColor,
    required Color iconColor,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 36.w,
        height: 36.w,
        decoration: BoxDecoration(
          color: bgColor,
          shape: BoxShape.circle,
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
    );
  }
}