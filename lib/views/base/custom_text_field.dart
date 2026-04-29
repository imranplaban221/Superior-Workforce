import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../util/app_colors.dart';
import '../../util/app_constants.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final String? obscure;
  final Color? filColor;
  final Widget? prefixIcon;
  final String? labelText;
  final String? hintText;
  final double? contentPaddingHorizontal;
  final double? contentPaddingVertical;
  final Widget? suffixIcon;
  final FormFieldValidator? validator;
  final bool isPassword;
  final bool? isEmail;
  final bool showPrefixDivider;
  final bool showBorder;
  final bool showCursor;
  final double? borderRadius;
  final Color? textColor;
  final Color? hintColor;
  final FontWeight? textWeight;
  final FontWeight? hintWeight;
  final bool enabledValidation;
  final ValueChanged<String>? onChanged;

  const CustomTextField(
      {super.key,
      this.contentPaddingHorizontal,
      this.contentPaddingVertical,
      this.hintText,
      this.prefixIcon,
      this.suffixIcon,
      this.validator,
      this.isEmail,
      this.controller,
      this.keyboardType = TextInputType.text,
      this.obscure = '*',
      this.filColor,
      this.labelText,
      this.isPassword = false,
      this.showPrefixDivider = false,
      this.showBorder = true,
      this.showCursor = true,
      this.borderRadius,
      this.textColor,
      this.hintColor,
      this.textWeight,
      this.hintWeight,
      this.enabledValidation = true,
      this.onChanged});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool obscureText = true;

  void toggle() {
    setState(() {
      obscureText = !obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    final BorderSide enabledBorderSide = BorderSide(
      color: const Color(0xFFE5E7EB),
      width: 1.w,
    );
    final BorderSide focusedBorderSide = BorderSide(
      color: AppColors.primaryColor,
      width: 1.w,
    );

    return TextFormField(
      controller: widget.controller,
      onChanged: widget.onChanged,
      keyboardType: widget.keyboardType,
      obscuringCharacter: widget.obscure!,
      validator: widget.enabledValidation
          ? widget.validator ??
              (value) {
                if (widget.isEmail == null) {
                  if (value!.isEmpty) {
                    return "Please enter ${widget.hintText!.toLowerCase()}";
                  } else if (widget.isPassword) {
                    bool data = AppConstants.passwordValidator.hasMatch(value);
                    if (value.isEmpty) {
                      return "Please enter ${widget.hintText!.toLowerCase()}";
                    } else if (!data) {
                      return "Insecure password detected.";
                    }
                  }
                } else {
                  bool data = AppConstants.emailValidator.hasMatch(value!);
                  if (value.isEmpty) {
                    return "Please enter ${widget.hintText!.toLowerCase()}";
                  } else if (!data) {
                    return "Please check your email!";
                  }
                }
                return null;
              }
          : null,
      cursorColor: AppColors.primaryColor,
      showCursor: widget.showCursor,
      obscureText: widget.isPassword ? obscureText : false,
      style: TextStyle(
        fontFamily: 'Inter',
        color: widget.textColor ?? const Color(0xFF3E4955),
        fontSize: 14.sp,
        fontWeight: widget.textWeight ?? FontWeight.w400,
        height: 1.0,
        letterSpacing: 0,
      ),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(
            horizontal: widget.contentPaddingHorizontal ?? 20.w,
            vertical: widget.contentPaddingVertical ?? 20.w),
        filled: true,
        fillColor: widget.filColor ?? Colors.white,
        prefixIcon: _buildPrefixIcon(),
        suffixIcon: widget.isPassword
            ? GestureDetector(
                onTap: toggle,
                child: _suffixIcon(
                    obscureText ? Icons.visibility_outlined : Icons.visibility_off_outlined),
              )
            : widget.suffixIcon,
        prefixIconConstraints: BoxConstraints(
          minHeight: 40.h,
          maxHeight: 48.h,
          minWidth: 0,
          maxWidth: widget.showPrefixDivider ? 72.w : 48.w,
        ),
        labelText: widget.labelText,
        hintText: widget.hintText,
        hintStyle: TextStyle(
          fontFamily: 'Inter',
          color: widget.hintColor ?? const Color(0xFF9CA3AF),
          fontSize: 14.sp,
          fontWeight: widget.hintWeight ?? FontWeight.w400,
          height: 1.0,
          letterSpacing: 0,
        ),
        enabledBorder: widget.showBorder
            ? OutlineInputBorder(
                borderRadius: BorderRadius.circular(widget.borderRadius ?? 12.r),
                borderSide: enabledBorderSide,
              )
            : InputBorder.none,
        focusedBorder: widget.showBorder
            ? OutlineInputBorder(
                borderRadius: BorderRadius.circular(widget.borderRadius ?? 12.r),
                borderSide: focusedBorderSide,
              )
            : InputBorder.none,
        border: widget.showBorder
            ? OutlineInputBorder(
                borderRadius: BorderRadius.circular(widget.borderRadius ?? 12.r),
                borderSide: enabledBorderSide,
              )
            : InputBorder.none,
      ),
    );
  }

  _suffixIcon(IconData icon) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Icon(icon, color: const Color(0xFF9CA3AF)),
    );
  }

  Widget? _buildPrefixIcon() {
    if (!widget.showPrefixDivider && widget.prefixIcon == null) {
      return null;
    }
    final Widget inner = widget.showPrefixDivider
        ? _PrefixIconWithDivider(child: widget.prefixIcon ?? const SizedBox())
        : widget.prefixIcon!;
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: EdgeInsets.only(left: 12.w, right: 4.w),
        child: inner,
      ),
    );
  }
}

class _PrefixIconWithDivider extends StatelessWidget {
  const _PrefixIconWithDivider({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 12.w, right: 8.w),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          child,
          SizedBox(width: 10.w),
          Container(
            width: 1.w,
            height: 16.h,
            color: const Color(0xFFD1D5DB),
          ),
        ],
      ),
    );
  }
}
