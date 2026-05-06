import 'dart:async';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_extension/util/app_colors.dart';
import 'package:flutter_extension/util/app_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

enum DocReviewStatus {
  requiredState,
  reviewing,
  valid,
  invalid,
}

class CustomDocUpload extends StatefulWidget {
  const CustomDocUpload({
    super.key,
    required this.title,
    required this.onUpload,
    this.reviewSeconds = 5,
  });

  final String title;
  final void Function(String fileName, String filePath) onUpload;
  final int reviewSeconds;

  @override
  State<CustomDocUpload> createState() => _CustomDocUploadState();
}

class _CustomDocUploadState extends State<CustomDocUpload> {
  static const Set<String> _allowedExtensions = {
    'pdf',
    'doc',
    'docx',
    'jpg',
    'png',
  };

  static const int _maxFileSizeBytes = 10 * 1024 * 1024;

  DocReviewStatus _status = DocReviewStatus.requiredState;
  String? _fileName;
  Timer? _timer;

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  bool get _isBusy => _status == DocReviewStatus.reviewing;

  Color get _accentColor {
    switch (_status) {
      case DocReviewStatus.reviewing:
        return const Color(0xFF3B82F6);
      case DocReviewStatus.valid:
        return const Color(0xFF22C55E);
      case DocReviewStatus.invalid:
        return const Color(0xFFEF4444);
      case DocReviewStatus.requiredState:
        return const Color(0xFFED8B35);
    }
  }

  Color get _iconBoxColor {
    switch (_status) {
      case DocReviewStatus.valid:
        return const Color(0xFFE7F8ED);
      case DocReviewStatus.invalid:
        return const Color(0xFFFDECEC);
      case DocReviewStatus.requiredState:
        return const Color(0xFFFFEDD5);
      case DocReviewStatus.reviewing:
        return Colors.transparent;
    }
  }

  Color _buttonBorder() {
    switch (_status) {
      case DocReviewStatus.valid:
        return const Color(0xFF22C55E);
      case DocReviewStatus.invalid:
        return const Color(0xFFEF4444);
      case DocReviewStatus.requiredState:
        return const Color(0xFFED8B35);
      case DocReviewStatus.reviewing:
        return Colors.transparent;
    }
  }

  Color _buttonTextColor() {
    switch (_status) {
      case DocReviewStatus.reviewing:
        return Colors.white;
      case DocReviewStatus.valid:
        return const Color(0xFF22C55E);
      case DocReviewStatus.invalid:
        return const Color(0xFFEF4444);
      case DocReviewStatus.requiredState:
        return const Color(0xFFED8B35);
    }
  }

  String get _statusText {
    switch (_status) {
      case DocReviewStatus.reviewing:
        return 'Reviewing';
      case DocReviewStatus.valid:
        return 'Valid';
      case DocReviewStatus.invalid:
        return 'Invalid';
      case DocReviewStatus.requiredState:
        return 'Required';
    }
  }

  String get _buttonText {
    switch (_status) {
      case DocReviewStatus.reviewing:
      case DocReviewStatus.valid:
        return 'Replace';
      case DocReviewStatus.invalid:
        return 'Upload Again';
      case DocReviewStatus.requiredState:
        return 'Upload';
    }
  }

  Future<void> _pickFile() async {
    if (_isBusy) return;

    final result = await FilePicker.pickFiles();

    if (result == null || result.files.isEmpty) return;

    final file = result.files.first;

    setState(() {
      _fileName = file.name;
      _status = DocReviewStatus.reviewing;
    });

    _timer?.cancel();

    _timer = Timer(Duration(seconds: widget.reviewSeconds), () {
      final valid = _validate(file);

      if (!mounted) return;

      setState(() {
        _status = valid ? DocReviewStatus.valid : DocReviewStatus.invalid;
      });

      if (valid) {
        widget.onUpload(file.name, file.path ?? '');
      }
    });
  }

  bool _validate(PlatformFile file) {
    final parts = file.name.split('.');
    if (parts.length < 2) return false;

    final ext = parts.last.toLowerCase();

    if (!_allowedExtensions.contains(ext)) return false;
    if (file.size > _maxFileSizeBytes) return false;

    return true;
  }

  @override
  Widget build(BuildContext context) {
    final canTap = !_isBusy;

    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.h),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14.r),
        boxShadow: const [
          BoxShadow(
            color: Color(0x14000000),
            blurRadius: 8,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start, 
        children: [

          Padding(
            padding: EdgeInsets.only(top: 2.h), 
            child: Container(
              width: 44.w,
              height: 44.h,
              padding: EdgeInsets.all(10.w),
              decoration: BoxDecoration(
                gradient: _isBusy ? AppColors.buttonColor : null,
                color: _isBusy ? null : _iconBoxColor,
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: SvgPicture.asset(
                'assets/images/file.svg',
                colorFilter: ColorFilter.mode(
                  _isBusy ? Colors.white : _accentColor,
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
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Text(
                        widget.title,
                        maxLines: 3, 
                        overflow: TextOverflow.ellipsis,
                        style: AppFonts.custom(
                          size: 16,
                          weight: FontWeight.w600,
                        ),
                      ),
                    ),
                    SizedBox(width: 6.w),
                    Text(
                      _statusText,
                      style: AppFonts.custom(
                        size: 12,
                        weight: FontWeight.w500,
                        color: _accentColor,
                      ),
                    ),
                  ],
                ),

                if (_fileName != null) ...[
                  SizedBox(height: 6.h),
                  Text(
                    _fileName!,
                    style: AppFonts.custom(
                      size: 12,
                      color: const Color(0xFF6B7280),
                    ),
                  ),
                ],

                SizedBox(height: 10.h),

                
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.r),
                  child: Stack(
                    children: [
                      Opacity(
                        opacity: _isBusy ? 0.6 : 1,
                        child: Container(
                          height: 32.h,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            gradient: _isBusy
                                ? AppColors.buttonColor
                                : null,
                            borderRadius: BorderRadius.circular(8.r),
                            border: Border.all(
                              color: _buttonBorder(),
                              width: 1,
                            ),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            _buttonText,
                            style: AppFonts.custom(
                              size: 12,
                              weight: FontWeight.w600,
                              color: _buttonTextColor(),
                            ),
                          ),
                        ),
                      ),

                      if (_isBusy)
                        Positioned.fill(
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white.withValues(alpha: 0.25),
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                          ),
                        ),

                      Positioned.fill(
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: canTap ? _pickFile : null,
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
}