import 'package:flutter/material.dart';
import 'package:flutter_extension/util/app_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomRoleCard extends StatelessWidget {
  const CustomRoleCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.description,
    required this.iconPath,
    required this.isSelected,
    this.onTap,
    this.unselectedSubtitleColor,
  });

  final String title;
  final String subtitle;
  final String description;
  final String iconPath;
  final bool isSelected;
  final VoidCallback? onTap;
  final Color? unselectedSubtitleColor;

  @override
  Widget build(BuildContext context) {
    final Color borderColor = isSelected
        ? const Color(0xFF2BB768)
        : const Color(0xFFE6E7EB);
    final Color cardColor = isSelected
        ? const Color(0xFFF2FCF6)
        : Colors.white;
    final Color titleColor = const Color(0xFF4B5563);
    final Color subtitleColor = isSelected
        ? const Color(0xFF6B7280)
        : (unselectedSubtitleColor ?? const Color(0xFF0074BE));
    final Color descriptionColor = const Color(0xFF6B7280);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 390.w,
        constraints: BoxConstraints(minHeight: 120.h),
        padding: EdgeInsets.all(20.w),
        decoration: BoxDecoration(
          color: cardColor,
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(color: borderColor, width: 1.w),
          boxShadow: isSelected
              ? <BoxShadow>[
                  BoxShadow(
                    color: const Color(0x14000000),
                    blurRadius: 14.r,
                    offset: Offset(0, 4.h),
                  ),
                ]
              : <BoxShadow>[
                  BoxShadow(
                    color: const Color(0x0A000000),
                    blurRadius: 4.r,
                    spreadRadius: 4.r,
                    offset: Offset(0, 4.h),
                  ),
                ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _RoleIcon(iconPath: iconPath, isSelected: isSelected),
            SizedBox(width: 20.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: AppFonts.custom(
                      size: 20,
                      weight: FontWeight.w500,
                      color: titleColor,
                      height: 1.0,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    subtitle,
                    style: AppFonts.custom(
                      size: 14,
                      weight: FontWeight.w500,
                      color: subtitleColor,
                      height: 20 / 14,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    description,
                    style: AppFonts.custom(
                      size: 12,
                      weight: FontWeight.w400,
                      color: descriptionColor,
                      height: 1.0,
                    ),
                  ),
                ],
              ),
            ),
            if (isSelected)
              Padding(
                padding: EdgeInsets.only(left: 8.w, top: 2.h),
                child: SvgPicture.asset(
                  'assets/images/select.svg',
                  width: 20.w,
                  height: 20.h,
                  fit: BoxFit.contain,
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class _RoleIcon extends StatelessWidget {
  const _RoleIcon({required this.iconPath, required this.isSelected});

  final String iconPath;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50.w,
      height: 50.h,
      padding: EdgeInsets.all(11.w),
      decoration: BoxDecoration(
        color: isSelected ? const Color(0xFF2BB768) : const Color(0xFFE7E8EA),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: SvgPicture.asset(
        iconPath,
        fit: BoxFit.contain,
        colorFilter: ColorFilter.mode(
          isSelected ? Colors.white : Colors.black,
          BlendMode.srcIn,
        ),
      ),
    );
  }
}
