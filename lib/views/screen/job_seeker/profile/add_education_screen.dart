

import 'package:flutter/material.dart';
import 'package:flutter_extension/controller/add_education_controller.dart';

import 'package:flutter_extension/util/app_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_extension/controller/profile_progress_controller.dart';
import 'package:flutter_extension/views/base/profile_progress_bar.dart';
import 'package:get/get.dart';

class AddEducationScreen extends StatefulWidget {
  const AddEducationScreen({super.key});

  @override
  State<AddEducationScreen> createState() => _AddEducationScreenState();
}

class _AddEducationScreenState extends State<AddEducationScreen> {

  late final AddEducationController controller;

  @override
  void initState() {
    super.initState();

   
    controller = Get.find<AddEducationController>();

   
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (Get.isRegistered<ProfileProgressController>()) {
        Get.find<ProfileProgressController>().setStep(3);
      }
    });
  }

  @override
  Widget build(BuildContext context) {

    final double screenW = MediaQuery.sizeOf(context).width;
    final double horizontalPad = 16.w;
    final double maxFormWidth =
        (screenW - horizontalPad * 2).clamp(0.0, 560.0);

    return Scaffold(
      backgroundColor: const Color(0xFFEDEFF2),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints viewport) {
            return SingleChildScrollView(
              padding: EdgeInsets.fromLTRB(
                horizontalPad,
                8.h,
                horizontalPad,
                16.h + MediaQuery.viewInsetsOf(context).bottom,
              ),
              child: Align(
                alignment: Alignment.topCenter,
                child: ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: maxFormWidth),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[

                      
                      Row(
                        children: <Widget>[
                          IconButton(
                            onPressed: Get.back,
                            padding: EdgeInsets.zero,
                            icon: Icon(
                              Icons.arrow_back_rounded,
                              size: 22.w,
                              color: const Color(0xFF3D4A57),
                            ),
                          ),
                          SizedBox(width: 6.w),
                          Expanded(
                            child: Text(
                              'Educational Background',
                              style: AppFonts.custom(
                                size: 20.sp,
                                weight: FontWeight.w600,
                                color: const Color(0xFF3D4A57),
                              ),
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 14.h),

                     
                      const ProfileProgressBar(step: 3),

                      SizedBox(height: 18.h),

                      
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(
                          horizontal: 16.w,
                          vertical: 20.h,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFFF7F8FA),
                          borderRadius: BorderRadius.circular(16.r),
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                              color: const Color(0x0A000000),
                              blurRadius: 8.r,
                              offset: Offset(0, 4.h),
                            ),
                          ],
                        ),
                        child: Form(
                          key: controller.formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[

   
                              _fieldLabel('Degree / Certification Name'),
                              SizedBox(height: 8.h),
                              _textField(
                                controller: controller.degreeController,
                                hintText: 'e.g., CNA Certification',
                              ),

                              SizedBox(height: 14.h),


                              _fieldLabel('Institution Name *'),
                              SizedBox(height: 8.h),
                              _textField(
                                controller: controller.institutionController,
                                hintText: 'e.g., State College of Nursing',
                                validator: (v) {
                                  if (v == null || v.trim().isEmpty) {
                                    return 'Institution name is required';
                                  }
                                  return null;
                                },
                              ),

                              SizedBox(height: 14.h),

    
                              _fieldLabel('Year of Completion'),
                              SizedBox(height: 8.h),
                              _yearField(),

                              SizedBox(height: 10.h),

  
                              _completionToggle(),

                              SizedBox(height: 14.h),

                              _fieldLabel('License Number (Optional)'),
                              SizedBox(height: 8.h),
                              _textField(
                                controller: controller.licenseController,
                                hintText: 'e.g., RN-123456',
                              ),

                              SizedBox(height: 14.h),

                              _fieldLabel('Upload Certificate (Optional)'),
                              SizedBox(height: 8.h),
                              _uploadZone(),

                              SizedBox(height: 24.h),

                              Row(
                                children: [
                                  Expanded(
                                    child: OutlinedButton(
                                      onPressed: controller.onCancel,
                                      child: const Text('Cancel'),
                                    ),
                                  ),
                                  SizedBox(width: 12.w),
                                  Expanded(
                                    child: ElevatedButton(
                                      onPressed: controller.onAdd,
                                      child: const Text('Add'),
                                    ),
                                  ),
                                ],
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
          },
        ),
      ),
    );
  }

 

  Widget _fieldLabel(String text) => Text(text);

  Widget _textField({
    required TextEditingController controller,
    required String hintText,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      validator: validator,
      decoration: InputDecoration(hintText: hintText),
    );
  }

  Widget _yearField() {
    return TextFormField(
      controller: controller.yearController,
      keyboardType: TextInputType.number,
      decoration: const InputDecoration(hintText: 'Type Year'),
    );
  }

  Widget _completionToggle() {
    return Obx(() => Row(
          children: [
            TextButton(
              onPressed: () => controller.setCompletion(completed: true),
              child: const Text('Completed'),
            ),
            TextButton(
              onPressed: () => controller.setCompletion(completed: false),
              child: const Text('Ongoing'),
            ),
          ],
        ));
  }

  Widget _uploadZone() {
    return Obx(() {
      final name = controller.certificateFileName.value;
      return Text(name ?? 'Upload file');
    });
  }
}