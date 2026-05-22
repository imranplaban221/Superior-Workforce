// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

import 'package:flutter_extension/views/base/custom_review_card.dart';
import 'package:flutter_extension/util/app_text.dart';
import 'package:flutter_extension/views/screen/home/home_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class JobDetails extends StatelessWidget {
  const JobDetails({super.key});
  void showCancelDialog(BuildContext context) {
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
                "Are you sure cancel\nthis job?",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF374151),
                  fontFamily: 'Inter',
                ),
              ),

              const SizedBox(height: 12),

              Text(
                "This job is scheduled to start in less than 3 hours. If you cancel this shift, 35 points will be deducted from your account.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14.sp,
                  color: Colors.grey,
                  height: 1.4,
                  
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
                        Get.offAll(() => const HomeScreen());
                        
                        // Get.toNamed(AppRoutes.homeScreen);
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
                      height: 40,
                      width: 161,
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F4F6),

      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: SingleChildScrollView(
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
                      "Job Details",
                      style: AppFonts.custom(
                        size: 20,
                        weight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
            
                SizedBox(height: 2.h),
            
             
                Padding(
                  padding: const EdgeInsets.only(left: 36),
                  child: Text(
                    "Upcoming",
                    style: AppFonts.body(color: const Color(0xFF6B7280)),
                  ),
                ),
            
                SizedBox(height: 16.h),
            
             
                Container(
                  padding: EdgeInsets.all(12.w),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12.r),
                    boxShadow: const [
                      BoxShadow(
                        color: Color(0x14000000),
                        offset: Offset(0, 3),
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
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(11.43),
                              border: Border.all(color: Colors.grey, width: 0.7),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(11.43),
                              child: SvgPicture.asset(
                                'assets/images/luffy.svg',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
            
                          SizedBox(width: 10.w),
            
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "City Hospital",
                                  style: AppFonts.custom(
                                    size: 16,
                                    weight: FontWeight.w600,
                                  ),
                                ),
            
                                Row(
                                  children: [
                                    Text(
                                      "CNA",
                                      style: AppFonts.body(
                                        color: const Color(0xFF0074BE),
                                      ),
                                    ),
                                    SizedBox(width: 6.w),
                                    Text(
                                      "2h ago",
                                      style: AppFonts.body(
                                        color: const Color(0xFF6B7280),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
            
                 
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10.w, vertical: 5.h),
                            decoration: BoxDecoration(
                              color: const Color(0xFFFEFCE8),
                              borderRadius: BorderRadius.circular(20.r),
                            ),
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                  'assets/images/star.svg',
                                  width: 14,
                                  color: const Color(0xFFF59E0B),
                                ),
                                SizedBox(width: 4.w),
                                Text(
                                  "4.8",
                                  style: AppFonts.body(
                                    color: const Color(0xFFA65F00),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
            
                      SizedBox(height: 10.h),
            
              
                      Row(
                        children: [
                          SvgPicture.asset(
                            'assets/images/location.svg',
                            width: 14,
                            height: 14,
                          ),
                          SizedBox(width: 6.w),
                          Text(
                            "Los Angeles, CA",
                            style: AppFonts.body(
                              color: const Color(0xFF3E4955),
                            ),
                          ),
                        ],
                      ),
            
                      SizedBox(height: 6.h),
            
                  
                      Row(
                        children: [
                          SvgPicture.asset(
                            'assets/images/doller.svg',
                            width: 16,
                            height: 16,
                            color: Colors.green,
                          ),
                          SizedBox(width: 6.w),
                          Text(
                            "\$22 / hour",
                            style: AppFonts.custom(
                              size: 14,
                              weight: FontWeight.w600,
                              color: Colors.green,
                            ),
                          ),
                        ],
                      ),
            
                      SizedBox(height: 6.h),
            
                      Row(
                        children: [
                          const Icon(Icons.access_time, size: 14),
                          SizedBox(width: 6.w),
                          Text(
                            "Night Shift • Full-time",
                            style: AppFonts.body(
                              color: const Color(0xFF3E4955),
                            ),
                          ),
                          const Spacer(),
                          Text(
                            "12 March, 2026",
                            style: AppFonts.body(
                              color: const Color(0xFF3E4955),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
            
                SizedBox(height: 16.h),
            
                
                Container(
                  padding: EdgeInsets.all(12.w),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12.r),
                    boxShadow: const [
                      BoxShadow(
                        color: Color(0x14000000),
                        offset: Offset(0, 3),
                        blurRadius: 8,
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
            
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Row(
                          children: [
                            Padding(
                                    padding: EdgeInsets.only(top: 2.h), 
                                    child: Container(
                                      width: 39.w,
                                      height: 39.h,
                                      padding: EdgeInsets.all(10.w),
                                      decoration: BoxDecoration(
                                        
                                        color: const Color(0xFFE6EDF3),
                                        borderRadius: BorderRadius.circular(12.r),
                                      ),
                                      child: SvgPicture.asset(
                                        'assets/images/file.svg',
                                        color: const Color(0xFF3A6C9E),
                                      ),
                                    ),
                                  ),
                            SizedBox(width: 8.w),
                            Text(
                              "Job Description",
                              style: AppFonts.custom(
                                size: 20,
                                weight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
            
                      SizedBox(height: 16.h),
            
                      
                      Padding(
                        padding: const EdgeInsets.only(left: 10,right: 20),
                        child: Text(
                          "If this shift is canceled within 8 hours of the start time, it will not be paid out.",
                          style: AppFonts.body(
                            color: const Color(0xFF3E4955),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16.h),

const ReviewCard(),



Container(
  padding: const EdgeInsets.all(16),
  decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(16),
    boxShadow: const [
      BoxShadow(
        color: Color(0x14000000),
        offset: Offset(0, 4),
        blurRadius: 12,
      ),
    ],
  ),
  child: Column(
    children: [
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
      
         
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: const Color(0xFFE6EDF3),
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(14),
            ),
            child:  SvgPicture.asset(
              'assets/images/tips.svg',
              color: Colors.black,
              height: 20,
              width: 20,
            ),
          ),
      
          const SizedBox(width: 12),
      
          
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
      
                
                Text(
                  "Tips",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF374151),
                    fontFamily: 'Inter',
                  ),
                ),
      
                
      
      
                
      
              ],
              
            ),
      
          ),
      
          
        ],
      ),
      const SizedBox(height: 10),

    
    Text(
      "Focus on cleanliness and sanitation. Use proper cleaning supplies and follow facility-specific hygiene protocols.",
      style: AppFonts.body(
       
       
        color: Colors.black,
        
      ),
    ),
    ],

    
  ),

  
),

SizedBox(height: 16.h),

Container(
  padding: const EdgeInsets.all(16),
  decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(16),
    boxShadow: const [
      BoxShadow(
        color: Color(0x14000000),
        offset: Offset(0, 4),
        blurRadius: 12,
      ),
    ],
  ),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [

      
      Container(
        padding: const EdgeInsets.all(12),
        decoration:  BoxDecoration(
          color: const Color(0xFFFFEDD5),
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(14),
        ),
        child: const Icon(
          Icons.error_outline,
          color: Color(0xFFF97316),
          size: 22,
        ),
      ),

      SizedBox(height: 10.h),

     
      Text(
        "Any Question?",
        style: AppFonts.custom(
          size: 18,
          weight: FontWeight.w600,
          color: const Color(0xFF374151),
        ),
      ),

      SizedBox(height: 16.h),

      

     
      Row(
        children: [
          Expanded(
            child: Text(
              "(650) 723-4000",
              style: AppFonts.body(color: const Color(0xFF4B5563)),
            ),
          ),

          GestureDetector(
            onTap: () {

            },
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration:  BoxDecoration(
                color: const Color(0xFFE5F1FF),
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(8),
              ),
              child: SvgPicture.asset(
                'assets/images/phone.svg',
                height: 18,
                width: 18,
                color: const Color(0xFF0074BE),
              ),
            ),
          ),
        ],
      ),

      SizedBox(height: 10.h),

      const Divider(),

      SizedBox(height: 10.h),

      
      Row(
        children: [
          Expanded(
            child: Text(
              "careers@stanfordmed.org",
              style: AppFonts.body(color: const Color(0xFF4B5563)),
            ),
          ),

          GestureDetector(
            onTap: () {
          
            },
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration:  BoxDecoration(
                color: const Color(0xFFE5F1FF),
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(
                Icons.email_outlined,
                size: 18,
                color: Color(0xFF0074BE),
              ),
            ),
          ),
        ],
      ),

      const Divider(),
    ],
  ),
),


 SizedBox(height: 20.h),


Row(
  children: [

    
    Expanded(
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          fixedSize: const Size(95, 48) ,
          padding:  const EdgeInsets.symmetric(vertical: 12),
          side:  const BorderSide(
            color: Color(0xFF0074BE),
            width: 1,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: () {
          showCancelDialog(context);
          
        },
        child: const Text(
          "Cancel",
          style: TextStyle(
            color: Color(0xFF0074BE),
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    ),

    const SizedBox(width: 10),
    
    Expanded(
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          fixedSize: const Size(162, 48) ,
          padding:  const EdgeInsets.symmetric(vertical: 12),
          side:  const BorderSide(
            color: Color(0xFF0074BE),
            width: 1,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: () {
          
        },
        child:  const Text(
          "Message Now",
          style: TextStyle(
            color: Color(0xFF0074BE),
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    ),

    const SizedBox(width: 10),

  
    Expanded(
      child: Container(
        height: 48 ,
        width:109 ,
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
            padding: const EdgeInsets.symmetric(vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          onPressed: () {
            
          },
          child: const Text(
            "Navigate",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    ),
  ],
),


SizedBox(height: 20.h),

















              ],
            ),
          ),
        ),
      ),
    );
  }
}