import 'package:flutter/material.dart';
import 'package:flutter_extension/util/app_colors.dart';
import 'package:flutter_extension/util/app_text.dart';
import 'package:flutter_extension/views/base/custom_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomOnbordingDesign extends StatelessWidget {
  const CustomOnbordingDesign({
    super.key,
    required this.page,
    required this.currentIndex,
    required this.pageCount,
    required this.buttonText,
    required this.onBack,
    required this.onNext,
  });

  final OnboardingData page;
  final int currentIndex;
  final int pageCount;
  final String buttonText;
  final VoidCallback onBack;
  final VoidCallback onNext;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 62,
          child: _TopSection(
            page: page,
            currentIndex: currentIndex,
            pageCount: pageCount,
            onBack: onBack,
          ),
        ),
        Expanded(
          flex: 30,
          child: _BottomSection(
            buttonText: buttonText,
            onTap: onNext,
          ),
        ),
      ],
    );
  }
}

class _TopSection extends StatelessWidget {
  const _TopSection({
    required this.page,
    required this.currentIndex,
    required this.pageCount,
    required this.onBack,
  });

  final OnboardingData page;
  final int currentIndex;
  final int pageCount;
  final VoidCallback onBack;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _OnboardingTopPainter(curveStyle: page.curveStyle),
      child: SafeArea(
        bottom: false,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            children: [
              SizedBox(height: 20.h),
              SizedBox(
                height: 24.h,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: page.showBack
                      ? IconButton(
                          onPressed: onBack,
                          icon: Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                            size: 24.sp,
                          ),
                          padding: EdgeInsets.zero,
                          constraints: const BoxConstraints(),
                        )
                      : const SizedBox.shrink(),
                ),
              ),
              SizedBox(height: 62.h),
              _OnboardingIcon(imagePath: page.imagePath),
              SizedBox(height: 28.h),
              Text(
                page.title,
                textAlign: TextAlign.center,
                style: AppFonts.custom(
                  size: 28.sp,
                  weight: FontWeight.w500,
                  color: Colors.white,
                  height: 1.0,
                ),
              ),
              SizedBox(height: 16.h),
              Text(
                page.description,
                textAlign: TextAlign.center,
                style: AppFonts.custom(
                  size: 16.sp,
                  weight: FontWeight.w400,
                  color: Colors.white,
                  height: 1.0,
                ),
              ),
              SizedBox(height: 50.h),
              _PageIndicator(currentIndex: currentIndex, pageCount: pageCount),
              const Spacer(),
              SizedBox(height: 28.h),
            ],
          ),
        ),
      ),
    );
  }
}

class _OnboardingIcon extends StatelessWidget {
  const _OnboardingIcon({required this.imagePath});

  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 64.w,
      height: 64.h,
      child: SvgPicture.asset(
        imagePath,
        fit: BoxFit.contain,
      ),
    );
  }
}

class _BottomSection extends StatelessWidget {
  const _BottomSection({
    required this.buttonText,
    required this.onTap,
  });

  final String buttonText;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        top: false,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20.w,
            vertical: 20.h,
          ),
          child: Column(
            children: [
              const Spacer(),
              CustomButton(
                text: buttonText,
                height: 48.h,
                onTap: onTap,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _OnboardingTopPainter extends CustomPainter {
  const _OnboardingTopPainter({required this.curveStyle});

  final CurveStyle curveStyle;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppColors.primaryColor
      ..style = PaintingStyle.fill;

    final path = Path()..moveTo(0, 0);

    if (curveStyle == CurveStyle.secondCurve) {
      final edgeY = size.height * 0.92;
      final controlY = size.height * 0.80;
      path
        ..lineTo(0, edgeY)
        ..quadraticBezierTo(
          size.width * 0.5,
          controlY,
          size.width,
          edgeY,
        )
        ..lineTo(size.width, 0)
        ..close();
    } else {
      path
        ..lineTo(0, size.height * 0.92)
        ..quadraticBezierTo(
          size.width * 0.5,
          size.height,
          size.width,
          size.height * 0.92,
        )
        ..lineTo(size.width, 0)
        ..close();
    }

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant _OnboardingTopPainter oldDelegate) {
    return oldDelegate.curveStyle != curveStyle;
  }
}

class _PageIndicator extends StatelessWidget {
  const _PageIndicator({required this.currentIndex, required this.pageCount});

  final int currentIndex;
  final int pageCount;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List<Widget>.generate(pageCount, (int index) {
        final bool isActive = index == currentIndex;
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 3),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 220),
            width: isActive ? 16 : 5,
            height: 5,
            decoration: BoxDecoration(
              color: isActive ? Colors.white : const Color(0x80FFFFFF),
              borderRadius: BorderRadius.circular(999),
            ),
          ),
        );
      }),
    );
  }
}

enum CurveStyle { defaultCurve, secondCurve }

class OnboardingData {
  const OnboardingData({
    required this.imagePath,
    required this.title,
    required this.description,
    required this.curveStyle,
    required this.showBack,
  });

  final String imagePath;
  final String title;
  final String description;
  final CurveStyle curveStyle;
  final bool showBack;
}
