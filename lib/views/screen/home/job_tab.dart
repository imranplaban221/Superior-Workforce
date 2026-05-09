import 'package:flutter/material.dart';
import 'package:flutter_extension/util/app_colors.dart';
import 'package:flutter_extension/util/app_text.dart';
import 'package:flutter_extension/views/base/custom_job_card.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class JobsTab extends StatefulWidget {
  const JobsTab({super.key});

  @override
  State<JobsTab> createState() => _JobsTabState();
}

class _JobsTabState extends State<JobsTab> {

  int selectedIndex = 0;

  final List<String> tabs = [
    "All",
    "Ongoing",
    "Upcoming",
    "Completed"
  ];

  final List<int> counts = [7, 5, 2, 2];

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
      
                Text("Jobs",
                  style: AppFonts.custom(
                    size: 24.sp,
                    weight: FontWeight.w600,
                    color: const Color(0xFF3D4A57),
                    height: 1,
                  ),
                ),
      
                SizedBox(height: 8.h),
      
                Text(
                  'Track your job record',
                  style: AppFonts.custom(
                    size: 14.sp,
                    weight: FontWeight.w400,
                    color: const Color(0xFF3D4A57),
                    height: 1,
                  ),
                ),
      
                SizedBox(height: 20.h),
      
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(12.w),
                  decoration: BoxDecoration(
                    color: const Color(0xFFE6EDF3),
                    borderRadius: BorderRadius.circular(14.r),
                  ),
                  child: SingleChildScrollView( 
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(tabs.length, (index) {
                        final isSelected = selectedIndex == index;
      
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedIndex = index;
                            });
                          },
                          child: Padding(
                            padding: EdgeInsets.only(right: 8.w), 
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 250),
                              padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 12.w),
                              decoration: BoxDecoration(
                                gradient: isSelected
                                    ? const LinearGradient(
                                        colors: [
                                          Color(0xFF004A8F),
                                          Color(0xFF008290),
                                        ],
                                      )
                                    : null,
                                borderRadius: BorderRadius.circular(16.r),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    tabs[index],
                                    style: AppFonts.custom(
                                      size: 12.sp,
                                      weight: FontWeight.w500,
                                      color: isSelected
                                          ? Colors.white
                                          : const Color(0xFF3D4A57),
                                    ),
                                  ),
      
                                  SizedBox(width: 4.w),
      
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 6.w,
                                      vertical: 2.h,
                                    ),
                                    decoration: BoxDecoration(
                                      color: isSelected
                                          ? Colors.white
                                          : Colors.white,
                                      borderRadius: BorderRadius.circular(20.r),
                                    ),
                                    child: Text(
                                      counts[index].toString(),
                                      style: AppFonts.custom(
                                        size: 12.sp,
                                        weight: FontWeight.w500,
                                        color: isSelected
                                            ? const Color(0xFF004A8F)
                                            : const Color(0xFF3D4A57),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                ),


                 OngoingJobCard(),


                 UpcomingJobCard(),


                 CompletedJobCard(),

      
              ],
            ),
          ),
        ),
      ),
    );
  }
}