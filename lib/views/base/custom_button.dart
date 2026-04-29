import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../util/app_colors.dart';
import '../../util/style.dart';


class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.color,
    this.textStyle,
    this.radius,
    this.margin = EdgeInsets.zero,
    required this.onTap,
    required this.text,
    this.loading = false,
    this.width,
    this.height,
  });
  final Function() onTap;
  final String text;
  final bool loading;
  final double? height;
  final double? width;
  final Color? color;
  final double? radius;
  final EdgeInsetsGeometry margin;
  final  TextStyle? textStyle;


  @override

  Widget build(BuildContext context) {
    final BorderRadius borderRadius = BorderRadius.circular(radius ?? 8.r);

    return Padding(
      padding: margin,
      child: SizedBox(
        width: width ?? Get.width,
        height: height ?? 48.h,
        child: DecoratedBox(
          decoration: BoxDecoration(
            gradient: AppColors.buttonColor,
            borderRadius: borderRadius,
          ),
          child: ElevatedButton(
            onPressed: loading ? () {} : onTap,
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(borderRadius: borderRadius),
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            surfaceTintColor: Colors.transparent,
            minimumSize: Size(width ?? Get.width, height ?? 48.h),
          ),
            child: loading
                ? SizedBox(
                    height: 20.h,
                    width: 20.h,
                    child: const CircularProgressIndicator(color: Colors.white),
                  )
                : Text(
                    text,
                    style: textStyle ??
                        AppStyles.h3(
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                  ),
          ),
        ),
      ),
    );
  }
}

class CustomLoginSignUpButtons extends StatelessWidget {
  const CustomLoginSignUpButtons({
    super.key,
    required this.selectedIndex,
    required this.onLoginTap,
    required this.onSignUpTap,
    this.margin = EdgeInsets.zero,
  });

  final int selectedIndex;
  final VoidCallback onLoginTap;
  final VoidCallback onSignUpTap;
  final EdgeInsetsGeometry margin;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin,
      child: Container(
        width: 390.w,
        height: 80.h,
        padding: EdgeInsets.all(20.w),
        decoration: BoxDecoration(
          color: const Color(0xFFF7F9FC),
          borderRadius: BorderRadius.circular(4.r),
        ),
        child: Row(
          children: <Widget>[
            _AuthOptionButton(
              text: 'Log In',
              isSelected: selectedIndex == 0,
              onTap: onLoginTap,
            ),
            SizedBox(width: 16.w),
            _AuthOptionButton(
              text: 'Sign Up',
              isSelected: selectedIndex == 1,
              onTap: onSignUpTap,
            ),
          ],
        ),
      ),
    );
  }
}

class _AuthOptionButton extends StatelessWidget {
  const _AuthOptionButton({
    required this.text,
    required this.isSelected,
    required this.onTap,
  });

  final String text;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final BorderRadius borderRadius = BorderRadius.circular(8.r);

    return Expanded(
      child: SizedBox(
        width: 167.w,
        height: 40.h,
        child: DecoratedBox(
          decoration: BoxDecoration(
            gradient: isSelected ? AppColors.buttonColor : null,
            color: isSelected ? null : Colors.white,
            borderRadius: borderRadius,
            border: Border.all(
              color: const Color(0xFF0074BE),
              width: 0.5.w,
            ),
          ),
          child: TextButton(
            onPressed: onTap,
            style: TextButton.styleFrom(
              padding: EdgeInsets.symmetric(
                vertical: 12.h,
                horizontal: 16.w,
              ),
              minimumSize: Size(167.w, 40.h),
              shape: RoundedRectangleBorder(borderRadius: borderRadius),
              foregroundColor:
                  isSelected ? Colors.white : const Color(0xFF0074BE),
            ),
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                height: 1.0,
                color: isSelected ? Colors.white : const Color(0xFF0074BE),
              ),
            ),
          ),
        ),
      ),
    );
  }
}