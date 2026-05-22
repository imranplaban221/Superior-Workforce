import 'package:flutter/material.dart';
import 'package:flutter_extension/helper/route_helper.dart';
import 'package:flutter_extension/util/app_colors.dart';
import 'package:flutter_extension/util/app_text.dart';
import 'package:flutter_extension/views/base/custom_job_card.dart';
import 'package:flutter_extension/views/base/custom_scarch_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';




class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
     
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
        
              children: [
        
                SizedBox(height: 20.h),
        
              Row(
                children: [
                  Text(
                      'Find Your Next Job',
                  
                      style: AppFonts.custom(
                        size: 22.sp,
                        weight: FontWeight.w600,
                        color: const Color(0xFF3D4A57),
                        height: 1,
                      ),
                    ),
                    SizedBox(width: 110.h),
        
                      InkWell(
                        borderRadius: BorderRadius.circular(50),
  onTap: () {
    
   
     Get.toNamed(AppRoutes.messageScreen);
  },
    
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                           Container(
                             padding: const EdgeInsets.all(8),
                            decoration: const BoxDecoration(
                              color: Color(0xFFE7E8EA),
                                  shape: BoxShape.circle,
                                
                                
                          
                          
                            ),
                              child: SvgPicture.asset(
                                              'assets/images/message.svg',
                                              width: 16.w,
                                              height: 16.h,
                                              fit: BoxFit.contain,
                                            ),
                            ),
                                
                             Positioned(
                                top: -7,
                                right: -7,
                                child: Container(
                                  padding: const EdgeInsets.all(4),
                                  decoration: const BoxDecoration(
                                    color: Color(0xFFEF4444), // red
                                    shape: BoxShape.circle,
                                
                                     boxShadow: [
                                    BoxShadow(
                                color: Color(0x1A000000), // #0000001A
                                offset:  Offset(0, 1.2),
                                blurRadius: 2.4,
                                spreadRadius: -1.2,
                                    ),
                                    BoxShadow(
                                color:  Color(0x1A000000),
                                offset:  Offset(0, 2.4),
                                blurRadius: 3.6,
                                spreadRadius: -0.6,
                                    ),
                                  ]
                                  ),
                                  constraints: const BoxConstraints(
                                    minWidth: 18,
                                    minHeight: 18,
                                  ),
                                  child: const Center(
                                    child: Text(
                                      '3',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                                    ),
                          ]
                        ),
                      ),
                      
        
        
                SizedBox(width: 12.h),
        
        
                   InkWell(
                     borderRadius: BorderRadius.circular(50),
  onTap: () {
    
   
     Get.toNamed(AppRoutes.notificationScreen);
  },
                    child: Stack(
                      clipBehavior: Clip.none,
                          children: [
                         Container(
                        
                          padding: const EdgeInsets.all(8),
                            decoration: const BoxDecoration(
                              color: Color(0xFFE7E8EA),
                                  shape: BoxShape.circle,
                        
                        
                            ),
                          child: SvgPicture.asset(
                                          'assets/images/notification.svg',
                                          width: 16.w,
                                          height: 16.h,
                                          fit: BoxFit.contain,
                                        ),
                        ),
                            
                         Positioned(
                            top: -5,
                            right: -5,
                            child: Container(
                              padding: const EdgeInsets.all(4),
                              decoration: const BoxDecoration(
                                color: Color(0xFFEF4444), // red
                                shape: BoxShape.circle,
                            
                                 boxShadow: [
                                BoxShadow(
                            color:  Color(0x1A000000), // #0000001A
                            offset:  Offset(0, 1.2),
                            blurRadius: 2.4,
                            spreadRadius: -1.2,
                                ),
                                BoxShadow(
                            color:  Color(0x1A000000),
                            offset:  Offset(0, 2.4),
                            blurRadius: 3.6,
                            spreadRadius: -0.6,
                                ),
                              ]
                              ),
                              constraints: const BoxConstraints(
                                minWidth: 18,
                                minHeight: 18,
                              ),
                              child: const Center(
                                child: Text(
                                  '3',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                                ),
                          ]
                      ),
                  ),
                ],
              ),
                SizedBox(height: 8.h),
        
                  Text(
                      'Discover healthcare opportunities',
                  
                      style: AppFonts.custom(
                        size: 14.sp,
                        weight: FontWeight.w400,
                        color: const Color(0xFF3D4A57),
                        height: 1,
                      ),
                    ),
        
                    SizedBox(height: 20.h),
        
                    const CustomSearchBar(),
        
                    SizedBox(height: 20.h),
        
                    const JobCard(
        title: "City Hospital",
        role: "CNA",
        time: "2h ago",
        location: "Los Angeles, CA",
        pay: "\$22 / hour",
        shift: "Night Shift",
        jobType: "Full-time",
        date: "12 March, 2026",
        rating: 4.8,
            ),
        
        
            
 const Column(
  children: [
    JobCard(
      title: "City Hospital",
      role: "CNA",
      time: "2h ago",
      location: "Los Angeles, CA",
      pay: "\$22 / hour",
      shift: "Night Shift",
      jobType: "Full-time",
      date: "12 March, 2026",
      rating: 4.8,
    ),

    BookedJobCard(), 
  ],
),
        
        
            
                    const JobCard(
        title: "City Hospital",
        role: "CNA",
        time: "2h ago",
        location: "Los Angeles, CA",
        pay: "\$22 / hour",
        shift: "Night Shift",
        jobType: "Full-time",
        date: "12 March, 2026",
        rating: 4.8,
            ),
        
        
        
        
              ],
        
              
            ),
          ),
        ),
      ),
   
    );
  }
}