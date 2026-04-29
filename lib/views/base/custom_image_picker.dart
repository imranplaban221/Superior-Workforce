import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_extension/util/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Circular tappable control: shows [imageBytes] preview or a camera placeholder.
class CustomImagePicker extends StatelessWidget {
  const CustomImagePicker({
    super.key,
    required this.imageBytes,
    required this.onTap,
    this.diameter,
    this.backgroundColor = const Color(0xFFF2F4F7),
    this.borderColor = const Color(0xFFE5E7EB),
    this.placeholderIconColor,
    this.placeholderIcon = Icons.add_a_photo_outlined,
    this.placeholderIconSize,
  });

  final Uint8List? imageBytes;
  final VoidCallback onTap;
  final double? diameter;
  final Color backgroundColor;
  final Color borderColor;
  final Color? placeholderIconColor;
  final IconData placeholderIcon;
  final double? placeholderIconSize;

  @override
  Widget build(BuildContext context) {
    final double size = diameter ?? 48.w;
    final bool hasImage = imageBytes != null && imageBytes!.isNotEmpty;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(999.r),
        child: Ink(
          width: size,
          height: size,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: backgroundColor,
            border: Border.all(
              color: borderColor,
              width: 1.w,
            ),
          ),
          child: hasImage
              ? ClipOval(
                  child: Image.memory(
                    imageBytes!,
                    width: size,
                    height: size,
                    fit: BoxFit.cover,
                  ),
                )
              : Icon(
                  placeholderIcon,
                  size: placeholderIconSize ?? 22.w,
                  color: placeholderIconColor ?? AppColors.primaryColor,
                ),
        ),
      ),
    );
  }
}
