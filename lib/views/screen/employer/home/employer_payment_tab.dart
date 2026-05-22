// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_extension/util/app_colors.dart';
import 'package:flutter_extension/util/app_text.dart';
import 'package:flutter_extension/views/base/custom_add_amount.dart';


import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class EmployerPaymentTab extends StatefulWidget {
  const EmployerPaymentTab({super.key});

  @override
  State<EmployerPaymentTab> createState() => _EmployerPaymentTabState();
}

class _EmployerPaymentTabState extends State<EmployerPaymentTab> {

  bool isPendingExpanded = true;
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
                  Text("Payments",
                  style: AppFonts.custom(
                    size: 24.sp,
                    weight: FontWeight.w600,
                    color:  Colors.black,
                    height: 1,
                  ),
                ),
      
                SizedBox(height: 8.h),
      
                Text(
                  'Manage your employee payments',
                  style: AppFonts.custom(
                    size: 14.sp,
                    weight: FontWeight.w400,
                    color: const Color(0xFF3D4A57),
                    height: 1,
                  ),
                ),
      
                SizedBox(height: 20.h),

                Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [

    _earningBox(
      imagePath: 'assets/images/doller.svg',
      imageColor: const Color(0xFF22C55E),
      amount: "\$1221",
      title: "Total Paid",
    ),

    _earningBox(
      imagePath: 'assets/images/clock.svg',
      imageColor: const Color(0xFFF97316),
      amount: "10",
      title: "Pending",
    ),

    _earningBox(
      imagePath: 'assets/images/arrow.svg',
      imageColor: const Color(0xFF3B82F6),
      amount: "25",
      title: "Completed",
    ),

  ],
),

SizedBox(height: 20.h,),

const CustomAddAmount(),

SizedBox(height: 20.h,),


