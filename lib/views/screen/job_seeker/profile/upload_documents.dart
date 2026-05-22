import 'package:flutter/material.dart';
import 'package:flutter_extension/controller/profile_progress_controller.dart';

import 'package:flutter_extension/util/app_text.dart';
import 'package:flutter_extension/views/base/custom_button.dart';
import 'package:flutter_extension/views/base/custom_doc_upload.dart';
import 'package:flutter_extension/views/base/profile_progress_bar.dart';
import 'package:flutter_extension/helper/route_helper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class UploadDocumentsScreen extends StatefulWidget {
  const UploadDocumentsScreen({super.key});

  @override
  State<UploadDocumentsScreen> createState() => _UploadDocumentsScreenState();
}

class _UploadDocumentsScreenState extends State<UploadDocumentsScreen> {
  late final ProfileProgressController controller;

  @override
  void initState() {
    super.initState();
    if (Get.isRegistered<ProfileProgressController>()) {
      controller = Get.find<ProfileProgressController>();
    } else {
      controller = Get.put(ProfileProgressController());
    }

    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.setStep(4);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F4F6),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.all(16.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                   
                    Row(
                      children: [
                        IconButton(
                          onPressed: Get.back,
                          icon: Icon(Icons.arrow_back, size: 22.w),
                        ),
                        Text(
                          "Upload Documents",
                          style: AppFonts.custom(
                            size: 22.sp,
                            weight: FontWeight.w600,
                            color: const Color(0xFF374151),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10.h),

                    const ProfileProgressBar(step: 4),

                    SizedBox(height: 16.h),

                  
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12.r),
                        boxShadow: const [
                          BoxShadow(
                            color: Color(0x0A000000),
                            blurRadius: 8,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Documents Uploaded",
                                style: AppFonts.custom(
                                  size: 14,
                                  weight: FontWeight.w400,
                                  color: const Color(0xFF6B7280),
                                ),
                              ),
                              SizedBox(height: 4.h),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.baseline,
                                textBaseline: TextBaseline.alphabetic,
                                children: [
                                  Text(
                                    "1",
                                    style: AppFonts.custom(
                                      size: 28.sp,
                                      weight: FontWeight.w700,
                                      color: const Color(0xFF0074BE),
                                    ),
                                  ),
                                  Text(
                                    " / 10",
                                    style: AppFonts.custom(
                                      size: 28.sp,
                                      weight: FontWeight.w500,
                                      color: const Color(0xFF0074BE),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Container(
                            width: 56.w,
                            height: 56.w,
                            decoration: const BoxDecoration(
                              color: Color(0xFFE5F4FF),
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: SvgPicture.asset(
                                'assets/images/file.svg',
                                width: 24.w,
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

                    SizedBox(height: 16.h),

                    Container(
                      padding: EdgeInsets.all(12.w),
                      decoration: BoxDecoration(
                        color: const Color(0xFFEFF6FF),
                        borderRadius: BorderRadius.circular(10.r),
                        border: Border.all(color: const Color(0xFFBFDBFE)),
                      ),
                      child: Center(
                        child: Text(
                          "Accepted formats: PDF, DOC, DOCX, JPG, PNG\n(Max 10MB per file)",
                          textAlign: TextAlign.center,
                          style: AppFonts.small(
                            color: const Color(0xFF1D4ED8),
                            weight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: 16.h),

                    
                    CustomDocUpload(
                      title: "Gov't ID",
                      onUpload: (fileName, filePath) {
                        debugPrint("Uploaded: $fileName");
                      },
                    ),
                    CustomDocUpload(
                      title: "Pennsylvania Department of Aging Letter",
                      onUpload: (fileName, filePath) {
                        debugPrint("Uploaded: $fileName");
                      },
                    ),
                    CustomDocUpload(
                      title: "Physical Exam and Health Assessment",
                      onUpload: (fileName, filePath) {
                        debugPrint("Uploaded: $fileName");
                      },
                    ),
                    CustomDocUpload(
                      title: "PPD Test", 
                      onUpload: (fileName, filePath) {
                        debugPrint("Uploaded: $fileName");
                      },
                    ),

                    CustomDocUpload(
                      title: "Resume/CV", 
                      onUpload: (fileName, filePath) {
                        debugPrint("Uploaded: $fileName");
                      },
                    ),

                    CustomDocUpload(
                      title: "Varicella Text Rocord", 
                      onUpload: (fileName, filePath) {
                        debugPrint("Uploaded: $fileName");
                      },
                    ),

                    CustomDocUpload(
                      title: "MMR Vaccination Record", 
                      onUpload: (fileName, filePath) {
                        debugPrint("Uploaded: $fileName");
                      },
                    ),

                    CustomDocUpload(
                      title: "HEP Vaccination ", 
                      onUpload: (fileName, filePath) {
                        debugPrint("Uploaded: $fileName");
                      },
                    ),

                    CustomDocUpload(
                      title: "Tdap Vaccination", 
                      onUpload: (fileName, filePath) {
                        debugPrint("Uploaded: $fileName");
                      },
                    ),

                    CustomDocUpload(
                      title: "Psychiatric and Mental Health Nursing - One", 
                      onUpload: (fileName, filePath) {
                        debugPrint("Uploaded: $fileName");
                      },
                    ),

                    SizedBox(height: 20.h),


                    SummaryActionButtons(
                  primaryText: "Save & Continue",
                  secondaryText: "Back",
                  onPrimaryTap: () =>
                      Get.toNamed(AppRoutes.backgroundCheckScreen),
                  onSecondaryTap: () => Get.back(),
                ),
                  ],
                ),
              ),
            ),

            /// Footer Actions
            
          ],
        ),
      ),
    );
  }
}
