import 'package:flutter/material.dart';
import 'package:flutter_extension/util/app_colors.dart';
import 'package:flutter_extension/util/app_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileProgressBar extends StatelessWidget {
  const ProfileProgressBar({
    super.key,
    required this.step,
    this.totalSteps = 5,
  });

  final int step;
  final int totalSteps;

  @override
  Widget build(BuildContext context) {
    final double progress = step / totalSteps;
    final int percentage = (progress * 100).toInt();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              'Step $step of $totalSteps',
              style: AppFonts.custom(
                size: 14,
                weight: FontWeight.w500,
                color: const Color(0xFF3D4A57),
              ),
            ),
            const Spacer(),
            Text(
              '$percentage%',
              style: AppFonts.custom(
                size: 14,
                weight: FontWeight.w600,
                color: const Color(0xFF0074BE),
              ),
            ),
          ],
        ),

        SizedBox(height: 8.h),

        LayoutBuilder(
          builder: (context, constraints) {
            final double filledWidth = constraints.maxWidth * progress;

            return Container(
              height: 6.h,
              decoration: BoxDecoration(
                color: const Color(0xFFD9DDE3),
                borderRadius: BorderRadius.circular(999.r),
              ),
              child: Align(
                alignment: Alignment.centerLeft,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 400),
                  curve: Curves.easeInOut,
                  width: filledWidth,
                  height: 6.h,
                  decoration: BoxDecoration(
                    gradient: AppColors.buttonColor,
                    borderRadius: BorderRadius.circular(999.r),
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}