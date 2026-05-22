// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_extension/util/app_colors.dart';
import 'package:flutter_extension/util/app_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ViewProfile extends StatefulWidget {
  const ViewProfile({super.key});

  @override
  State<ViewProfile> createState() => _ViewProfileState();
}

bool isExpanded = true;

class _ViewProfileState extends State<ViewProfile> {
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
                        child: const Icon(Icons.arrow_back,
                          size: 32,
                        ),
                      ),
        
                    SizedBox(width: 12.w),
        
                    Text(
                      "View Profile",
                      style: AppFonts.custom(
                        size: 20.sp,
                        weight: FontWeight.w600,
                        color: const Color(0xFF374151),
                      ),
                    ),
                  ],
                ),
        
                SizedBox(height: 16.h),
        
               
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
        
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
        
                      
                          Container(
                            width: 60.w,
                            height: 60.w,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Colors.grey.shade300,
                              ),
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
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
        
                                
                                Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        "Sarah Johnson",
                                        style: AppFonts.custom(
                                          size: 18.sp,
                                          weight: FontWeight.w600,
                                          color: const Color(0xFF374151),
                                        ),
                                      ),
                                    ),
        
                                    
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 10.w,
                                        vertical: 4.h,
                                      ),
                                      decoration: BoxDecoration(
                                        color: const Color(0xFFFEFCE8),
                                        borderRadius: BorderRadius.circular(20.r),
                                      ),
                                      child: Row(
                                        children: [
                                          SvgPicture.asset(
                                            'assets/images/star.svg',
                                            height: 14,
                                            width: 14,
                                            colorFilter:
                                                const ColorFilter.mode(
                                              Color(0xFFF0B100),
                                              BlendMode.srcIn,
                                            ),
                                          ),
                                          SizedBox(width: 4.w),
                                          Text(
                                            "4.8",
                                            style: AppFonts.custom(
                                              size: 12.sp,
                                              weight: FontWeight.w600,
                                              color: const Color(0xFFA65F00),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
        
                                SizedBox(height: 6.h),
        
                             
                                Row(
                                  children: [
                                    SvgPicture.asset(
                                      'assets/images/badge.svg',
                                      height: 16,
                                      width: 16,
                                      colorFilter: const ColorFilter.mode(
                                        Color(0xFF094786),
                                        BlendMode.srcIn,
                                      ),
                                    ),
                                    SizedBox(width: 6.w),
                                    Text(
                                      "Registered Nurse",
                                      style: AppFonts.custom(
                                        size: 14.sp,
                                        weight: FontWeight.w500,
                                        color: const Color(0xFF094786),
                                      ),
                                    ),
                                  ],
                                ),
        
                                SizedBox(height: 4.h),
        
                                
                                Row(
                                  children: [
                                    SvgPicture.asset(
                                      'assets/images/location.svg',
                                      height: 14,
                                      width: 14,
                                      colorFilter: const ColorFilter.mode(
                                        Color(0xFF3E4955),
                                        BlendMode.srcIn,
                                      ),
                                    ),
                                    SizedBox(width: 6.w),
                                    Text(
                                      "San Francisco, CA",
                                      style: AppFonts.custom(
                                        size: 13.sp,
                                        weight: FontWeight.w400,
                                        color: const Color(0xFF3E4955),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
        
                      SizedBox(height: 12.h),
        
                      
                      Text(
                        "Motivated and detail-oriented individual seeking opportunities to apply my skills, grow professionally, and contribute effectively to a dynamic organization.",
                        style: AppFonts.custom(
                          size: 13.sp,
                          weight: FontWeight.w400,
                          color: const Color(0xFF5E6670),
                          height: 1.4,
                        ),
                      ),
        
                      
                       
        
        
        
                    ],
                  ),
                ),
        
                SizedBox(height: 20.h),
        
                Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
        
            
            Text(
        "Contact Information",
        style: AppFonts.custom(
          size: 16.sp,
          weight: FontWeight.w400,
          color: const Color(0xFF374151),
        ),
            ),
        
            SizedBox(height: 12.h),
        
            
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
        
            _contactItem(
              icon: 'assets/images/email.svg',
              title: "Email",
              value: "sarah.johnson@email.com",
            ),
        
            SizedBox(height: 14.h),
        
            _contactItem(
              icon: 'assets/images/phone.svg',
              title: "Phone",
              value: "+1 (415) 555-0123",
            ),
        
            SizedBox(height: 14.h),
        
            _contactItem(
              icon: 'assets/images/location.svg',
              title: "Location",
              value: "San Francisco, CA",
            ),
          ],
        ),
            ),
          ],
        ),
        
        
        SizedBox(height: 20.h),
        
        
        
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
        
          
            Text(
        "Professionals",
        style: AppFonts.custom(
          size: 16.sp,
          weight: FontWeight.w400,
          color: const Color(0xFF374151),
        ),
            ),
        
            SizedBox(height: 8.h),
        
            
            Container(
        padding: EdgeInsets.symmetric(vertical: 12.h),
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
        
            _proItem(
              title: "Specialty",
              value: "Critical Care",
            ),
        
            _divider(),
        
            _proItem(
              title: "Years of Experience",
              value: "5 years",
            ),
        
            _divider(),
        
            _proItem(
              title: "Member Since",
              value: "January 2024",
            ),
          ],
        ),
            ),
          ],
        ),
        
        SizedBox(height: 20.h),
        
        
        
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
        
            GestureDetector(
        onTap: () {
          setState(() {
            isExpanded = !isExpanded;
          });
        },
        child: Row(
          children: [
            Text(
              "Educations",
              style: AppFonts.custom(
                size: 16.sp,
                weight: FontWeight.w400,
                color: const Color(0xFF374151),
              ),
            ),
            const Spacer(),
           Container(
  width: 24.w,
  height: 24.w,
  padding: const EdgeInsets.only(left: 4, right: 7),
  decoration: BoxDecoration(
    color:  Colors.white, 
    borderRadius: BorderRadius.circular(8.r),
  ),
  child: Center(
    child: Icon(
      isExpanded
          ? Icons.keyboard_arrow_up
          : Icons.keyboard_arrow_down,
      size: 20, 
      color:  Colors.black,
    ),
  ),
)
          ],
        ),
            ),
        
            SizedBox(height: 12.h),
        
           
            if (isExpanded)
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
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
        
              
              Container(
                width: 40.w,
                height: 40.w,
                decoration: BoxDecoration(
                  color: const Color(0xFFE6F0FA),
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Center(
                  child: SvgPicture.asset(
                    'assets/images/education.svg',
                    height: 18,
                    colorFilter: const ColorFilter.mode(
                      Color(0xFF2563EB),
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ),
        
              SizedBox(width: 12.w),
        
             
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
        
              
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            "H.S.C",
                            style: AppFonts.custom(
                              size: 18.sp,
                              weight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                        ),
        
                        GestureDetector(
                          onTap: () {},
                          child: SvgPicture.asset(
                            'assets/images/edit.svg',
                            height: 18,
                            colorFilter: const ColorFilter.mode(
                              Color(0xFF0074BE),
                              BlendMode.srcIn,
                            ),
                          ),
                        ),
        
                        SizedBox(width: 16.w),
        
                      
                        GestureDetector(
                          onTap: () {},
                          child: SvgPicture.asset(
                            'assets/images/trash.svg',
                            height: 18,
                            colorFilter: const ColorFilter.mode(
                              Color(0xFFEF4444),
                              BlendMode.srcIn,
                            ),
                          ),
                        ),
                      ],
                    ),
        
                    SizedBox(height: 4.h),
        
                    Text(
                      "Hashil School & College",
                      style: AppFonts.custom(
                        size: 14.sp,
                        weight: FontWeight.w400,
                        color: const Color(0xFF6B7280),
                      ),
                    ),
        
                    SizedBox(height: 8.h),
        
                   
                    Row(
                      children: [
                        Text(
                          "2013",
                          style: AppFonts.custom(
                            size: 14.sp,
                            weight: FontWeight.w400,
                            color: const Color(0xFF6B7280),
                          ),
                        ),
        
                        SizedBox(width: 10.w),
        
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 10.w,
                            vertical: 4.h,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFFE7F8ED),
                            borderRadius: BorderRadius.circular(20.r),
                          ),
                          child: Text(
                            "Completed",
                            style: AppFonts.custom(
                              size: 12.sp,
                              weight: FontWeight.w500,
                              color: const Color(0xFF008236),
                            ),
                          ),
                        ),
                      ],
                    ),
        
                    SizedBox(height: 8.h),
        
                    Text(
                      "License: N/A",
                      style: AppFonts.custom(
                        size: 12.sp,
                        color: const Color(0xFF6B7280),
                      ),
                    ),
        
                    SizedBox(height: 6.h),
        
                    
                    Row(
                      children: [
                        SvgPicture.asset(
                          'assets/images/file.svg',
                          height: 16,
                          colorFilter: const ColorFilter.mode(
                            Color(0xFF0074BE),
                            BlendMode.srcIn,
                          ),
                        ),
                        SizedBox(width: 6.w),
                        Text(
                          "Certificate.png",
                          style: AppFonts.custom(
                            size: 12.sp,
                            weight: FontWeight.w500,
                            color: const Color(0xFF0074BE),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              


            ],
          ),
        ),
          ],
        ),


        SizedBox(height: 20.h),

        

Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [

    
    GestureDetector(
      onTap: () {
        setState(() {
          isExpanded = !isExpanded;
        });
      },
      child: Row(
        children: [
          Text(
            "Documents",
            style: AppFonts.custom(
              size: 16.sp,
              weight: FontWeight.w400,
              color: const Color(0xFF374151),
            ),
          ),
          const Spacer(),

       
          Container(
            width: 24.w,
            height: 24.w,
            padding: const EdgeInsets.only(left: 4,right: 7,),
            decoration: BoxDecoration(
              color:  Colors.white,
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Icon(
              isExpanded
                  ? Icons.keyboard_arrow_up
                  : Icons.keyboard_arrow_down,
              size: 20,
              color:  Colors.black,
            ),
          ),
        ],
      ),
    ),

    SizedBox(height: 12.h),

    
    if (isExpanded)
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

            _docItem(
              icon: 'assets/images/file.svg',
              bgColor:  Colors.green,
              iconColor:  Colors.white,
              title: "Govt. ID",
              date: "Jan 15, 2024",
              status: "Valid",
              statusColor: const Color(0xFF22C55E),
              buttonText: "Download",
              buttonColor: const Color(0xFF22C55E),
            ),

            SizedBox(height: 12.h),

            _docItem(
              icon: 'assets/images/file.svg',
              bgColor: const Color(0xFFFDF2E6),
              iconColor: const Color(0xFFEF4444),
              title: "Govt. ID",
              date: "Jan 15, 2024",
              status: "Invalid",
              statusColor: const Color(0xFFEF4444),
              buttonText: "Upload Again",
              buttonColor: const Color(0xFFEF4444),
            ),

            SizedBox(height: 12.h),

            _docItem(
              icon: 'assets/images/file.svg',
              bgColor: const Color(0xFFE5F1FF),
              iconColor: const Color(0xFF0074BE),
              title: "Govt. ID",
              date: "Jan 15, 2024",
              status: "Reviewing",
              statusColor: const Color(0xFF0074BE),
              buttonText: "Replace",
              buttonColor: const Color(0xFF0074BE),
            ),

            SizedBox(height: 12.h),

            _docItem(
              icon: 'assets/images/file.svg',
              bgColor: const Color(0xFFFFF4E5),
              iconColor: const Color(0xFFED8B35),
              title: "Govt. ID",
              date: "Jan 15, 2024",
              status: "Required",
              statusColor: const Color(0xFFED8B35),
              buttonText: "Upload",
              buttonColor: const Color(0xFFED8B35),
            ),
          ],
        ),
      ),

    SizedBox(height: 20.h),

    
    SizedBox(
      width: double.infinity,
      height: 48.h,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.zero,
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.r),
          ),
        ),
        onPressed: () {},
        child: Ink(
          decoration: BoxDecoration(
            gradient: AppColors.buttonColor,
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Center(
            child: Text(
              "EDIT PROFILE",
              style: AppFonts.custom(
                size: 14.sp,
                weight: FontWeight.w600,
                color: Colors.white,
              ),
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

  Widget _contactItem({
  required String icon,
  required String title,
  required String value,
}) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [

      
      Container(
        width: 40.w,
        height: 40.w,
        decoration: BoxDecoration(
          color: const Color(0xFFE7E8EA),
          borderRadius: BorderRadius.circular(14.r),
        ),
        child: Center(
          child: SvgPicture.asset(
            icon,
            height: 18,
            width: 18,
            colorFilter: const ColorFilter.mode(
              Color(0xFF6B7280),
              BlendMode.srcIn,
            ),
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
                size: 12.sp,
                weight: FontWeight.w400,
                color: const Color(0xFF9CA3AF),
              ),
            ),

           

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

Widget _proItem({
  required String title,
  required String value,
}) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
    child: Row(
      children: [

        
        Expanded(
          child: Text(
            title,
            style: AppFonts.custom(
              size: 14.sp,
              weight: FontWeight.w400,
              color: const Color(0xFF6B7280),
            ),
          ),
        ),

      
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
  );
}

Widget _divider() {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 16.w),
    child: Divider(
      thickness: 1,
      height: 1,
      color: const Color(0xFFE5E7EB),
    ),
  );
}

Widget _docItem({
  required String icon,
  required Color bgColor,
  required Color iconColor,
  required String title,
  required String date,
  required String status,
  required Color statusColor,
  required String buttonText,
  required Color buttonColor,
}) {
  return Container(
    padding: EdgeInsets.all(12.w),
    decoration: BoxDecoration(
      color:  Colors.white,
      borderRadius: BorderRadius.circular(16.r),
       border: Border.all(
    color: const Color(0xFFE7E8EA),
    width: 1.0, 
  ),
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
              colorFilter: ColorFilter.mode(
                iconColor,
                BlendMode.srcIn,
              ),
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
                  size: 14.sp,
                  weight: FontWeight.w600,
                  color: const Color(0xFF374151),
                ),
              ),
              SizedBox(height: 2.h),
              Text(
                date,
                style: AppFonts.custom(
                  size: 12.sp,
                  color: const Color(0xFF6B7280),
                ),
              ),
            ],
          ),
        ),

       
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            Text(
              status,
              style: AppFonts.custom(
                size: 12.sp,
                weight: FontWeight.w600,
                color: statusColor,
              ),
            ),

            SizedBox(height: 6.h),

            Container(
              height: 32.h,
              width: 102.w,
              
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.r),
                border: Border.all(color: buttonColor),
                
              ),
              child: Center(
                child: Text(
                  buttonText,
                  style: AppFonts.custom(
                    size: 12.sp,
                    weight: FontWeight.w500,
                    color: buttonColor,
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