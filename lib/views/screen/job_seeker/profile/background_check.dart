import 'package:flutter/material.dart';
import 'package:flutter_extension/util/app_text.dart';
import 'package:flutter_extension/views/base/custom_button.dart';
import 'package:flutter_extension/views/base/custom_doc_upload.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter_extension/controller/profile_progress_controller.dart';
import 'package:flutter_extension/views/base/profile_progress_bar.dart';
import 'package:flutter_extension/helper/route_helper.dart';

class BackgroundCheckScreen extends StatefulWidget {
  const BackgroundCheckScreen({super.key});

  @override
  State<BackgroundCheckScreen> createState() =>
      _BackgroundCheckScreenState();
}

class _BackgroundCheckScreenState extends State<BackgroundCheckScreen> {

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
      controller.setStep(5);
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
                          "Background Check",
                          style: AppFonts.custom(
                            size: 22.sp,
                            weight: FontWeight.w600,
                            color: const Color(0xFF374151),
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 10.h),

                   const ProfileProgressBar(step: 5),

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
                            color: const Color(0xFF1D4ED8), weight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: 16.h),

                 
                    CustomDocUpload(
                      title: "Pennsylvania Access To Criminal History Patch",
                      onUpload: (fileName, filePath) {
                        debugPrint("Uploaded: $fileName");
                      },
                    ),

                    SizedBox(height: 20.h),
                  ],
                ),
              ),
            ),

           
            Padding(
              padding: EdgeInsets.all(16.w),
              child: SizedBox(
                width: double.infinity,
                child: SummaryActionButtons(
                  primaryText: "Save & Continue",
                  secondaryText: "Back",
                  onPrimaryTap: () =>
                      Get.toNamed(AppRoutes.profileSummeryScreen),
                  onSecondaryTap: () => Get.back(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}