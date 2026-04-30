import 'dart:ui' show PathMetric;

import 'package:flutter/material.dart';
import 'package:flutter_extension/controller/add_education_controller.dart';
import 'package:flutter_extension/util/app_colors.dart';
import 'package:flutter_extension/util/app_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AddEducationScreen extends GetView<AddEducationController> {
  const AddEducationScreen({super.key});

  static const Color _progressLabelBlue = Color(0xFF0074BE);

  @override
  Widget build(BuildContext context) {
    final double screenW = MediaQuery.sizeOf(context).width;
    final double horizontalPad = 16.w;
    final double maxFormWidth = (screenW - horizontalPad * 2).clamp(0.0, 560.0);

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
                                validator: (String? v) {
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
                              _uploadZone(context),
                              SizedBox(height: 24.h),
                              Row(
                                children: <Widget>[
                                  Expanded(
                                    child: SizedBox(
                                      height: 48.h,
                                      child: OutlinedButton(
                                        onPressed: controller.onCancel,
                                        style: OutlinedButton.styleFrom(
                                          side: BorderSide(
                                            color: const Color(0xFF80B7DD),
                                            width: 1.w,
                                          ),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.r),
                                          ),
                                          backgroundColor:
                                              const Color(0xFFF3F8FC),
                                        ),
                                        child: Text(
                                          'Cancel',
                                          style: AppFonts.custom(
                                            size: 15,
                                            weight: FontWeight.w600,
                                            color: const Color(0xFF0074BE),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 12.w),
                                  Expanded(
                                    child: SizedBox(
                                      height: 48.h,
                                      child: Material(
                                        color: Colors.transparent,
                                        child: InkWell(
                                          onTap: controller.onAdd,
                                          borderRadius:
                                              BorderRadius.circular(10.r),
                                          child: Ink(
                                            decoration: BoxDecoration(
                                              gradient: AppColors.buttonColor,
                                              borderRadius:
                                                  BorderRadius.circular(10.r),
                                            ),
                                            child: Center(
                                              child: Text(
                                                'Add',
                                                style: AppFonts.custom(
                                                  size: 15,
                                                  weight: FontWeight.w600,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
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

  Widget _fieldLabel(String text) {
    return Text(
      text,
      style: AppFonts.custom(
        size: 14,
        weight: FontWeight.w500,
        color: const Color(0xFF3D4A57),
      ),
    );
  }

  Widget _textField({
    required TextEditingController controller,
    required String hintText,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      validator: validator,
      cursorColor: const Color(0xFF0074BE),
      style: AppFonts.custom(
        size: 14,
        weight: FontWeight.w400,
        color: const Color(0xFF3E4955),
      ),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: AppFonts.custom(
          size: 14,
          weight: FontWeight.w400,
          color: const Color(0xFF9CA3AF),
        ),
        filled: true,
        fillColor: Colors.white,
        contentPadding:
            EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(color: const Color(0xFFE5E7EB), width: 1.w),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(color: const Color(0xFF0074BE), width: 1.w),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(color: const Color(0xFFEF4444), width: 1.w),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(color: const Color(0xFFEF4444), width: 1.w),
        ),
      ),
    );
  }

  Widget _yearField() {
    return TextFormField(
      controller: controller.yearController,
      keyboardType: TextInputType.number,
      cursorColor: const Color(0xFF0074BE),
      style: AppFonts.custom(
        size: 14,
        weight: FontWeight.w400,
        color: const Color(0xFF3E4955),
      ),
      decoration: InputDecoration(
        hintText: 'Type Year',
        hintStyle: AppFonts.custom(
          size: 14,
          weight: FontWeight.w400,
          color: const Color(0xFF8EA2B6),
        ),
        filled: true,
        fillColor: const Color(0xFFDCE8F5),
        contentPadding:
            EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(color: const Color(0xFF0074BE), width: 1.w),
        ),
      ),
    );
  }

  Widget _completionToggle() {
    return Obx(
      () => Row(
        children: <Widget>[
          Expanded(
            child: _segmentButton(
              label: 'Completed',
              selected: controller.isCompleted.value,
              onTap: () => controller.setCompletion(completed: true),
            ),
          ),
          SizedBox(width: 8.w),
          Expanded(
            child: _segmentButton(
              label: 'Ongoing',
              selected: !controller.isCompleted.value,
              onTap: () => controller.setCompletion(completed: false),
            ),
          ),
        ],
      ),
    );
  }

  Widget _segmentButton({
    required String label,
    required bool selected,
    required VoidCallback onTap,
  }) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(10.r),
        child: Ink(
          decoration: BoxDecoration(
            color: selected ? const Color(0xFFE0F2F1) : Colors.white,
            borderRadius: BorderRadius.circular(10.r),
            border: Border.all(
              color: selected
                  ? const Color(0xFF008290)
                  : const Color(0xFFE5E7EB),
              width: selected ? 1.5.w : 1.w,
            ),
          ),
          child: Container(
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(vertical: 10.h),
            child: Text(
              label,
              style: AppFonts.custom(
                size: 13,
                weight: FontWeight.w600,
                color: selected
                    ? const Color(0xFF004A8F)
                    : const Color(0xFF6B7280),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _uploadZone(BuildContext context) {
    return Obx(
      () {
        final String? name = controller.certificateFileName.value;
        return Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: controller.pickCertificate,
            borderRadius: BorderRadius.circular(12.r),
            child: CustomPaint(
              painter: _DashedBorderPainter(
                color: const Color(0xFFC9D0D8),
                radius: 12.r,
              ),
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 12.w),
                child: Column(
                  children: <Widget>[
                    Icon(
                      Icons.cloud_upload_outlined,
                      size: 36.w,
                      color: const Color(0xFF9CA3AF),
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      name ?? 'Upload PDF or Image',
                      textAlign: TextAlign.center,
                      style: AppFonts.custom(
                        size: 14,
                        weight: FontWeight.w500,
                        color: const Color(0xFF3D4A57),
                      ),
                    ),
                    if (name == null) ...<Widget>[
                      SizedBox(height: 4.h),
                      Text(
                        'Max file size: 5MB',
                        style: AppFonts.custom(
                          size: 12,
                          weight: FontWeight.w400,
                          color: const Color(0xFF9CA3AF),
                        ),
                      ),
                    ] else ...<Widget>[
                      SizedBox(height: 6.h),
                      TextButton(
                        onPressed: controller.clearCertificate,
                        child: Text(
                          'Remove file',
                          style: AppFonts.custom(
                            size: 12,
                            weight: FontWeight.w500,
                            color: const Color(0xFF0074BE),
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class _DashedBorderPainter extends CustomPainter {
  _DashedBorderPainter({required this.color, required this.radius});

  final Color color;
  final double radius;

  @override
  void paint(Canvas canvas, Size size) {
    final RRect rrect = RRect.fromRectAndRadius(
      Rect.fromLTWH(0, 0, size.width, size.height),
      Radius.circular(radius),
    );
    final Paint paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.2;
    _drawDashedRRect(canvas, rrect, paint);
  }

  void _drawDashedRRect(Canvas canvas, RRect rrect, Paint paint) {
    final Path path = Path()..addRRect(rrect);
    final Path dashedPath = Path();
    for (final PathMetric metric in path.computeMetrics()) {
      double distance = 0;
      while (distance < metric.length) {
        const double len = 5;
        const double gap = 4;
        dashedPath.addPath(
          metric.extractPath(distance, distance + len),
          Offset.zero,
        );
        distance += len + gap;
      }
    }
    canvas.drawPath(dashedPath, paint);
  }

  @override
  bool shouldRepaint(covariant _DashedBorderPainter oldDelegate) =>
      oldDelegate.color != color || oldDelegate.radius != radius;
}
