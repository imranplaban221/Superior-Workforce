import 'package:flutter/material.dart';
import 'package:flutter_extension/util/app_colors.dart';
import 'package:flutter_extension/util/app_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CandidateProfile extends StatefulWidget {
  const CandidateProfile({super.key});

  @override
  State<CandidateProfile> createState() =>
      _CandidateProfileState();
}

class _CandidateProfileState
    extends State<CandidateProfile> {

    

List<String> selectedCertificates = [];
List<String> selectedSkills = [];

final List<String> certificates = [
  "BLS",
  "ACLS",
  "PALS",
  "RN License",
  "CNA License",
  "CPR Certified",
];

final List<String> skills = [
  "Vital Signs",
  "CPR",
  "Medical Records",
  "IV Therapy",
  "Wound Care",
];

final TextEditingController skillController =
    TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,

      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              children: [

                SizedBox(height: 18.h),

        
                Row(
                  children: [

                    GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: SvgPicture.asset(
                        'assets/images/arrow_back.svg',
                        height: 22.h,
                        width: 22.w,
                        colorFilter: const ColorFilter.mode(
                          Color(0xFF374151),
                          BlendMode.srcIn,
                        ),
                      ),
                    ),

                    SizedBox(width: 16.w),

                    Expanded(
                      child: Text(
                        "Candidate Profile",
                        style: AppFonts.custom(
                          size: 24.sp,
                          weight: FontWeight.w600,
                          color: const Color(0xFF374151),
                        ),
                      ),
                    ),

            
                    Container(
                      width: 42.w,
                      height: 42.w,
                      decoration: const BoxDecoration(
                        color: Color(0xFFFFF1EB),
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: SvgPicture.asset(
                          'assets/images/heart_fill.svg',
                          height: 18.h,
                          colorFilter:
                              const ColorFilter.mode(
                            Color(0xFFFF5A5F),
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 24.h),

        
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(18.w),
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
                            width: 72.w,
                            height: 72.w,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(
                                      50.r),
                            ),
                            clipBehavior: Clip.antiAlias,
                            child: Image.asset(
                              'assets/images/spider_man.jpg',
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

                                Row(
                                  children: [

                                    Expanded(
                                      child: Text(
                                        "Sarah Johnson",
                                        style:
                                            AppFonts.custom(
                                          size: 18.sp,
                                          weight:
                                              FontWeight
                                                  .w600,
                                          color:
                                              const Color(
                                                  0xFF374151),
                                        ),
                                      ),
                                    ),

                                    Container(
                                      padding:
                                          EdgeInsets.symmetric(
                                        horizontal: 10.w,
                                        vertical: 6.h,
                                      ),
                                      decoration:
                                          BoxDecoration(
                                        color:
                                            const Color(
                                                0xFFFEFCE8),
                                        borderRadius:
                                            BorderRadius
                                                .circular(
                                                    20.r),
                                      ),
                                      child: Row(
                                        children: [

                                          SvgPicture.asset(
                                            'assets/images/star.svg',
                                            height: 14.h,
                                            width: 14.w,
                                          ),

                                          SizedBox(
                                              width: 4.w),

                                          Text(
                                            "4.8",
                                            style:
                                                AppFonts
                                                    .custom(
                                              size: 14.sp,
                                              weight:
                                                  FontWeight
                                                      .w600,
                                              color: const Color(
                                                  0xFFA65F00),
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
                                      height: 16.h,
                                      colorFilter:
                                          const ColorFilter.mode(
                                        Color(
                                            0xFF0057B8),
                                        BlendMode.srcIn,
                                      ),
                                    ),

                                    SizedBox(
                                        width: 6.w),

                                    Text(
                                      "Registered Nurse",
                                      style:
                                          AppFonts.custom(
                                        size: 14.sp,
                                        weight:
                                            FontWeight
                                                .w400,
                                        color:
                                            const Color(
                                                0xFF0057B8),
                                      ),
                                    ),
                                  ],
                                ),

                                SizedBox(height: 8.h),

                              
                                Row(
                                  children: [

                                    SvgPicture.asset(
                                      'assets/images/location.svg',
                                      height: 16.h,
                                      colorFilter:
                                          const ColorFilter.mode(
                                        Color(
                                            0xFF6B7280),
                                        BlendMode.srcIn,
                                      ),
                                    ),

                                    SizedBox(
                                        width: 6.w),

                                    Text(
                                      "San Francisco, CA",
                                      style:
                                          AppFonts.custom(
                                        size: 14.sp,
                                        weight:
                                            FontWeight
                                                .w400,
                                        color:
                                            const Color(
                                                0xFF4B5563),
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

                     
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(16.w),
                        decoration: BoxDecoration(
                          color: const Color(0xFFE9F5EC),
                          borderRadius:
                              BorderRadius.circular(
                                  16.r),
                        ),
                        child: Column(
                          crossAxisAlignment:
                              CrossAxisAlignment.start,
                          children: [

                         
                            Row(
                              children: [

                                SvgPicture.asset(
                                  'assets/images/experience.svg',
                                  height: 16.h,
                                  colorFilter:
                                      const ColorFilter.mode(
                                    Color(
                                        0xFF374151),
                                    BlendMode.srcIn,
                                  ),
                                ),

                                SizedBox(width: 8.w),

                                Text(
                                  "5 years experience",
                                  style:
                                      AppFonts.custom(
                                    size: 12.sp,
                                    weight:
                                        FontWeight
                                            .w500,
                                    color:
                                        const Color(
                                            0xFF374151),
                                  ),
                                ),
                              ],
                            ),

                            SizedBox(height: 12.h),

                          
                            Text(
                              "Motivated and detail-oriented individual seeking opportunities to apply my skills, grow professionally, and contribute effectively to a dynamic organization.",
                              style: AppFonts.custom(
                                size: 12.sp,
                                weight:
                                    FontWeight.w400,
                                color:
                                    const Color(
                                        0xFF6B7280),
                                height: 1.4,
                              ),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: 18.h),

                      Divider(
                        color: const Color(0xFFE5E7EB),
                        height: 1.h,
                      ),

                      SizedBox(height: 18.h),

                      
                      Row(
                        children: [

                         
                          Expanded(
                            child: Row(
                              children: [

                                Container(
                                  width: 40.w,
                                  height: 40.w,
                                  decoration:
                                      BoxDecoration(
                                    color:
                                        const Color(0xFFE5F1FF),
                                    shape:
                                        BoxShape.rectangle,
                                        borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Center(
                                    child:
                                        SvgPicture.asset(
                                      'assets/images/email.svg',
                                      height: 18.h,
                                      colorFilter:
                                          const ColorFilter.mode(
                                        Color(
                                            0xFF0074BE),
                                        BlendMode
                                            .srcIn,
                                      ),
                                    ),
                                  ),
                                ),

                                SizedBox(width: 10.w),

                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment
                                            .start,
                                    children: [

                                      Text(
                                        "Email",
                                        style:
                                            AppFonts
                                                .custom(
                                          size: 12.sp,
                                          weight:
                                              FontWeight
                                                  .w400,
                                          color: const Color(
                                              0xFF6B7280),
                                        ),
                                      ),

                                      SizedBox(
                                          height: 2.h),

                                      Text(
                                        "sarah.johnson@",
                                        overflow:
                                            TextOverflow
                                                .ellipsis,
                                        style:
                                            AppFonts
                                                .custom(
                                          size: 14.sp,
                                          weight:
                                              FontWeight
                                                  .w400,
                                          color: const Color(
                                              0xFF374151),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),

                          Container(
                            width: 1.w,
                            height: 45.h,
                            color: const Color(
                                0xFFE5E7EB),
                                
                          ),

                          SizedBox(width: 16.w),

                        
                          Expanded(
                            child: Row(
                              children: [

                                Container(
                                  width: 40.w,
                                  height: 40.w,
                                  decoration:
                                     BoxDecoration(
                                    color:
                                        const Color(0xFFE9F9EE),
                                     shape:
                                        BoxShape.rectangle,
                                        borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Center(
                                    child:
                                        SvgPicture.asset(
                                      'assets/images/phone.svg',
                                      height: 18.h,
                                      colorFilter:
                                          const ColorFilter.mode(
                                        Color(
                                            0xFF22C55E),
                                        BlendMode
                                            .srcIn,
                                      ),
                                    ),
                                  ),
                                ),

                                SizedBox(width: 10.w),

                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment
                                            .start,
                                    children: [

                                      Text(
                                        "Phone",
                                        style:
                                            AppFonts
                                                .custom(
                                          size: 12.sp,
                                          weight:
                                              FontWeight
                                                  .w400,
                                          color: const Color(
                                              0xFF6B7280),
                                        ),
                                      ),

                                      SizedBox(
                                          height: 2.h),

                                      Text(
                                        "+1 (415) 555-01",
                                        overflow:
                                            TextOverflow
                                                .ellipsis,
                                        style:
                                            AppFonts
                                                .custom(
                                          size: 14.sp,
                                          weight:
                                              FontWeight
                                                  .w400,
                                          color: const Color(
                                              0xFF374151),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 20.h),

                
Align(
  alignment: Alignment.centerLeft,
  child: Text(
    "Certificate",
    style: AppFonts.custom(
      size: 14.sp,
      weight: FontWeight.w400,
      color: const Color(0xFF374151),
    ),
  ),
),

SizedBox(height: 12.h),


Container(
  width: double.infinity,
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
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [

  
      if (selectedCertificates.isNotEmpty)
        Wrap(
          spacing: 10.w,
          runSpacing: 10.h,
          children:
              selectedCertificates.map((certificate) {

            return Container(
              padding: EdgeInsets.symmetric(
                horizontal: 16.w,
                vertical: 10.h,
              ),
              decoration: BoxDecoration(
                gradient: AppColors.buttonColor,
                borderRadius:
                    BorderRadius.circular(30.r),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [

                  Text(
                    certificate,
                    style: AppFonts.custom(
                      size: 12.sp,
                      weight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),

                  SizedBox(width: 8.w),

                  GestureDetector(
                    onTap: () {
                      toggleCertificate(
                          certificate);
                    },
                    child: Icon(
                      Icons.close,
                      size: 18.sp,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ),

      if (selectedCertificates.isNotEmpty)
        SizedBox(height: 16.h),

     
      Wrap(
        spacing: 10.w,
        runSpacing: 10.h,
        children: certificates
    .where(
      (certificate) =>
          !selectedCertificates.contains(
              certificate),
    )
    .map((certificate) {

          final isSelected =
              selectedCertificates
                  .contains(certificate);

          return GestureDetector(
            onTap: () {
              toggleCertificate(certificate);
            },

            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: 16.w,
                vertical: 10.h,
              ),
              decoration: BoxDecoration(

                gradient: isSelected
                    ? AppColors.buttonColor
                    : null,

                color: isSelected
                    ? null
                    : Colors.white,

                borderRadius:
                    BorderRadius.circular(14.r),

                border: Border.all(
                  color: isSelected
                      ? Colors.transparent
                      : const Color(0xFFD1D5DB),
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [

                  Text(
                    certificate,
                    style: AppFonts.custom(
                      size: 12.sp,
                      weight: FontWeight.w400,
                      color: isSelected
                          ? Colors.white
                          : const Color(
                              0xFF6B7280),
                    ),
                  ),

                  if (isSelected) ...[

                    SizedBox(width: 8.w),

                    Icon(
                      Icons.close,
                      size: 12.sp,
                      color: Colors.white,
                    ),
                  ],
                ],
              ),
            ),
          );
        }).toList(),
      ),
    ],
  ),
),

SizedBox(height: 20.h),


Align(
  alignment: Alignment.centerLeft,
  child: Text(
    "Documents",
    style: AppFonts.custom(
      size: 14.sp,
      weight: FontWeight.w400,
      color: const Color(0xFF374151),
    ),
  ),
),

SizedBox(height: 12.h),


Container(
  width: double.infinity,
  padding: EdgeInsets.symmetric(
    horizontal: 16.w,
    vertical: 18.h,
  ),
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
  child: Row(
    children: [

      Expanded(
        child: Text(
          "Resume",
          style: AppFonts.custom(
            size: 14.sp,
            weight: FontWeight.w400,
            color: const Color(0xFF6B7280),
          ),
        ),
      ),

      Container(
        width: 28.w,
        height: 28.w,
        decoration:  BoxDecoration(
          color: const Color(0xFFE5F1FF),
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: SvgPicture.asset(
            'assets/images/download.svg',
            height: 14.h,
            colorFilter: const ColorFilter.mode(
              Color(0xFF0074BE),
              BlendMode.srcIn,
            ),
          ),
        ),
      ),
    ],
  ),
),

SizedBox(height: 20.h),


Align(
  alignment: Alignment.centerLeft,
  child: Text(
    "Skills",
    style: AppFonts.custom(
      size: 14.sp,
      weight: FontWeight.w400,
      color: const Color(0xFF374151),
    ),
  ),
),

SizedBox(height: 12.h),


Container(
  width: double.infinity,
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
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [

     
      if (selectedSkills.isNotEmpty)
        Wrap(
          spacing: 10.w,
          runSpacing: 10.h,
          children: selectedSkills.map((skill) {

            return Container(
              padding: EdgeInsets.symmetric(
                horizontal: 16.w,
                vertical: 10.h,
              ),
              decoration: BoxDecoration(
                gradient: AppColors.buttonColor,
                borderRadius:
                    BorderRadius.circular(30.r),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [

                  Text(
                    skill,
                    style: AppFonts.custom(
                      size: 12.sp,
                      weight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),

                  SizedBox(width: 8.w),

                  GestureDetector(
                    onTap: () {
                      toggleSkill(skill);
                    },
                    child: Icon(
                      Icons.close,
                      size: 18.sp,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ),

      if (selectedSkills.isNotEmpty)
        SizedBox(height: 16.h),

    

      SizedBox(height: 16.h),

      
      Wrap(
        spacing: 10.w,
        runSpacing: 10.h,
        children: skills
    .where(
      (skill) =>
          !selectedSkills.contains(skill),
    )
    .map((skill) {

          final isSelected =
              selectedSkills.contains(skill);

          return GestureDetector(
            onTap: () {
              toggleSkill(skill);
            },

            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: 16.w,
                vertical: 10.h,
              ),
              decoration: BoxDecoration(

                gradient: isSelected
                    ? AppColors.buttonColor
                    : null,

                color: isSelected
                    ? null
                    : Colors.white,

                borderRadius:
                    BorderRadius.circular(14.r),

                border: Border.all(
                  color: isSelected
                      ? Colors.transparent
                      : const Color(0xFFD1D5DB),
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [

                  Text(
                    skill,
                    style: AppFonts.custom(
                      size: 12.sp,
                      weight: FontWeight.w400,
                      color: isSelected
                          ? Colors.white
                          : const Color(
                              0xFF6B7280),
                    ),
                  ),

                  if (isSelected) ...[

                    SizedBox(width: 8.w),

                    Icon(
                      Icons.close,
                      size: 16.sp,
                      color: Colors.white,
                    ),
                  ],
                ],
              ),
            ),
          );
        }).toList(),
      ),
    ],
  ),
),

SizedBox(height: 20.h),



Align(
  alignment: Alignment.centerLeft,
  child: Text(
    "Education",
    style: AppFonts.custom(
      size: 16.sp,
      weight: FontWeight.w400,
      color: const Color(0xFF374151),
    ),
  ),
),

SizedBox(height: 12.h),


Container(
  width: double.infinity,
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
  child: Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [


      Container(
        width: 44.w,
        height: 44.w,
        decoration: BoxDecoration(
          color: const Color(0xFFFFF1EB),
          borderRadius:
              BorderRadius.circular(14.r),
        ),
        child: Center(
          child: SvgPicture.asset(
            'assets/images/education.svg',
            height: 20.h,
            colorFilter: const ColorFilter.mode(
              Color(0xFFF59E0B),
              BlendMode.srcIn,
            ),
          ),
        ),
      ),

      SizedBox(width: 12.w),

     
      Expanded(
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,
          children: [

            Text(
              "H.S.C",
              style: AppFonts.custom(
                size: 18.sp,
                weight: FontWeight.w600,
                color: const Color(0xFF374151),
              ),
            ),

            SizedBox(height: 4.h),

            Text(
              "Hashil School & College",
              style: AppFonts.custom(
                size: 14.sp,
                weight: FontWeight.w400,
                color: const Color(0xFF4B5563),
              ),
            ),

            SizedBox(height: 10.h),

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
                    color: const Color(0xFFE9F9EE),
                    borderRadius:
                        BorderRadius.circular(20.r),
                  ),
                  child: Text(
                    "Completed",
                    style: AppFonts.custom(
                      size: 12.sp,
                      weight: FontWeight.w500,
                      color: const Color(0xFF16A34A),
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: 10.h),

            Text(
              "License: N/A",
              style: AppFonts.custom(
                size: 12.sp,
                weight: FontWeight.w400,
                color: const Color(0xFF6B7280),
              ),
            ),

            SizedBox(height: 10.h),

            GestureDetector(
              onTap: () {},

              child: Row(
                children: [

                  SvgPicture.asset(
                    'assets/images/file.svg',
                    height: 16.h,
                    colorFilter:
                        const ColorFilter.mode(
                      Color(0xFF0074BE),
                      BlendMode.srcIn,
                    ),
                  ),

                  SizedBox(width: 6.w),

                  Text(
                    "Certificate.png",
                    style: AppFonts.custom(
                      size: 14.sp,
                      weight: FontWeight.w500,
                      color: const Color(0xFF0074BE),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ],
  ),
),

SizedBox(height: 24.h),


SizedBox(
  width: double.infinity,
  height: 54.h,
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
    onPressed: () {},
    child: Ink(
      decoration: BoxDecoration(
        gradient: AppColors.buttonColor,
        borderRadius:
            BorderRadius.circular(12.r),
      ),
      child: Center(
        child: Text(
          "Send Message",
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

SizedBox(height: 24.h),
                
              ],
            ),
          ),
        ),
      ),
    );
  }

  void toggleCertificate(String certificate) {

  setState(() {

    if (selectedCertificates.contains(certificate)) {
      selectedCertificates.remove(certificate);
    } else {
      selectedCertificates.add(certificate);
    }
  });
}

void toggleSkill(String skill) {

  setState(() {

    if (selectedSkills.contains(skill)) {
      selectedSkills.remove(skill);
    } else {
      selectedSkills.add(skill);
    }
  });
}
}