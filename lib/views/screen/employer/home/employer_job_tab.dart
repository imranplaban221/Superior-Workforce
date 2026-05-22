import 'package:flutter/material.dart';
import 'package:flutter_extension/helper/route_helper.dart';
import 'package:flutter_extension/util/app_colors.dart';
import 'package:flutter_extension/util/app_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class EmployerJobTab extends StatefulWidget {
  const EmployerJobTab({super.key});

  @override
  State<EmployerJobTab> createState() =>
      _EmployerJobTabState();
}

class _EmployerJobTabState
    extends State<EmployerJobTab> {

  int selectedIndex = 0;

  final List<Map<String, dynamic>> tabs = [
    {
      "title": "All",
      "count": 7,
    },
    {
      "title": "Ongoing",
      "count": 5,
    },
    {
      "title": "Upcoming",
      "count": 2,
    },
    {
      "title": "Completed",
      "count": 2,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,

      body: SafeArea(
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.start,
            children: [

              SizedBox(height: 20.h),

            
              Row(
                children: [

                  Expanded(
                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start,
                      children: [

                        Text(
                          "All Jobs",
                          style: AppFonts.custom(
                            size: 24.sp,
                            weight: FontWeight.w600,
                            color:
                                const Color(0xFF374151),
                          ),
                        ),

                        SizedBox(height: 4.h),

                        Text(
                          "7 total candidates",
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

              SizedBox(height: 28.h),

             
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(14.w),
                decoration: BoxDecoration(
                  color: const Color(0xFFE9EEF5),
                  borderRadius:
                      BorderRadius.circular(20.r),
                ),
                child: SingleChildScrollView(
  scrollDirection: Axis.horizontal,

  child: Row(
    children: List.generate(
      tabs.length,
      (index) {

        final isSelected =
            selectedIndex == index;

        return Padding(
          padding:
              EdgeInsets.only(right: 12.w),

          child: GestureDetector(
            onTap: () {

              setState(() {

                selectedIndex = index;
              });
            },

            child: AnimatedContainer(
              duration: const Duration(
                  milliseconds: 200),

              padding:
                  EdgeInsets.symmetric(
                horizontal: 12.w,
                vertical: 12.h,
              ),

              decoration: BoxDecoration(

                gradient: isSelected
                    ? AppColors.buttonColor
                    : null,

                color: isSelected
                    ? null
                    : Colors.transparent,

                borderRadius:
                    BorderRadius.circular(
                        30.r),

                boxShadow: isSelected
                    ? const [
                        BoxShadow(
                          color:
                              Color(0x26000000),
                          offset:
                              Offset(0, 4),
                          blurRadius: 8,
                        ),
                      ]
                    : [],
              ),

              child: Row(
                children: [

                  Text(
                    tabs[index]['title'],
                    style:
                        AppFonts.custom(
                      size: 12.sp,
                      weight:
                          FontWeight.w500,
                      color: isSelected
                          ? Colors.white
                          : const Color(
                              0xFF4B5563),
                    ),
                  ),

                  SizedBox(width: 8.w),

                  Container(
                    width: 26.w,
                    height: 26.w,
                    decoration:
                        const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text(
                        tabs[index]['count']
                            .toString(),
                        style:
                            AppFonts.custom(
                          size: 12.sp,
                          weight:
                              FontWeight
                                  .w500,
                          color:
                              const Color(
                                  0xFF4B5563),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    ),
  ),
),
              ),

              SizedBox(height: 34.h),

            
              Text(
                "09 Jobs",
                style: AppFonts.custom(
                  size: 16.sp,
                  weight: FontWeight.w400,
                  color: const Color(0xFF374151),
                ),
              ),


              SizedBox(height: 20.h),

Expanded(
  child: SingleChildScrollView(
    child: Column(
      children: [

        buildJobCard(
          image:
              'assets/images/cat.jpg',
          title: "Job Title",
          role: "CNA",
          status: "Ongoing",
          location: "Los Angeles, CA",
          assignedEmployees: 10,
          salary: "\$22 /hour",
          shift: "Night Shift",
          jobType: "Full-time",
          date: "12 March, 2026",
          remainingTime: "2h remaining",

          onViewDetails: () {

             Get.toNamed(AppRoutes.employerJobDetails);

           
          },
        ),

        buildJobCard(
          image:
              'assets/images/cat.jpg',
          title: "ICU Nurse",
          role: "RN",
          status: "Upcoming",
          location: "Chicago, IL",
          assignedEmployees: 5,
          salary: "\$35 /hour",
          shift: "Day Shift",
          jobType: "Part-time",
          date: "18 March, 2026",
          remainingTime: "5h remaining",

          onViewDetails: () {

          Get.toNamed(AppRoutes.employerJobDetails);
          },
        ),

        buildJobCard(
          image:
              'assets/images/cat.jpg',
          title: "ICU Nurse",
          role: "RN",
          status: "Completed",
          location: "Chicago, IL",
          assignedEmployees: 5,
          salary: "\$35 /hour",
          shift: "Day Shift",
          jobType: "Part-time",
          date: "18 March, 2026",
          remainingTime: "5h remaining",

          onViewDetails: () {

          Get.toNamed(AppRoutes.employerJobDetails);
          },
        ),
      ],
    ),
  ),
),
            ],
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
          decoration: const BoxDecoration(
            color: Color(0xFFE7E8EA),
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
            decoration: const BoxDecoration(
              color: Color(0xFFEF4444),
              shape: BoxShape.circle,
              
            ),
            child: Center(
              child: Text(
                "3",
                style: TextStyle(
                  fontSize: 8.sp,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
  Widget buildJobCard({
  required String image,
  required String title,
  required String role,
  required String status,
  required String location,
  required int assignedEmployees,
  required String salary,
  required String shift,
  required String jobType,
  required String date,
  required String remainingTime,
  required VoidCallback onViewDetails,
}) {
  return Container(
    width: double.infinity,
    margin: EdgeInsets.only(bottom: 20.h),
    padding: EdgeInsets.all(16.w),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(20.r),
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
              width: 44.w,
              height: 44.w,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius:
                    BorderRadius.circular(14.r),
                    
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x14000000),
                    offset: Offset(0, 4),
                    blurRadius: 8,
                  ),
                ],
              ),
              clipBehavior: Clip.antiAlias, 
              child: Image.asset(
  image,
  width: double.infinity,
  height: double.infinity,
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
                    title,
                    style: AppFonts.custom(
                      size: 20.sp,
                      weight: FontWeight.w600,
                      color:
                          const Color(0xFF374151),
                    ),
                  ),

                  SizedBox(height: 4.h),

                  Row(
                    children: [

                      Text(
                        role,
                        style:
                            AppFonts.custom(
                          size: 14.sp,
                          weight:
                              FontWeight.w600,
                          color:
                              const Color(
                                  0xFF0074BE),
                        ),
                      ),

                      SizedBox(width: 8.w),

                      Text(
                        status,
                        style:
                            AppFonts.custom(
                          size: 12.sp,
                          weight:
                              FontWeight.w400,
                          color:
                              const Color(
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

        SizedBox(height: 18.h),

     
        Row(
          children: [

            SvgPicture.asset(
              'assets/images/location.svg',
              height: 18.h,
              width: 18.w,
              colorFilter:
                  const ColorFilter.mode(
                Color(0xFF6B7280),
                BlendMode.srcIn,
              ),
            ),

            SizedBox(width: 8.w),

            Text(
              location,
              style: AppFonts.custom(
                size: 16.sp,
                weight: FontWeight.w400,
                color: const Color(0xFF4B5563),
              ),
            ),
          ],
        ),

        SizedBox(height: 14.h),

        
        Row(
          children: [

            SvgPicture.asset(
              'assets/images/user.svg',
              height: 18.h,
              width: 18.w,
              colorFilter:
                  const ColorFilter.mode(
                Color(0xFF6B7280),
                BlendMode.srcIn,
              ),
            ),

            SizedBox(width: 8.w),

            Expanded(
              child: Text(
                "Employees Assigned",
                style: AppFonts.custom(
                  size: 16.sp,
                  weight: FontWeight.w400,
                  color:
                      const Color(0xFF4B5563),
                ),
              ),
            ),

            Container(
              width: 32.w,
              height: 32.w,
              decoration:  BoxDecoration(
                color: const Color(0xFFE5F1FF),
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(11),
              ),
              child: Center(
                child: Text(
                  assignedEmployees
                      .toString(),
                  style: AppFonts.custom(
                    size: 14.sp,
                    weight:
                        FontWeight.w600,
                    color:
                        const Color(
                            0xFF0074BE),
                  ),
                ),
              ),
            ),
          ],
        ),

        SizedBox(height: 14.h),

        
        Row(
          children: [

            SvgPicture.asset(
              'assets/images/doller.svg',
              height: 18.h,
              width: 18.w,
              colorFilter:
                  const ColorFilter.mode(
                Color(0xFF22C55E),
                BlendMode.srcIn,
              ),
            ),

            SizedBox(width: 8.w),

            Text(
              salary,
              style: AppFonts.custom(
                size: 16.sp,
                weight: FontWeight.w700,
                color: const Color(0xFF22C55E),
              ),
            ),
          ],
        ),

        SizedBox(height: 14.h),

       
        Row(
          children: [

            SvgPicture.asset(
              'assets/images/clock.svg',
              height: 18.h,
              width: 18.w,
              colorFilter:
                  const ColorFilter.mode(
                Color(0xFF4B5563),
                BlendMode.srcIn,
              ),
            ),

            SizedBox(width: 8.w),

            Text(
              "$shift  • $jobType",
              style: AppFonts.custom(
                size: 14.sp,
                weight: FontWeight.w400,
                color: const Color(0xFF4B5563),
              ),
            ),

            const Spacer(),

            Text(
              date,
              style: AppFonts.custom(
                size: 14.sp,
                weight: FontWeight.w400,
                color: const Color(0xFF6B7280),
              ),
            ),
          ],
        ),

        SizedBox(height: 14.h),

        const Divider(
          height: 1,
          color: Color(0xFFE5E7EB),
        ),

        SizedBox(height: 14.h),

    
        Row(
          children: [

            SvgPicture.asset(
              'assets/images/time.svg',
              height: 18.h,
              width: 18.w,
              colorFilter:
                  const ColorFilter.mode(
                Color(0xFF0074BE),
                BlendMode.srcIn,
              ),
            ),

            SizedBox(width: 8.w),

            Expanded(
              child: Text(
                remainingTime,
                style: AppFonts.custom(
                  size: 14.sp,
                  weight: FontWeight.w500,
                  color:
                      const Color(0xFF0074BE),
                ),
              ),
            ),

            
            GestureDetector(
              onTap: onViewDetails,

              child: Container(
                padding:
                    EdgeInsets.symmetric(
                  horizontal: 18.w,
                  vertical: 10.h,
                ),
                decoration: BoxDecoration(
                  gradient:
                      AppColors.buttonColor,
                  borderRadius:
                      BorderRadius.circular(
                          10.r),
                ),
                child: Text(
                  "View Details",
                  style: AppFonts.custom(
                    size: 14.sp,
                    weight:
                        FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
}