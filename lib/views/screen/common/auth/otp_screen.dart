import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_extension/controller/otp_controller.dart';
import 'package:flutter_extension/util/app_text.dart';
import 'package:flutter_extension/views/base/custom_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class OtpScreen extends GetView<OtpController> {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final String displayEmail = controller.maskedEmail(controller.email ?? '');

    return Scaffold(
      backgroundColor: const Color(0xFFEDEFF2),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 8.h),
              IconButton(
                onPressed: Get.back,
                padding: EdgeInsets.zero,
                alignment: Alignment.centerLeft,
                icon: Icon(
                  Icons.arrow_back_rounded,
                  size: 20.w,
                  color: const Color(0xFF3D4A57),
                ),
              ),
              SizedBox(height: 12.h),
              Text(
                'Verify Code',
                style: AppFonts.custom(
                  size: 28.sp,
                  weight: FontWeight.w500,
                  color: const Color(0xFF3D4A57),
                  height: 1,
                ),
              ),
              SizedBox(height: 12.h),
              RichText(
                text: TextSpan(
                  style: AppFonts.custom(
                    size: 16,
                    weight: FontWeight.w400,
                    color: const Color(0xFF4B5563),
                    height: 1.2,
                  ),
                  children: <TextSpan>[
                    const TextSpan(
                      text: "We've sent a verification code to ",
                    ),
                    TextSpan(
                      text: displayEmail,
                      style: AppFonts.custom(
                        size: 16,
                        weight: FontWeight.w600,
                        color: const Color(0xFF0074BE),
                        height: 1.2,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 24.h),
              LayoutBuilder(
                builder: (BuildContext context, BoxConstraints outer) {
                  final double cardWidth = math.min(390.w, outer.maxWidth);
                  return Align(
                    alignment: Alignment.centerLeft,
                    child: Obx(() {
                      controller.uiTick.value;
                      final auth = controller.auth;
                      return Container(
                        width: cardWidth,
                        constraints: BoxConstraints(minHeight: 183.h),
                        padding: EdgeInsets.only(
                          top: 32.h,
                          right: 20.w,
                          bottom: 32.h,
                          left: 20.w,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20.r),
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                              color: const Color(0x0A000000),
                              blurRadius: 8.r,
                              offset: Offset(0, 4.h),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Text(
                              'Enter OTP',
                              style: AppFonts.custom(
                                size: 14,
                                weight: FontWeight.w500,
                                color: const Color(0xFF6B7280),
                              ),
                            ),
                            SizedBox(height: 8.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: List<Widget>.generate(6, (int i) {
                                final bool isActive =
                                    auth.otpFocusNodes[i].hasFocus;
                                final bool hasValue = auth
                                    .otpDigitControllers[i].text.isNotEmpty;
                                return SizedBox(
                                  width: 50.w,
                                  height: 50.h,
                                  child: Container(
                                    clipBehavior: Clip.antiAlias,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius:
                                          BorderRadius.circular(16.r),
                                      border: Border.all(
                                        color: isActive
                                            ? const Color(0xFF0074BE)
                                            : (hasValue
                                                ? const Color(0xFF6B7280)
                                                : const Color(0xFFE7E8EA)),
                                        width: 0.5.w,
                                      ),
                                      boxShadow: <BoxShadow>[
                                        if (!isActive)
                                          BoxShadow(
                                            color: const Color(0x14000000),
                                            blurRadius: 8.r,
                                            offset: Offset(0, 3.h),
                                          ),
                                      ],
                                    ),
                                    child: TextField(
                                      controller:
                                          auth.otpDigitControllers[i],
                                      focusNode: auth.otpFocusNodes[i],
                                      keyboardType: TextInputType.number,
                                      textAlign: TextAlign.center,
                                      textAlignVertical:
                                          TextAlignVertical.center,
                                      maxLength: 1,
                                      style: AppFonts.custom(
                                        size: 18,
                                        weight: FontWeight.w500,
                                        color: const Color(0xFF3D4A57),
                                        height: 1,
                                      ),
                                      inputFormatters: <TextInputFormatter>[
                                        FilteringTextInputFormatter.digitsOnly,
                                      ],
                                      decoration: InputDecoration(
                                        counterText: '',
                                        filled: false,
                                        hintText: isActive ? '' : '•',
                                        hintStyle: AppFonts.custom(
                                          size: 18,
                                          weight: FontWeight.w500,
                                          color: const Color(0xFF6B7280),
                                          height: 1,
                                        ),
                                        contentPadding:
                                            EdgeInsets.symmetric(vertical: 12.h),
                                        isDense: true,
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(16.r),
                                          borderSide: BorderSide.none,
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(16.r),
                                          borderSide: BorderSide.none,
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(16.r),
                                          borderSide: BorderSide.none,
                                        ),
                                      ),
                                      onChanged: (String v) =>
                                          controller.onDigitChanged(i, v),
                                      onSubmitted: (_) {
                                        if (i < 5) {
                                          auth.otpFocusNodes[i + 1]
                                              .requestFocus();
                                        }
                                      },
                                    ),
                                  ),
                                );
                              }),
                            ),
                            SizedBox(height: 20.h),
                            Align(
                              alignment: Alignment.center,
                              child: Wrap(
                                alignment: WrapAlignment.center,
                                crossAxisAlignment: WrapCrossAlignment.center,
                                spacing: 0,
                                runSpacing: 4.h,
                                children: <Widget>[
                                  Text(
                                    "Didn't receive the code? ",
                                    style: AppFonts.custom(
                                      size: 14,
                                      weight: FontWeight.w400,
                                      color: const Color(0xFF9CA3AF),
                                      height: 1.2,
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {},
                                    child: Text(
                                      'Resend Code',
                                      style: AppFonts.custom(
                                        size: 14,
                                        weight: FontWeight.w600,
                                        color: const Color(0xFF0074BE),
                                        height: 1.2,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
                  );
                },
              ),
              const Spacer(),
              Obx(() {
                controller.uiTick.value;
                final bool complete = controller.isOtpComplete;
                return Opacity(
                  opacity: complete ? 1.0 : 0.45,
                  child: IgnorePointer(
                    ignoring: !complete,
                    child: CustomButton(
                      text: 'Verify Code',
                      height: 48.h,
                      onTap: controller.verifyAndContinue,
                    ),
                  ),
                );
              }),
              SizedBox(height: 16.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Remember Password? ',
                    style: AppFonts.custom(
                      size: 14,
                      weight: FontWeight.w400,
                      color: const Color(0xFF9CA3AF),
                      height: 1.0,
                    ),
                  ),
                  GestureDetector(
                    onTap: controller.goToLogin,
                    child: Text(
                      'Back to Log In',
                      style: AppFonts.custom(
                        size: 14,
                        weight: FontWeight.w600,
                        color: const Color(0xFF0074BE),
                        height: 1.0,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 22.h),
            ],
          ),
        ),
      ),
    );
  }
}
