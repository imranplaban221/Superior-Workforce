import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_extension/helper/route_helper.dart';
import 'package:flutter_extension/util/app_colors.dart';
import 'package:flutter_extension/util/app_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class EmployerProfile extends StatefulWidget {
  const EmployerProfile({super.key});

  @override
  State<EmployerProfile> createState() => _EmployerProfileState();
}

class _EmployerProfileState extends State<EmployerProfile> {

  final TextEditingController companyNameController =
      TextEditingController();

  final TextEditingController locationController =
      TextEditingController();

  final TextEditingController contactController =
      TextEditingController();

  final TextEditingController descriptionController =
      TextEditingController();

  String? selectedLogoPath;
  String? selectedLogoName;

  @override
  void dispose() {
    companyNameController.dispose();
    locationController.dispose();
    contactController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  
  Future<void> pickLogo() async {

    FilePickerResult? result =
        await FilePicker.pickFiles(
      type: FileType.custom,
      allowedExtensions: [
        'png',
        'jpg',
        'jpeg',
      ],
    );

    if (result != null) {

      setState(() {
        selectedLogoPath = result.files.single.path;
        selectedLogoName = result.files.single.name;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,

      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                SizedBox(height: 20.h),

              
                Text(
                  "Company Profile Setup",
                  style: AppFonts.custom(
                    size: 28.sp,
                    weight: FontWeight.w500,
                    color: const Color(0xFF374151),
                    height: 1,
                  ),
                ),

                SizedBox(height: 8.h),

                
                Text(
                  "Tell us about your healthcare organization",
                  style: AppFonts.custom(
                    size: 16.sp,
                    weight: FontWeight.w400,
                    color: const Color(0xFF6B7280),
                  ),
                ),

                SizedBox(height: 24.h),

               
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

                  
                      Text(
                        "Company Logo",
                        style: AppFonts.custom(
                          size: 14.sp,
                          weight: FontWeight.w400,
                          color: const Color(0xFF374151),
                        ),
                      ),

                      SizedBox(height: 14.h),

               
                      Center(
                        child: Column(
                          children: [

                            GestureDetector(
                              onTap: pickLogo,
                              child: Container(
                                width: 100.w,
                                height: 100.w,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.circular(16.r),
                                  border: Border.all(
                                    color:
                                        const Color(0xFFD1D5DB),
                                  ),
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Color(0x14000000),
                                      offset: Offset(0, 4),
                                      blurRadius: 6,
                                    ),
                                  ],
                                ),
                                child: selectedLogoPath != null

                                  
                                    ? ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(
                                                16.r),
                                        child: Image.file(
                                          File(selectedLogoPath!),
                                          fit: BoxFit.cover,
                                          width: double.infinity,
                                          height: double.infinity,
                                        ),
                                      )

                               
                                    : Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [

                                          SvgPicture.asset(
                                            'assets/images/upload.svg',
                                            height: 28.h,
                                            width: 28.w,
                                            colorFilter:
                                                const ColorFilter.mode(
                                              Color(0xFF6B7280),
                                              BlendMode.srcIn,
                                            ),
                                          ),

                                          SizedBox(height: 8.h),

                                          Text(
                                            "Upload Logo",
                                            style: AppFonts.custom(
                                              size: 12.sp,
                                              weight:
                                                  FontWeight.w500,
                                              color: const Color(
                                                  0xFF6B7280),
                                            ),
                                          ),
                                        ],
                                      ),
                              ),
                            ),

                            SizedBox(height: 10.h),

                            Text(
                              selectedLogoName ??
                                  "PNG, JPG up to 5MB",
                              style: AppFonts.custom(
                                size: 12.sp,
                                weight: FontWeight.w400,
                                color: const Color(0xFF6B7280),
                              ),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: 24.h),

                   
                      _label("Company Name"),

                      SizedBox(height: 8.h),

                      _textField(
                        controller: companyNameController,
                        hintText: "e.g., City Hospital",
                        icon: 'assets/images/company.svg',
                      ),

                      SizedBox(height: 16.h),

                      
                      _label("Location"),

                      SizedBox(height: 8.h),

                      _textField(
                        controller: locationController,
                        hintText: "e.g., San Francisco, CA",
                        icon: 'assets/images/location.svg',
                      ),

                      SizedBox(height: 16.h),

                      
                      _label("Contact Number"),

                      SizedBox(height: 8.h),

                      _textField(
                        controller: contactController,
                        hintText: "e.g., (555) 123-4567",
                        icon: 'assets/images/phone.svg',
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                      ),

                      SizedBox(height: 16.h),

                      
                      _label("Company Description"),

                      SizedBox(height: 8.h),

                      Container(
                        height: 120.h,
                        padding: EdgeInsets.all(16.w),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              BorderRadius.circular(16.r),
                          border: Border.all(
                            color: const Color(0xFFE5E7EB),
                            width: 1,
                          ),
                          boxShadow: const [
                            BoxShadow(
                              color: Color(0x14000000),
                              offset: Offset(0, 4),
                              blurRadius: 8,
                            ),
                          ],
                        ),
                        child: TextField(
                          controller: descriptionController,
                          maxLines: null,
                          expands: true,
                          textAlignVertical:
                              TextAlignVertical.top,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText:
                                "Tell healthcare professionals about your organization, culture, and what makes you a great place to work...",
                            hintStyle: AppFonts.custom(
                              size: 14.sp,
                              weight: FontWeight.w400,
                              color:
                                  const Color(0xFF9CA3AF),
                              height: 1.5,
                            ),
                          ),
                          style: AppFonts.custom(
                            size: 14.sp,
                            weight: FontWeight.w400,
                            color: const Color(0xFF374151),
                          ),
                        ),
                      ),

                      SizedBox(height: 16.h),

                     
                      Center(
                        child: Text(
                          "Your information is secure and will never be shared",
                          textAlign: TextAlign.center,
                          style: AppFonts.custom(
                            size: 13.sp,
                            weight: FontWeight.w400,
                            color: const Color(0xFF6B7280),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 50.h),

               
                SizedBox(
                  width: double.infinity,
                  height: 52.h,
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
                    onPressed: () {
                      Get.toNamed(AppRoutes.employerHome);
                    },
                    child: Ink(
                      decoration: BoxDecoration(
                        gradient: AppColors.buttonColor,
                        borderRadius:
                            BorderRadius.circular(12.r),
                      ),
                      child: Center(
                        child: Text(
                          "Save & Continue",
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

                SizedBox(height: 20.h),
              ],
            ),
          ),
        ),
      ),
    );
  }

  
  Widget _label(String text) {
    return Text(
      text,
      style: AppFonts.custom(
        size: 14.sp,
        weight: FontWeight.w400,
        color: const Color(0xFF374151),
      ),
    );
  }

  
  Widget _textField({
    required TextEditingController controller,
    required String hintText,
    required String icon,
    TextInputType keyboardType = TextInputType.text,
    List<TextInputFormatter>? inputFormatters,
  }) {
    return Container(
      height: 56.h,
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(
          color: const Color(0xFFE5E7EB),
          width: 1,
        ),
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

          SvgPicture.asset(
            icon,
            height: 20.h,
            width: 20.w,
            colorFilter: const ColorFilter.mode(
              Color(0xFF9CA3AF),
              BlendMode.srcIn,
            ),
          ),

          SizedBox(width: 12.w),

          Expanded(
            child: TextField(
              controller: controller,
              keyboardType: keyboardType,
              inputFormatters: inputFormatters,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: hintText,
                hintStyle: AppFonts.custom(
                  size: 14.sp,
                  weight: FontWeight.w400,
                  color: const Color(0xFF9CA3AF),
                ),
              ),
              style: AppFonts.custom(
                size: 14.sp,
                weight: FontWeight.w400,
                color: const Color(0xFF374151),
              ),
            ),
          ),
        ],
      ),
    );
  }
}