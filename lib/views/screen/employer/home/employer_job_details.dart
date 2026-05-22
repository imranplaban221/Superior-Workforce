import 'package:flutter/material.dart';
import 'package:flutter_extension/util/app_colors.dart';
import 'package:flutter_extension/util/app_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class EmployerJobDetails extends StatefulWidget {
  const EmployerJobDetails({super.key});

  @override
  State<EmployerJobDetails> createState() => _EmployerJobDetailsState();
}

class _EmployerJobDetailsState extends State<EmployerJobDetails> {
  bool isEmployeesExpanded = true;

  final TextEditingController messageController = TextEditingController();

  final List<Map<String, String>> employees = [
    {
      "name": "Mr. Rahan",
      "role": "CNA",
      "image": "assets/images/spider_man.jpg",
    },
    {
      "name": "Mr. Rahan",
      "role": "CNA",
      "image": "assets/images/spider_man.jpg",
    },
  ];

  @override
  void dispose() {
    messageController.dispose();
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
                      child: SvgPicture.asset(
                        'assets/images/arrow_back.svg',
                        height: 22.h,
                        width: 22.w,
                        colorFilter: const ColorFilter.mode(
                          Color(0xFF374151),
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                    SizedBox(width: 12.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Jobs Details",
                          style: AppFonts.custom(
                            size: 22.sp,
                            weight: FontWeight.w600,
                            color: const Color(0xFF374151),
                          ),
                        ),
                        SizedBox(height: 2.h),
                        Text(
                          "Ongoing",
                          style: AppFonts.custom(
                            size: 14.sp,
                            weight: FontWeight.w400,
                            color: const Color(0xFF6B7280),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                SizedBox(height: 20.h),

                
                _jobDetailCard(),

                SizedBox(height: 16.h),

                // EMPLOYEES SECTION
                _employeesSection(),

                SizedBox(height: 16.h),

                // SEND MESSAGE
                _sendMessageSection(),

                SizedBox(height: 20.h),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _jobDetailCard() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: const [
          BoxShadow(
            color: Color(0x14000000),
            offset: Offset(0, 4),
            blurRadius: 8,
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 44.w,
                height: 44.w,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(14.r),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x14000000),
                      offset: Offset(0, 4),
                      blurRadius: 8,
                    ),
                  ],
                ),
                clipBehavior: Clip.antiAlias,
                child: Image.asset(
                  'assets/images/cat.jpg',
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            "Job Title",
                            style: AppFonts.custom(
                              size: 22.sp,
                              weight: FontWeight.w600,
                              color: const Color(0xFF374151),
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 10.w,
                            vertical: 5.h,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFFFEFCE8),
                            borderRadius: BorderRadius.circular(20.r),
                          ),
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                'assets/images/star.svg',
                                height: 12.h,
                                width: 12.w,
                                colorFilter: const ColorFilter.mode(
                                  Color(0xFFF59E0B),
                                  BlendMode.srcIn,
                                ),
                              ),
                              SizedBox(width: 4.w),
                              Text(
                                "4.8",
                                style: AppFonts.custom(
                                  size: 12.sp,
                                  weight: FontWeight.w600,
                                  color: const Color(0xFFA65F00),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 2.h),
                    Row(
                      children: [
                        Text(
                          "CNA",
                          style: AppFonts.custom(
                            size: 13.sp,
                            weight: FontWeight.w600,
                            color: const Color(0xFF0074BE),
                          ),
                        ),
                        SizedBox(width: 6.w),
                        Text(
                          "Ongoing",
                          style: AppFonts.custom(
                            size: 12.sp,
                            weight: FontWeight.w400,
                            color: const Color(0xFF6B7280),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),

          SizedBox(height: 14.h),

          _infoRow(
            icon: 'assets/images/location.svg',
            text: "Los Angeles, CA",
          ),

          SizedBox(height: 10.h),

          _infoRow(
            icon: 'assets/images/user.svg',
            text: "Employees Assigned",
            trailing: Container(
              width: 34.w,
              height: 34.w,
              decoration: const BoxDecoration(
                color: Color(0xFFE5F1FF),
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Text(
                  "2",
                  style: AppFonts.custom(
                    size: 14.sp,
                    weight: FontWeight.w600,
                    color: const Color(0xFF0074BE),
                  ),
                ),
              ),
            ),
          ),

          SizedBox(height: 10.h),

          Row(
            children: [
              SvgPicture.asset(
                'assets/images/doller.svg',
                height: 18.h,
                width: 18.w,
                colorFilter: const ColorFilter.mode(
                  Color(0xFF22C55E),
                  BlendMode.srcIn,
                ),
              ),
              SizedBox(width: 8.w),
              Text(
                "\$ 22 / hour",
                style: AppFonts.custom(
                  size: 16.sp,
                  weight: FontWeight.w600,
                  color: const Color(0xFF22C55E),
                ),
              ),
            ],
          ),

          SizedBox(height: 14.h),

          Row(
            children: [
              SvgPicture.asset(
                'assets/images/clock.svg',
                height: 18.h,
                width: 18.w,
                colorFilter: const ColorFilter.mode(
                  Color(0xFF4B5563),
                  BlendMode.srcIn,
                ),
              ),
              SizedBox(width: 8.w),
              Text(
                "Night Shift",
                style: AppFonts.custom(
                  size: 15.sp,
                  weight: FontWeight.w400,
                  color: const Color(0xFF4B5563),
                ),
              ),
              SizedBox(width: 6.w),
              Text(
                "•",
                style: AppFonts.custom(
                  size: 14.sp,
                  color: const Color(0xFF6B7280),
                ),
              ),
              SizedBox(width: 6.w),
              Text(
                "Full-time",
                style: AppFonts.custom(
                  size: 15.sp,
                  weight: FontWeight.w400,
                  color: const Color(0xFF4B5563),
                ),
              ),
              const Spacer(),
              Text(
                "12 March, 2026",
                style: AppFonts.custom(
                  size: 12.sp,
                  weight: FontWeight.w400,
                  color: const Color(0xFF6B7280),
                ),
              ),
            ],
          ),

          SizedBox(height: 14.h),

          const Divider(
            height: 1,
            color: Color(0xFFE5E7EB),
          ),

          SizedBox(height: 14.h),

          Row(
            children: [
              SvgPicture.asset(
                'assets/images/time.svg',
                height: 16.h,
                width: 16.w,
                colorFilter: const ColorFilter.mode(
                  Color(0xFF0074BE),
                  BlendMode.srcIn,
                ),
              ),
              SizedBox(width: 6.w),
              Text(
                "2h remaining",
                style: AppFonts.custom(
                  size: 12.sp,
                  weight: FontWeight.w500,
                  color: const Color(0xFF0074BE),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _employeesSection() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: const [
          BoxShadow(
            color: Color(0x14000000),
            offset: Offset(0, 4),
            blurRadius: 8,
          ),
        ],
      ),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                isEmployeesExpanded = !isEmployeesExpanded;
              });
            },
            child: Row(
              children: [
                Container(
                  width: 36.w,
                  height: 36.w,
                  decoration:  BoxDecoration(
                    color: const Color(0xFFE5F1FF),
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(14)
                  ),
                  child: Center(
                    child: SvgPicture.asset(
                      'assets/images/user.svg',
                      height: 18.h,
                      width: 18.w,
                      colorFilter: const ColorFilter.mode(
                        Color(0xFF0074BE),
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10.w),
                Expanded(
                  child: Text(
                    "Employees List (2)",
                    style: AppFonts.custom(
                      size: 18.sp,
                      weight: FontWeight.w600,
                      color: const Color(0xFF374151),
                    ),
                  ),
                ),
                AnimatedRotation(
                  turns: isEmployeesExpanded ? 0.5 : 0,
                  duration: const Duration(milliseconds: 200),
                  child: Icon(
                    Icons.keyboard_arrow_up_rounded,
                    color: const Color(0xFF6B7280),
                    size: 24.sp,
                  ),
                ),
              ],
            ),
          ),

          if (isEmployeesExpanded) ...[
            SizedBox(height: 12.h),
            ...employees.map(
              (employee) => Padding(
                padding: EdgeInsets.only(bottom: 12.h),
                child: _employeeItem(
                  name: employee["name"] ?? "",
                  role: employee["role"] ?? "",
                  image: employee["image"] ?? "",
                  onRemove: () {},
                  onMessage: () {},
                  onCall: () {},
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _employeeItem({
    required String name,
    required String role,
    required String image,
    required VoidCallback onRemove,
    required VoidCallback onMessage,
    required VoidCallback onCall,
  }) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14.r),
        border: Border.all(
          color: const Color(0xFFE5E7EB),
          width: 1,
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 40.w,
            height: 40.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50.r),
            ),
            clipBehavior: Clip.antiAlias,
            child: Image.asset(
              image,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: AppFonts.custom(
                    size: 18.sp,
                    weight: FontWeight.w500,
                    color: const Color(0xFF374151),
                  ),
                ),
                SizedBox(height: 2.h),
                Text(
                  role,
                  style: AppFonts.custom(
                    size: 14.sp,
                    weight: FontWeight.w600,
                    color: const Color(0xFF0074BE),
                  ),
                ),
              ],
            ),
          ),
          _actionButton(
            icon: 'assets/images/remove.svg',
            bgColor: const Color(0xFFFFF1EB),
            iconColor: const Color(0xFFFFA552),
            onTap: onRemove,
          ),
          SizedBox(width: 8.w),
          _actionButton(
            icon: 'assets/images/message.svg',
            bgColor: const Color(0xFFE5F1FF),
            iconColor: const Color(0xFF0074BE),
            onTap: onMessage,
          ),
          SizedBox(width: 8.w),
          _actionButton(
            icon: 'assets/images/phone.svg',
            bgColor: const Color(0xFFE5F1FF),
            iconColor: const Color(0xFF0074BE),
            onTap: onCall,
          ),
        ],
      ),
    );
  }

  Widget _sendMessageSection() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: const [
          BoxShadow(
            color: Color(0x14000000),
            offset: Offset(0, 4),
            blurRadius: 8,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 36.w,
                height: 36.w,
                decoration: const BoxDecoration(
                  color: Color(0xFFE5F1FF),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: SvgPicture.asset(
                    'assets/images/message.svg',
                    height: 18.h,
                    width: 18.w,
                    colorFilter: const ColorFilter.mode(
                      Color(0xFF0074BE),
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 10.w),
              Expanded(
                child: Text(
                  "Send Message",
                  style: AppFonts.custom(
                    size: 18.sp,
                    weight: FontWeight.w600,
                    color: const Color(0xFF374151),
                  ),
                ),
              ),
            ],
          ),
          
          Padding(
            padding: const EdgeInsets.only(left: 45),
            child: Text(
              "For All Employees",
              style: AppFonts.custom(
                size: 12.sp,
                weight: FontWeight.w400,
                color: const Color(0xFF6B7280),
              ),
            ),
          ),
          SizedBox(height: 12.h),
          Padding(
            padding: const EdgeInsets.only(left: 40),
            child: Container(
              width: 320.w,
              height: 76.h,
            
              padding: EdgeInsets.only(
                top: 12.h,
                bottom: 12.h,
                left: 20.w,
              ),
            
              decoration: BoxDecoration(
                color: Colors.white,
            
                borderRadius:
                    BorderRadius.circular(16.r),
            
                border: Border.all(
                  color: const Color(0xFFE7E8EA),
                  width: 0.5,
                ),
            
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x14000000),
                    offset: Offset(0, 3),
                    blurRadius: 8,
                  ),
                ],
              ),
            
              child: TextField(
                controller: messageController,
            
                maxLines: null,
                expands: true,
            
                textAlignVertical:
                    TextAlignVertical.top,
            
                decoration: InputDecoration(
                  border: InputBorder.none,
            
                  isCollapsed: true,
            
                  hintText: "Write here",
            
                  hintStyle: AppFonts.custom(
                    size: 14.sp,
                    weight: FontWeight.w400,
                    color: const Color(0xFF9CA3AF),
                  ),
                ),
            
                style: AppFonts.custom(
                  size: 14.sp,
                  weight: FontWeight.w400,
                  color: const Color(0xFF374151),
                ),
              ),
            ),
          ),
          SizedBox(height: 12.h),
          SizedBox(
            width: double.infinity,
            height: 44.h,
            
            child: ElevatedButton(
              
              style: ElevatedButton.styleFrom(
                
                padding: EdgeInsets.zero,
                backgroundColor: Colors.transparent,
                shadowColor: Colors.transparent,
                shape: 
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.r),
                ),
                
                
              ),
              onPressed: () {},
              child: Padding(
                padding: const EdgeInsets.only(left: 40),
                child: Ink(
                  height: 36.h,
                  width: 318.w,
                  decoration: BoxDecoration(
                    gradient: AppColors.buttonColor,
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Center(
                    child: Text(
                      "Send Now",
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
          ),
        ],
      ),
    );
  }

  Widget _infoRow({
    required String icon,
    required String text,
    Widget? trailing,
  }) {
    return Row(
      children: [
        SvgPicture.asset(
          icon,
          height: 18.h,
          width: 18.w,
          colorFilter: const ColorFilter.mode(
            Color(0xFF6B7280),
            BlendMode.srcIn,
          ),
        ),
        SizedBox(width: 8.w),
        Expanded(
          child: Text(
            text,
            style: AppFonts.custom(
              size: 15.sp,
              weight: FontWeight.w400,
              color: const Color(0xFF4B5563),
            ),
          ),
        ),
        if (trailing != null) trailing,
      ],
    );
  }

  Widget _actionButton({
    required String icon,
    required Color bgColor,
    required Color iconColor,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 32.w,
        height: 32.w,
        decoration: BoxDecoration(
          color: bgColor,
          shape: BoxShape.circle,
        ),
        child: Center(
          child: SvgPicture.asset(
            icon,
            height: 16.h,
            width: 16.w,
            colorFilter: ColorFilter.mode(
              iconColor,
              BlendMode.srcIn,
            ),
          ),
        ),
      ),
    );
  }
}