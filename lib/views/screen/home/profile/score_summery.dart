import 'package:flutter/material.dart';
import 'package:flutter_extension/util/app_colors.dart';
import 'package:flutter_extension/util/app_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ScoreSummery extends StatefulWidget {
  const ScoreSummery({super.key});

  @override
  State<ScoreSummery> createState() => _ScoreSummeryState();
}

class _ScoreSummeryState extends State<ScoreSummery> {
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
        
                SizedBox(height: 16.h),
        
             
                Row(
                  children: [
                    GestureDetector(
                      onTap: () => Get.back(),
                      child: const Icon(Icons.arrow_back),
                    ),
                    SizedBox(width: 12.w),
                    Text(
                      "Score Summery",
                      style: AppFonts.custom(
                        size: 20.sp,
                        weight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
        
                SizedBox(height: 20.h),
        
          
                Container(
                  padding: EdgeInsets.all(16.w),
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
                    children: [
        
                      Row(
                        children: [
        
                         
                          Container(
                            width: 70.w,
                            height: 70.w,
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
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 16.w, vertical: 14.h),
                              decoration: BoxDecoration(
                                color: const Color(0xFFDCE6DF),
                                borderRadius: BorderRadius.circular(16.r),
                              ),
                              child: Row(
                                children: [
        
                                
                                  Container(
                                    width: 36.w,
                                    height: 36.w,
                                    decoration: BoxDecoration(
                                      color: const Color(0xFF22C55E),
                                      borderRadius: BorderRadius.circular(12.r),
                                    ),
                                    child: Center(
                                      child: SvgPicture.asset(
                                        'assets/images/score.svg',
                                        height: 18,
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
                                      size: 18.sp,
                                      weight: FontWeight.w600,
                                      color: const Color(0xFF374151),
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
                            ),
                          ),
                        ],
                      ),
        
                      SizedBox(height: 16.h),
        
                     
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(16.w),
                        decoration: BoxDecoration(
                          color: const Color(0xFFD9E4F2),
                          borderRadius: BorderRadius.circular(16.r),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
        
                            Text(
                              "Unlock More Instant Accept Shifts",
                              style: AppFonts.custom(
                                size: 16.sp,
                                weight: FontWeight.w600,
                                color: const Color(0xFF374151),
                              ),
                              textAlign: TextAlign.center,
                            ),
        
                            SizedBox(height: 8.h),
        
                            Text(
                              "A score above 90 qualifies you for more instant accept shift at participating facilities.",
                              style: AppFonts.custom(
                                size: 12.sp,
                                weight: FontWeight.w400,
                                color: const Color(0xFF374151),
                                height: 1.4,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),


                SizedBox(height: 20.h),
        
        
                Container(
          padding: EdgeInsets.all(12.w),
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
            children: [
        
        _scoreItem(
          icon: 'assets/images/up.svg',
          title: 'Complete Shifts (25)',
          subtitle: 'Score increase',
          value: '25',
          valueColor: const Color(0xFF22C55E),
          bgColor: const Color(0xFFE7F6EC),
        ),
        
        _scoreItem(
          icon: 'assets/images/up.svg',
          title: 'Urgent Completed Shifts (5)',
          subtitle: 'Score increase',
          value: '10',
          valueColor: const Color(0xFFF97316),
          bgColor: const Color(0xFFE7F6EC),
        ),
        
        _scoreItem(
          icon: 'assets/images/down.svg',
          title: 'No call, No Show (1)',
          subtitle: 'Score Decrease',
          value: '10',
          valueColor: Colors.red,
          bgColor: const Color(0xFFFDECEC),
        ),
        
        _scoreItem(
          icon: 'assets/images/down.svg',
          title: 'Cancelled Shifts <72 hours (2)',
          subtitle: 'Score Decrease',
          value: '10',
          valueColor: Colors.red,
          bgColor: const Color(0xFFFDECEC),
        ),
        
        _scoreItem(
          icon: 'assets/images/no_effect.svg',
          title: 'Cancelled Shifts 72+ hours (2)',
          subtitle: 'No effect',
          value: 'N/A',
          valueColor: const Color(0xFF3B82F6),
          bgColor: const Color(0xFFE6F0FA),
        ),
        
        _scoreItem(
          icon: 'assets/images/up.svg',
          title: 'Facility Cancelled Shifts (4)',
          subtitle: 'Score increase',
          value: '08',
          valueColor: const Color(0xFF22C55E),
          bgColor: const Color(0xFFE7F6EC),
        ),
            ],
          ),
        ),

        SizedBox(height: 20.h),

        Container(
  padding: EdgeInsets.all(12.w),
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
            width: 36.w,
            height: 36.w,
            decoration: BoxDecoration(
              color: const Color(0xFFE6F0FA),
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Center(
              child: SvgPicture.asset(
                'assets/images/calendar.svg',
                height: 18,
                width: 18,
              ),
            ),
          ),

          SizedBox(width: 10.w),

          Text(
            "Upcoming Event",
            style: AppFonts.custom(
              size: 18.sp,
              weight: FontWeight.w600,
              color: const Color(0xFF374151),
            ),
          ),
        ],
      ),

      SizedBox(height: 12.h),

      
      Container(
        width: double.infinity,
        padding: EdgeInsets.all(12.w),
        decoration: BoxDecoration(
          color: const Color(0xFFD9E4F2),
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

          
            Text(
              "Employee Appreciation Week 2026",
              style: AppFonts.custom(
                size: 16.sp,
                weight: FontWeight.w500,
                color: const Color(0xFFED8B35),
              ),
            ),

            SizedBox(height: 4.h),

          
            Text(
              "Date: May 15–21, 2026",
              style: AppFonts.custom(
                size: 14.sp,
                weight: FontWeight.w400,
                color: const Color(0xFF0074BE),
              ),
            ),

            SizedBox(height: 8.h),

            
            _eventPoint("Special rewards for top performers"),
            _eventPoint("Announcement of raffle draw winners"),
            _eventPoint("Free training sessions for skill development"),
            _eventPoint("Fun games and engagement activities"),
          ],
        ),
      ),
    ],
  ),
),


SizedBox(height: 20.h),


              ],
            ),
          ),
        ),
      ),
    );
  }
  Widget _scoreItem({
  required String icon,
  required String title,
  required String subtitle,
  required String value,
  required Color valueColor,
  required Color bgColor,
}) {
  return Padding(
    padding: EdgeInsets.only(bottom: 12.h),
    child: Container(
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: const Color(0xFFF9FAFB),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Row(
        children: [

          
          Container(
            width: 40.w,
            height: 40.w,
            decoration: BoxDecoration(
              color: bgColor,
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Center(
              child: SvgPicture.asset(
                icon,
                height: 18,
                width: 18,
              ),
            ),
          ),

          SizedBox(width: 12.w),

        
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Text(
                  title,
                  style: AppFonts.custom(
                    size: 16.sp,
                    weight: FontWeight.w500,
                    color: const Color(0xFF374151),
                  ),
                ),

                SizedBox(height: 2.h),

                Text(
                  subtitle,
                  style: AppFonts.custom(
                    size: 14.sp,
                    weight: FontWeight.w400,
                    color: const Color(0xFF6B7280),
                  ),
                ),
              ],
            ),
          ),

       
          Row(
            children: [
              SvgPicture.asset(
                'assets/images/badge2.svg',
                height: 18,
                colorFilter: const ColorFilter.mode(
                  Color(0xFF5E6670),
                  BlendMode.srcIn,
                ),
              ),

              SizedBox(width: 6.w),

              Text(
                value,
                style: AppFonts.custom(
                  size: 20.sp,
                  weight: FontWeight.w600,
                  color: valueColor,
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}


Widget _eventPoint(String text) {
  return Padding(
    padding: EdgeInsets.only(bottom: 4.h),
    child: Text(
      "> $text",
      style: AppFonts.custom(
        size: 12.sp,
        weight: FontWeight.w400,
        color: const Color(0xFF374151),
      ),
    ),
  );
}
}