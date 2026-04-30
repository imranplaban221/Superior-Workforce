import 'package:flutter/material.dart';
import 'package:flutter_extension/controller/educational_background_controller.dart';
import 'package:flutter_extension/util/app_colors.dart';
import 'package:flutter_extension/util/app_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CustomEducationalBackground extends StatelessWidget {
  const CustomEducationalBackground({super.key, required this.controller});

  final EducationalBackgroundController controller;

  static const Color _progressLabelBlue = Color(0xFF0074BE);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEDEFF2),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            final double horizontalPad = 16.w;
            final double contentMaxW =
                (constraints.maxWidth - horizontalPad * 2).clamp(0.0, 560.0);
            return Align(
              alignment: Alignment.topCenter,
              child: SingleChildScrollView(
                padding: EdgeInsets.fromLTRB(
                  horizontalPad,
                  8.h,
                  horizontalPad,
                  16.h + MediaQuery.viewInsetsOf(context).bottom,
                ),
                child: ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: contentMaxW),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      _header(),
                      SizedBox(height: 18.h),
                      Obx(() {
                        if (controller.showAddEducationForm.value) {
                          return Column(
                            children: <Widget>[
                              _addEducationFormCard(),
                              SizedBox(height: 14.h),
                              _formActionButtons(),
                            ],
                          );
                        }
                        return Column(
                          children: <Widget>[
                            _entriesSection(),
                            SizedBox(height: 14.h),
                            _addEducationButtonCard(),
                            if (controller.educationEntries.isNotEmpty) ...<Widget>[
                              SizedBox(height: 380.h),
                              _summaryActionButtons(),
                            ],
                          ],
                        );
                      }),
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

  Widget _header() {
    return Column(
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
        Row(
          children: <Widget>[
            Text(
              'Step 3 of 5',
              style: AppFonts.custom(
                size: 14,
                weight: FontWeight.w500,
                color: _progressLabelBlue,
              ),
            ),
            const Spacer(),
            Text(
              '50%',
              style: AppFonts.custom(
                size: 14,
                weight: FontWeight.w600,
                color: _progressLabelBlue,
              ),
            ),
          ],
        ),
        SizedBox(height: 8.h),
        Container(
          width: double.infinity,
          height: 6.h,
          decoration: BoxDecoration(
            color: const Color(0xFFD9DDE3),
            borderRadius: BorderRadius.circular(999.r),
          ),
          child: Align(
            alignment: Alignment.centerLeft,
            child: FractionallySizedBox(
              widthFactor: 0.50,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: AppColors.buttonColor,
                  borderRadius: BorderRadius.circular(999.r),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _addEducationButtonCard() {
    return Obx(() {
      final bool hasEntries = controller.educationEntries.isNotEmpty;
      final Widget button = Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: controller.openAddEducationForm,
          borderRadius: BorderRadius.circular(10.r),
          child: Ink(
            height: 48.h,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: hasEntries ? null : AppColors.buttonColor,
              color: hasEntries ? const Color(0xFFF3F8FC) : null,
              borderRadius: BorderRadius.circular(10.r),
              border: hasEntries
                  ? Border.all(color: const Color(0xFF80B7DD), width: 1.w)
                  : null,
            ),
            child: Center(
              child: Text(
                hasEntries ? '+ ADD EDUCATION' : 'Add Education',
                style: AppFonts.custom(
                  size: hasEntries ? 18.sp : 16,
                  weight: FontWeight.w700,
                  color: hasEntries ? const Color(0xFF0074BE) : Colors.white,
                ),
              ),
            ),
          ),
        ),
      );

      if (hasEntries) return button;
      return Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 16.h),
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
        child: button,
      );
    });
  }

  Widget _entriesSection() {
    return Obx(() {
      if (controller.educationEntries.isEmpty) return const SizedBox.shrink();
      return Column(
        children: List<Widget>.generate(
          controller.educationEntries.length,
          (int i) => Padding(
            padding: EdgeInsets.only(bottom: 12.h),
            child: _educationCard(i),
          ),
        ),
      );
    });
  }

  Widget _educationCard(int index) {
    final EducationEntry entry = controller.educationEntries[index];
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 14.h),
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
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: 40.w,
            height: 40.h,
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            decoration: BoxDecoration(
              color: const Color(0xFFE6EDF3),
              borderRadius: BorderRadius.circular(14.r),
            ),
            child: Icon(
              Icons.school_outlined,
              color: const Color(0xFF0074BE),
              size: 20.w,
            ),
          ),
          SizedBox(width: 10.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        entry.degreeOrCertification,
                        style: AppFonts.custom(size: 20.sp, weight: FontWeight.w700, color: const Color(0xFF1F2937)),
                      ),
                    ),
                    GestureDetector(
                      onTap: () => controller.editEducation(index),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
                        child: SvgPicture.asset(
                          'assets/images/edit.svg',
                          width: 16.w,
                          height: 16.h,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () => controller.removeEducation(index),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
                        child: SvgPicture.asset(
                          'assets/images/trash.svg',
                          width: 16.w,
                          height: 16.h,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ],
                ),
                Text(entry.institutionName, style: AppFonts.custom(size: 14, weight: FontWeight.w500, color: const Color(0xFF4B5563))),
                SizedBox(height: 4.h),
                Row(
                  children: <Widget>[
                    Text(entry.year, style: AppFonts.custom(size: 13, weight: FontWeight.w500, color: const Color(0xFF6B7280))),
                    Text('  •  ', style: AppFonts.custom(size: 13, weight: FontWeight.w500, color: const Color(0xFF9CA3AF))),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF0FDF4),
                        borderRadius: BorderRadius.circular(999.r),
                      ),
                      child: Text(
                        entry.statusLabel,
                        style: AppFonts.custom(
                          size: 13,
                          weight: FontWeight.w600,
                          color: const Color(0xFF16A34A),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 4.h),
                Text('License: ${entry.licenseNumber}', style: AppFonts.custom(size: 12, weight: FontWeight.w500, color: const Color(0xFF6B7280))),
                if (entry.certificateName != null && entry.certificateName!.isNotEmpty)
                  Padding(
                    padding: EdgeInsets.only(top: 2.h),
                    child: Row(
                      children: <Widget>[
                        SvgPicture.asset(
                          'assets/images/file.svg',
                          width: 14.w,
                          height: 14.h,
                          fit: BoxFit.contain,
                        ),
                        SizedBox(width: 4.w),
                        Expanded(
                          child: Text(
                            entry.certificateName!,
                            overflow: TextOverflow.ellipsis,
                            style: AppFonts.custom(
                              size: 12,
                              weight: FontWeight.w500,
                              color: const Color(0xFF0074BE),
                            ),
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
    );
  }

  Widget _summaryActionButtons() {
    return Row(
      children: <Widget>[
        Expanded(
          child: SizedBox(
            height: 44.h,
            child: OutlinedButton(
              onPressed: Get.back,
              style: OutlinedButton.styleFrom(
                side: BorderSide(color: const Color(0xFF80B7DD), width: 1.w),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
                backgroundColor: const Color(0xFFF3F8FC),
              ),
              child: Text('Cancel', style: AppFonts.custom(size: 14, weight: FontWeight.w600, color: const Color(0xFF0074BE))),
            ),
          ),
        ),
        SizedBox(width: 12.w),
        Expanded(
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () {},
              borderRadius: BorderRadius.circular(10.r),
              child: Ink(
                height: 44.h,
                decoration: BoxDecoration(
                  gradient: AppColors.buttonColor,
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Center(
                  child: Text('Save & Continue', style: AppFonts.custom(size: 14, weight: FontWeight.w600, color: Colors.white)),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _addEducationFormCard() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
      decoration: BoxDecoration(
        color: const Color(0xFFF7F8FA),
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: <BoxShadow>[
          BoxShadow(color: const Color(0x0A000000), blurRadius: 8.r, offset: Offset(0, 4.h)),
        ],
      ),
      child: Form(
        key: controller.formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _fieldLabel('Degree / Certification Name'),
            SizedBox(height: 8.h),
            _textField(textController: controller.degreeController, hintText: 'e.g., CNA Certification'),
            SizedBox(height: 14.h),
            _fieldLabel('Institution Name *'),
            SizedBox(height: 8.h),
            _textField(
              textController: controller.institutionController,
              hintText: 'e.g., State College of Nursing',
              validator: (String? v) => (v == null || v.trim().isEmpty) ? 'Institution name is required' : null,
            ),
            SizedBox(height: 14.h),
            _fieldLabel('Year of Completion'),
            SizedBox(height: 8.h),
            _yearField(),
            SizedBox(height: 14.h),
            _fieldLabel('License Number (Optional)'),
            SizedBox(height: 8.h),
            _textField(textController: controller.licenseController, hintText: 'e.g., RN-123456'),
            SizedBox(height: 14.h),
            _fieldLabel('Upload Certificate (Optional)'),
            SizedBox(height: 8.h),
            _uploadBox(),
          ],
        ),
      ),
    );
  }

  Widget _formActionButtons() {
    return Row(
      children: <Widget>[
        Expanded(
          child: SizedBox(
            height: 44.h,
            child: OutlinedButton(
              onPressed: controller.cancelAddEducationForm,
              style: OutlinedButton.styleFrom(
                side: BorderSide(color: const Color(0xFF80B7DD), width: 1.w),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
                backgroundColor: const Color(0xFFF3F8FC),
              ),
              child: Text('Cancel', style: AppFonts.custom(size: 14, weight: FontWeight.w600, color: const Color(0xFF0074BE))),
            ),
          ),
        ),
        SizedBox(width: 12.w),
        Expanded(
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: controller.submitEducation,
              borderRadius: BorderRadius.circular(10.r),
              child: Ink(
                height: 44.h,
                decoration: BoxDecoration(
                  gradient: AppColors.buttonColor,
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Center(
                  child: Text('Add', style: AppFonts.custom(size: 14, weight: FontWeight.w600, color: Colors.white)),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _fieldLabel(String text) => Text(
        text,
        style: AppFonts.custom(size: 14, weight: FontWeight.w500, color: const Color(0xFF3D4A57)),
      );

  Widget _textField({
    required TextEditingController textController,
    required String hintText,
    String? Function(String?)? validator,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: const Color(0xFFE7E8EA), width: 0.5.w),
        boxShadow: <BoxShadow>[
          BoxShadow(color: const Color(0x14000000), blurRadius: 8.r, offset: Offset(0, 3.h)),
        ],
      ),
      child: TextFormField(
        controller: textController,
        validator: validator,
        cursorColor: const Color(0xFF0074BE),
        style: AppFonts.custom(size: 14, weight: FontWeight.w400, color: const Color(0xFF3E4955)),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: AppFonts.custom(size: 14, weight: FontWeight.w400, color: const Color(0xFF9CA3AF)),
          filled: true,
          fillColor: Colors.white,
          contentPadding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
          enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12.r), borderSide: BorderSide.none),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.r),
            borderSide: BorderSide(color: const Color(0xFF0074BE), width: 1.w),
          ),
        ),
      ),
    );
  }

  Widget _yearField() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: const Color(0xFFE7E8EA), width: 0.5.w),
        boxShadow: <BoxShadow>[
          BoxShadow(color: const Color(0x14000000), blurRadius: 8.r, offset: Offset(0, 3.h)),
        ],
      ),
      child: Column(
        children: <Widget>[
          TextFormField(
            controller: controller.yearController,
            keyboardType: TextInputType.number,
            cursorColor: const Color(0xFF0074BE),
            style: AppFonts.custom(size: 14, weight: FontWeight.w400, color: const Color(0xFF3E4955)),
            decoration: InputDecoration(
              hintText: 'Type  Year',
              hintStyle: AppFonts.custom(size: 13, weight: FontWeight.w400, color: const Color(0xFF8EA2B6)),
              filled: true,
              fillColor: const Color(0xFFDCE8F5),
              contentPadding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
              enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8.r), borderSide: BorderSide.none),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r),
                borderSide: BorderSide(color: const Color(0xFF0074BE), width: 1.w),
              ),
            ),
          ),
          SizedBox(height: 8.h),
          _completionToggle(),
        ],
      ),
    );
  }

  Widget _completionToggle() {
    return Obx(
      () => Row(
        children: <Widget>[
          _statusPill(
            text: 'Completed',
            active: controller.hasCompletionSelection.value && controller.isCompleted.value,
            onTap: () => controller.setCompletion(completed: true),
          ),
          SizedBox(width: 8.w),
          _statusPill(
            text: 'Ongoing',
            active: controller.hasCompletionSelection.value && !controller.isCompleted.value,
            onTap: () => controller.setCompletion(completed: false),
          ),
        ],
      ),
    );
  }

  Widget _statusPill({required String text, required bool active, required VoidCallback onTap}) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(8.r),
        child: Ink(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
          decoration: BoxDecoration(
            gradient: active ? AppColors.buttonColor : null,
            color: active ? null : const Color(0xFFF3F4F6),
            borderRadius: BorderRadius.circular(8.r),
            border: Border.all(color: active ? Colors.transparent : const Color(0xFFD1D5DB), width: 1.w),
          ),
          child: Text(
            text,
            style: AppFonts.custom(size: 12, weight: FontWeight.w500, color: active ? Colors.white : const Color(0xFF6B7280)),
          ),
        ),
      ),
    );
  }

  Widget _uploadBox() {
    return Obx(() {
      final String? name = controller.certificateFileName.value;
      return GestureDetector(
        onTap: controller.pickCertificate,
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
          decoration: BoxDecoration(
            color: const Color(0xFFF9FAFB),
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(color: const Color(0xFFD1D5DB), width: 1.w),
          ),
          child: Row(
            children: <Widget>[
              Container(
                width: 40.w,
                height: 40.h,
                padding: EdgeInsets.symmetric(horizontal: 11.w),
                decoration: BoxDecoration(
                  color: const Color(0xFFE6EDF3),
                  borderRadius: BorderRadius.circular(14.r),
                ),
                child: SvgPicture.asset('assets/images/upload.svg', width: 18.w, height: 18.h, fit: BoxFit.contain),
              ),
              SizedBox(width: 10.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      name ?? 'Upload PDF or Image',
                      style: AppFonts.custom(size: 14, weight: FontWeight.w500, color: const Color(0xFF3D4A57)),
                    ),
                    SizedBox(height: 2.h),
                    Text(
                      name == null ? 'Max file size: 5MB' : 'Tap to replace',
                      style: AppFonts.custom(size: 12, weight: FontWeight.w400, color: const Color(0xFF9CA3AF)),
                    ),
                  ],
                ),
              ),
              if (name != null)
                IconButton(
                  onPressed: controller.clearCertificate,
                  icon: Icon(Icons.close_rounded, size: 18.w, color: const Color(0xFF6B7280)),
                ),
            ],
          ),
        ),
      );
    });
  }
}
