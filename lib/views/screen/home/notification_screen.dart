import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F4F6),

      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              SizedBox(height: 10.h),

            
              Row(
                children: [
                  IconButton(
                    onPressed: Get.back,
                    icon: const Icon(Icons.arrow_back),
                  ),
                  Text(
                    "Notification",
                    style: TextStyle(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF374151),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 16.h),

           
              Text(
                "3 UNREADS",
                style: TextStyle(
                  fontSize: 14.sp,
                  color: const Color(0xFF6B7280),
                ),
              ),

              SizedBox(height: 12.h),

              
              Container(
                padding: EdgeInsets.all(14.w),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(14.r),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x14000000),
                      blurRadius: 8,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),

                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                   
                    Container(
                      width: 15,
                      height: 15,
                      margin: EdgeInsets.only(top: 6.h),
                      decoration: const BoxDecoration(
                        color: Color(0x80ED8B35),
                        shape: BoxShape.circle,
                      ),
                    ),

                    SizedBox(width: 10.w),

                    
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Application Under Review",
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                              color: Colors.red,
                            ),
                          ),

                          SizedBox(height: 6.h),

                          Text(
                            "Your application for RN - ICU at Stanford Medical Center is being reviewed by the hiring team.",
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xFF6B7280),
                            ),
                          ),
                        ],
                      ),
                    ),

                    
                    GestureDetector(
                      onTap: () {
                       
                      },
                      child: const Icon(
                        Icons.close,
                        size: 18,
                        color: Color(0xFF3E4955),
                      ),
                    ),
                  ],
                ),
              ),


               SizedBox(height: 12.h),

              
              Container(
                padding: EdgeInsets.all(14.w),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(14.r),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x14000000),
                      blurRadius: 8,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),

                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                   
                    Container(
                      width: 15,
                      height: 15,
                      margin: EdgeInsets.only(top: 6.h),
                      decoration: const BoxDecoration(
                        color: Color(0x8027AE60),
                        shape: BoxShape.circle,
                      ),
                    ),

                    SizedBox(width: 10.w),

                    
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Weekly Job Digest",
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                              color: Colors.red,
                            ),
                          ),

                          SizedBox(height: 6.h),

                          Text(
                            "15 new healthcare jobs posted in your preferred locations this week.",
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xFF6B7280),
                            ),
                          ),
                        ],
                      ),
                    ),

                    
                    GestureDetector(
                      onTap: () {
                       
                      },
                      child: const Icon(
                        Icons.close,
                        size: 18,
                        color: Color(0xFF3E4955),
                      ),
                    ),
                  ],
                ),
              ),

                   SizedBox(height: 12.h),

              
              Container(
                padding: EdgeInsets.all(14.w),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(14.r),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x14000000),
                      blurRadius: 8,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),

                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                   
                    Container(
                      width: 15,
                      height: 15,
                      margin: EdgeInsets.only(top: 6.h),
                      decoration: const BoxDecoration(
                        color: Color(0x80EB5757),
                        shape: BoxShape.circle,
                      ),
                    ),

                    SizedBox(width: 10.w),

                    
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "License Expiring Soon",
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                              color: Colors.red,
                            ),
                          ),

                          SizedBox(height: 6.h),

                          Text(
                            "Your RN License will expire in 30 days. Please update your credentials.",
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xFF6B7280),
                            ),
                          ),
                        ],
                      ),
                    ),

                    
                    GestureDetector(
                      onTap: () {
                       
                      },
                      child: const Icon(
                        Icons.close,
                        size: 18,
                        color: Color(0xFF3E4955),
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