Column(
  children: [

   
    GestureDetector(
      onTap: () {

        setState(() {

          isPendingExpanded =
              !isPendingExpanded;
        });
      },

      child: Row(
        children: [

          Expanded(
            child: Text(
              "Pending Payment",
              style: AppFonts.custom(
                size: 16.sp,
                weight: FontWeight.w400,
                color: const Color(0xFF374151),
              ),
            ),
          ),

          AnimatedRotation(
            turns:
                isPendingExpanded
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

    SizedBox(height: 14.h),

    if (isPendingExpanded)
      _paymentJobCard(
        image:
            'assets/images/spider_man.jpg',
        title: "Job Title",
        role: "CNA",
        status: "Ongoing",
        location: "Los Angeles, CA",
        assignedEmployees: 10,
        salary: "\$22 / hour",
        shift: "Night Shift",
        jobType: "Full-time",
        date: "12 March, 2026",
        remainingTime: "2h remaining",

        onViewDetails: () {

         
        },
      ),
  ],
),






                


                 



              ],
            ),
          ),
        ),
      ));
  }

  Widget _earningBox({
  required String imagePath,
  required Color imageColor,
  required String amount,
  required String title,
}) {
  return Container(
    width: 110.w,
    constraints: BoxConstraints( 
      minHeight: 106.h,
    ),
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
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min, 
      children: [

        Container(
          padding: EdgeInsets.all(8.8.w),
          decoration: BoxDecoration(
            
            color: imageColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: SvgPicture.asset(
  imagePath,
  height: 17,
  width: 17,
  colorFilter: ColorFilter.mode(
    imageColor, 
    BlendMode.srcIn,
  ),
),
        ),

        SizedBox(height: 10.h),

        Text(
          amount,
          style: AppFonts.custom(
            size: 18.sp,
            weight: FontWeight.w600,
            color: Colors.black,
          ),
        ),

        SizedBox(height: 4.h),

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

Widget _paymentJobCard({
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

       
        Row(
          crossAxisAlignment:
              CrossAxisAlignment.start,
          children: [

            Container(
              width: 40.w,
              height: 40.w,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius:
                    BorderRadius.circular(
                        12.r),
                boxShadow: const [
                  BoxShadow(
                    color:
                        Color(0x14000000),
                    offset:
                        Offset(0, 4),
                    blurRadius: 8,
                  ),
                ],
              ),
              clipBehavior:
                  Clip.antiAlias,
              child: Image.asset(
                image,
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

                  Text(
                    title,
                    style:
                        AppFonts.custom(
                      size: 22.sp,
                      weight:
                          FontWeight.w600,
                      color:
                          const Color(
                              0xFF374151),
                    ),
                  ),

                  SizedBox(height: 4.h),

                  Row(
                    children: [

                      Text(
                        role,
                        style:
                            AppFonts
                                .custom(
                          size:
                              14.sp,
                          weight:
                              FontWeight
                                  .w600,
                          color:
                              const Color(
                                  0xFF0074BE),
                        ),
                      ),

                      SizedBox(
                          width:
                              6.w),

                      Text(
                        status,
                        style:
                            AppFonts
                                .custom(
                          size:
                              12.sp,
                          weight:
                              FontWeight
                                  .w400,
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

        
        _paymentInfoRow(
          icon:
              'assets/images/location.svg',
          text: location,
        ),

        SizedBox(height: 14.h),

        
        _paymentInfoRow(
          icon:
              'assets/images/user.svg',
          text: "Employees Assigned",

          trailing: Container(
            width: 32.w,
            height: 32.w,
            decoration:
                 BoxDecoration(
              color:
                  const Color(0xFFE5F1FF),
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: Text(
                assignedEmployees
                    .toString(),
                style:
                    AppFonts.custom(
                  size: 12.sp,
                  weight:
                      FontWeight.w600,
                  color:
                      const Color(
                          0xFF0074BE),
                ),
              ),
            ),
          ),
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
              style:
                  AppFonts.custom(
                size: 16.sp,
                weight:
                    FontWeight.w600,
                color:
                    const Color(
                        0xFF22C55E),
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
              shift,
              style:
                  AppFonts.custom(
                size: 14.sp,
                weight:
                    FontWeight.w400,
                color:
                    const Color(
                        0xFF4B5563),
              ),
            ),

            SizedBox(width: 6.w),

            Text(
              "•",
              style:
                  AppFonts.custom(
                size: 14.sp,
                color:
                    const Color(
                        0xFF6B7280),
              ),
            ),

            SizedBox(width: 6.w),

            Text(
              jobType,
              style:
                  AppFonts.custom(
                size: 14.sp,
                weight:
                    FontWeight.w400,
                color:
                    const Color(
                        0xFF4B5563),
              ),
            ),

            const Spacer(),

            Text(
              date,
              style:
                  AppFonts.custom(
                size: 14.sp,
                weight:
                    FontWeight.w400,
                color:
                    const Color(
                        0xFF6B7280),
              ),
            ),
          ],
        ),

        SizedBox(height: 14.h),

        const Divider(
          height: 1,
          color:
              Color(0xFFE5E7EB),
        ),

        SizedBox(height: 14.h),

       
        Row(
          children: [

            SvgPicture.asset(
              'assets/images/time.svg',
              height: 16.h,
              width: 16.w,
              colorFilter:
                  const ColorFilter.mode(
                Color(0xFF0074BE),
                BlendMode.srcIn,
              ),
            ),

            SizedBox(width: 6.w),

            Expanded(
              child: Text(
                remainingTime,
                style:
                    AppFonts.custom(
                  size: 14.sp,
                  weight:
                      FontWeight.w500,
                  color:
                      const Color(
                          0xFF0074BE),
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
                decoration:
                    BoxDecoration(
                  gradient:
                      AppColors
                          .buttonColor,
                  borderRadius:
                      BorderRadius
                          .circular(
                              10.r),
                ),

                child: Text(
                  "ViewDetails",
                  style:
                      AppFonts.custom(
                    size: 14.sp,
                    weight:
                        FontWeight
                            .w600,
                    color:
                        Colors.white,
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
Widget _paymentInfoRow({
  required String icon,
  required String text,
  Widget? trailing,
}) {
  return Row(
    children: [

      SvgPicture.asset(
        icon,
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
          text,
          style: AppFonts.custom(
            size: 15.sp,
            weight: FontWeight.w400,
            color:
                const Color(0xFF4B5563),
          ),
        ),
      ),

      if (trailing != null)
        trailing,
    ],
  );
}
}