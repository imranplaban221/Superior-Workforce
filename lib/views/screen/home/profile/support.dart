import 'package:flutter/material.dart';
import 'package:flutter_extension/util/app_colors.dart';
import 'package:flutter_extension/util/app_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';

class Support extends StatefulWidget {
  const Support({super.key});
  

  @override
  State<Support> createState() => _SupportState();
  
}
String? selectedFileName;

class _SupportState extends State<Support> {
  final TextEditingController nameController =
      TextEditingController(text: "Mr. John");
  final TextEditingController emailController =
      TextEditingController(text: "xyz123@gmail.com");
  final TextEditingController opinionController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    opinionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 16.h),

                
                Row(
                  children: [
                    GestureDetector(
                      onTap: () => Get.back(),
                      child: Icon(Icons.arrow_back,
                        size: 32,
                      ),
                    ),
                    SizedBox(width: 12.w),
                    Text(
                      "Support",
                      style: AppFonts.custom(
                        size: 20.sp,
                        weight: FontWeight.w600,
                        color: const Color(0xFF374151),
                      ),
                    ),
                    const Spacer(),
                    _topIconButton('assets/images/message.svg'),
                    SizedBox(width: 10.w),
                    _topIconButton('assets/images/phone.svg'),
                  ],
                ),

                SizedBox(height: 20.h),

                
                _label("Your Name"),
                SizedBox(height: 8.h),
                _field(
                  controller: nameController,
                  hintText: "Mr. John",
                  readOnly: true,
                ),

                SizedBox(height: 16.h),

              
                _label("Your Email"),
                SizedBox(height: 8.h),
                _field(
                  controller: emailController,
                  hintText: "xyz123@gmail.com",
                  readOnly: true,
                ),

                SizedBox(height: 16.h),

                _label("Opinion / Report / Problem"),
                SizedBox(height: 8.h),
                Container(
                  height: 120.h,
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 12.h,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12.r),
                    boxShadow: const [
                      BoxShadow(
                        color: Color(0x14000000),
                        offset: Offset(0, 4),
                        blurRadius: 8,
                      ),
                    ],
                  ),
                  child: TextField(
                    controller: opinionController,
                    maxLines: null,
                    expands: true,
                    textAlignVertical: TextAlignVertical.top,
                    decoration: InputDecoration(
                      hintText: "Write here",
                      hintStyle: AppFonts.custom(
                        size: 14.sp,
                        weight: FontWeight.w400,
                        color: const Color(0xFF9CA3AF),
                      ),
                      border: InputBorder.none,
                      isDense: true,
                    ),
                    style: AppFonts.custom(
                      size: 14.sp,
                      weight: FontWeight.w400,
                      color: const Color(0xFF374151),
                    ),
                  ),
                ),

                SizedBox(height: 16.h),

                
                _label("Attached File"),
                SizedBox(height: 8.h),

                GestureDetector(
  onTap: pickFile,
  child: Container(
    width: double.infinity,
    height: 110.h,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12.r),
      boxShadow: const [
        BoxShadow(
          color: Color(0x14000000),
          offset: Offset(0, 4),
          blurRadius: 8,
        ),
      ],
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [

        Container(
          width: 36.w,
          height: 36.w,
          decoration: BoxDecoration(
            color: const Color(0xFFE5F1FF),
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Center(
            child: SvgPicture.asset(
              'assets/images/upload.svg',
              height: 18,
              width: 18,
               colorFilter: const ColorFilter.mode(
    Colors.black, 
    BlendMode.srcIn,
  ),
              
            ),
          ),
        ),

        SizedBox(height: 10.h),

        Text(
          selectedFileName ?? "Tap to select file",
          style: AppFonts.custom(
            size: 14.sp,
            weight: FontWeight.w400,
            color: selectedFileName == null
                ? const Color(0xFF6B7280)
                : const Color(0xFF374151),
          ),
        ),
      ],
    ),
  ),
),

                SizedBox(height: 20.h),

                const SizedBox(height: 120),

                
                SizedBox(
                  width: double.infinity,
                  height: 48.h,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.zero,
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                    ),
                    onPressed: () {
                      
                    },
                    child: Ink(
                      decoration: BoxDecoration(
                        gradient: AppColors.buttonColor,
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: Center(
                        child: Text(
                          "SUBMIT NOW",
                          style: AppFonts.custom(
                            size: 14.sp,
                            weight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 20.h),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _label(String text) {
    return Text(
      text,
      style: AppFonts.custom(
        size: 14.sp,
        weight: FontWeight.w500,
        color: const Color(0xFF374151),
      ),
    );
  }

  Widget _field({
    required TextEditingController controller,
    required String hintText,
    bool readOnly = false,
  }) {
    return Container(
      height: 48.h,
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: const [
          BoxShadow(
            color: Color(0x14000000),
            offset: Offset(0, 4),
            blurRadius: 8,
          ),
        ],
      ),
      child: TextField(
        controller: controller,
        readOnly: readOnly,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: AppFonts.custom(
            size: 14.sp,
            weight: FontWeight.w400,
            color: const Color(0xFF9CA3AF),
          ),
          border: InputBorder.none,
        ),
        style: AppFonts.custom(
          size: 14.sp,
          weight: FontWeight.w400,
          color: const Color(0xFF9CA3AF),
        ),
      ),
    );
  }

  Widget _topIconButton(String assetPath) {
    return Container(
      width: 32.w,
      height: 32.w,
      decoration: BoxDecoration(
        color: Color(0xFFE7E8EA),

        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(12.8),
        
      ),
      child: Center(
        child: SvgPicture.asset(
          assetPath,
          height: 18,
          width: 18,
          colorFilter: const ColorFilter.mode(
            Color(0xFF374151),
            BlendMode.srcIn,
          ),
        ),
      ),
    );
  }
  Future<void> pickFile() async {
  FilePickerResult? result = await FilePicker.pickFiles(
    type: FileType.custom,
    allowedExtensions: [
      'jpg',
      'jpeg',
      'png',
      'svg',
      'pdf',
      'doc',
      'docx',
    ],
  );

  if (result != null) {
    setState(() {
      selectedFileName = result.files.single.name;
    });
  }
}
}


