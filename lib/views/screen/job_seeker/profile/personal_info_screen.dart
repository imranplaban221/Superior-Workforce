import 'package:flutter/material.dart';
import 'package:flutter_extension/controller/auth_controller.dart';
import 'package:flutter_extension/util/app_colors.dart';
import 'package:flutter_extension/util/app_text.dart';
import 'package:flutter_extension/views/base/custom_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class PersonalInfoScreen extends GetView<AuthController> {
  const PersonalInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEDEFF2),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 8.h),
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
                  Text(
                    'Personal Information',
                    style: AppFonts.custom(
                      size: 22.sp,
                      weight: FontWeight.w600,
                      color: const Color(0xFF3D4A57),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 14.h),
              Row(
                children: <Widget>[
                  Text(
                    'Step 1 of 5',
                    style: AppFonts.custom(
                      size: 14,
                      weight: FontWeight.w500,
                      color: const Color(0xFF6B7280),
                    ),
                  ),
                  const Spacer(),
                  Text(
                    '25%',
                    style: AppFonts.custom(
                      size: 14,
                      weight: FontWeight.w600,
                      color: const Color(0xFF6B7280),
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
                    widthFactor: 0.25,
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
              Expanded(
                child: Container(
                  width: double.infinity,
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
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
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Align(
                          child: GestureDetector(
                            onTap: controller.pickPersonalInfoProfileImage,
                            child: Stack(
                              clipBehavior: Clip.none,
                              children: <Widget>[
                                Container(
                                  width: 90.w,
                                  height: 90.w,
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFF2F4F7),
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: const Color(0xFFE5E7EB),
                                      width: 1.w,
                                    ),
                                  ),
                                  child: Obx(() {
                                    final bytes = controller
                                        .personalInfoProfileImageBytes.value;
                                    if (bytes != null && bytes.isNotEmpty) {
                                      return ClipOval(
                                        child: Image.memory(
                                          bytes,
                                          width: 90.w,
                                          height: 90.w,
                                          fit: BoxFit.cover,
                                        ),
                                      );
                                    }
                                    return Center(
                                      child: ShaderMask(
                                        blendMode: BlendMode.srcIn,
                                        shaderCallback: (Rect bounds) =>
                                            AppColors.buttonColor
                                                .createShader(bounds),
                                        child: SvgPicture.asset(
                                          'assets/images/profile.svg',
                                          width: 42.w,
                                          height: 42.w,
                                        ),
                                      ),
                                    );
                                  }),
                                ),
                                Positioned(
                                  right: -2.w,
                                  bottom: -2.w,
                                  child: Container(
                                    width: 30.w,
                                    height: 30.w,
                                    decoration: BoxDecoration(
                                      gradient: AppColors.buttonColor,
                                      shape: BoxShape.circle,
                                    ),
                                    child: Icon(
                                      Icons.camera_alt_outlined,
                                      size: 16.w,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 12.h),
                        Center(
                          child: Text(
                            'Upload profile photo',
                            style: AppFonts.custom(
                              size: 13,
                              weight: FontWeight.w500,
                              color: const Color(0xFF6B7280),
                            ),
                          ),
                        ),
                        SizedBox(height: 16.h),
                        _fieldLabel('First Name'),
                        SizedBox(height: 8.h),
                        _inputField(
                          controller: controller.personalInfoFirstNameController,
                          hintText: 'Enter your name',
                          icon: Icons.person_outline,
                        ),
                        SizedBox(height: 14.h),
                        _fieldLabel('Last Name'),
                        SizedBox(height: 8.h),
                        _inputField(
                          controller: controller.personalInfoLastNameController,
                          hintText: 'Enter last name',
                          icon: Icons.person_outline,
                        ),
                        SizedBox(height: 14.h),
                        _fieldLabel('Phone Number'),
                        SizedBox(height: 8.h),
                        _inputField(
                          controller: controller.personalInfoPhoneController,
                          hintText: 'Enter your phone number',
                          icon: Icons.phone_outlined,
                          keyboardType: TextInputType.phone,
                        ),
                        SizedBox(height: 14.h),
                        _fieldLabel('Location'),
                        SizedBox(height: 8.h),
                        _inputField(
                          controller: controller.personalInfoLocationController,
                          hintText: 'Enter your name',
                          icon: Icons.location_on_outlined,
                        ),
                        SizedBox(height: 14.h),
                        Center(
                          child: Text(
                            'Your information is secure and will never be shared',
                            textAlign: TextAlign.center,
                            style: AppFonts.custom(
                              size: 13,
                              weight: FontWeight.w400,
                              color: const Color(0xFF6B7280),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20.h),
              CustomButton(
                text: 'Next',
                onTap: () {},
                margin: EdgeInsets.only(bottom: 22.h),
              ),
            ],
          ),
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

  Widget _inputField({
    required TextEditingController controller,
    required String hintText,
    required IconData icon,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
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
        prefixIcon: Icon(icon, size: 18.w, color: const Color(0xFF9CA3AF)),
        filled: true,
        fillColor: Colors.white,
        contentPadding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(color: const Color(0xFFE5E7EB), width: 1.w),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(color: const Color(0xFF0074BE), width: 1.w),
        ),
      ),
    );
  }
}
