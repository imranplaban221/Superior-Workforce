import 'package:flutter/material.dart';
import 'package:flutter_extension/util/app_colors.dart';
import 'package:flutter_extension/util/app_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class CustomLoading extends StatelessWidget {
   const CustomLoading({super.key,this.color,this.size});
   final double? size;
   final Color? color;

  @override
  Widget build(BuildContext context) {
    return   Center(
        child: SpinKitCircle(
        color:color??AppColors.primaryColor,
        size: size??20.0,  
    ),);
  }
}

class CustomLoadingText extends StatefulWidget {
  const CustomLoadingText({
    super.key,
    this.text = 'Loading',
    this.color,
    this.fontSize,
    this.fontWeight,
  });

  final String text;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;

  @override
  State<CustomLoadingText> createState() => _CustomLoadingTextState();
}

class _CustomLoadingTextState extends State<CustomLoadingText> {
  int _dotCount = 0;

  @override
  void initState() {
    super.initState();
    _runDotsAnimation();
  }

  Future<void> _runDotsAnimation() async {
    while (mounted) {
      await Future<void>.delayed(const Duration(milliseconds: 350));
      if (!mounted) {
        return;
      }
      setState(() {
        _dotCount = (_dotCount + 1) % 4;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final String dots = '.' * _dotCount;

    return Text(
      '${widget.text}$dots',
      style: AppFonts.custom(
        size: widget.fontSize ?? 14,
        weight: widget.fontWeight ?? FontWeight.w500,
        color: widget.color ?? AppColors.primaryColor,
      ),
    );
  }
}
