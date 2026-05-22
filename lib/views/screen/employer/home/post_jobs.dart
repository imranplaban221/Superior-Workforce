import 'package:flutter/material.dart';
import 'package:flutter_extension/util/app_colors.dart';
import 'package:flutter_extension/util/app_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class PostJobs extends StatefulWidget {
  const PostJobs({super.key});

  @override
  State<PostJobs> createState() => _PostJobsState();
}

class _PostJobsState extends State<PostJobs> {
  final TextEditingController titleController =
      TextEditingController();

  final TextEditingController vacancyController =
      TextEditingController();

  final TextEditingController searchController =
      TextEditingController();

  bool isDropdownOpen = true;

  List<String> employees = [
    "Akash",
    "Batash",
    "Patal",
    "Mati",
    "Ghor",
    "Macha",
  ];

  List<String> selectedEmployees = [
    "Mati",
    "Ghor",
    "Macha",
  ];



String selectedShift = "Night";

List<String> weekDays = [
  "Su",
  "Mo",
  "Tu",
  "We",
  "Th",
  "Fr",
  "Sa",
];

List<String> selectedDays = ["Su"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,

      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding:
                EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [

                SizedBox(height: 18.h),

  
                Row(
                  children: [

                    GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: SvgPicture.asset(
                        'assets/images/arrow_back.svg',
                        height: 22.h,
                        width: 22.w,
                        colorFilter:
                            const ColorFilter.mode(
                          Color(0xFF374151),
                          BlendMode.srcIn,
                        ),
                      ),
                    ),

                    SizedBox(width: 16.w),

                    Expanded(
                      child: Column(
                        crossAxisAlignment:
                            CrossAxisAlignment.start,
                        children: [

                          Text(
                            "Post a Job",
                            style: AppFonts.custom(
                              size: 24.sp,
                              weight: FontWeight.w600,
                              color:
                                  const Color(0xFF374151),
                            ),
                          ),

                          SizedBox(height: 2.h),

                          Text(
                            "Fill in the details to post a new job.",
                            style: AppFonts.custom(
                              size: 16.sp,
                              weight:
                                  FontWeight.w400,
                              color:
                                  const Color(
                                      0xFF6B7280),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 28.h),

           
                _label("Job Title"),

                SizedBox(height: 10.h),

                _textField(
                  controller: titleController,
                  hintText:
                      "e.g., ICU Registered Nurse",
                ),

                SizedBox(height: 20.h),

           
                _label("Vacancy"),

                SizedBox(height: 10.h),

                _textField(
                  controller: vacancyController,
                  hintText: "e.g 10 employees",
                ),

                SizedBox(height: 20.h),

               
                _label("Invite Employees"),

                SizedBox(height: 10.h),

                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(16.w),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.circular(
                            18.r),
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
                            isDropdownOpen =
                                !isDropdownOpen;
                          });
                        },
                        child: Row(
                          children: [

                            Expanded(
                              child: TextField(
                                controller:
                                    searchController,
                                decoration:
                                    InputDecoration(
                                  border:
                                      InputBorder.none,
                                  hintText:
                                      "Search employee",
                                  hintStyle:
                                      AppFonts.custom(
                                    size: 14.sp,
                                    weight:
                                        FontWeight
                                            .w400,
                                    color:
                                        const Color(
                                            0xFF6B7280),
                                  ),
                                ),
                                style:
                                    AppFonts.custom(
                                  size: 16.sp,
                                  weight:
                                      FontWeight
                                          .w400,
                                  color:
                                      const Color(
                                          0xFF374151),
                                ),
                              ),
                            ),

                            AnimatedRotation(
                              turns:
                                  isDropdownOpen
                                      ? 0.5
                                      : 0,
                              duration:
                                  const Duration(
                                      milliseconds:
                                          200),
                              child:
                                  Icon(
  isDropdownOpen
      ? Icons.keyboard_arrow_up_rounded
      : Icons.keyboard_arrow_down_rounded,

  size: 24.sp,
  color: const Color(0xFF6B7280),
),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: 10.h),

                      const Divider(
                        height: 1,
                        color: Color(
                            0xFFE5E7EB),
                      ),

                      if (isDropdownOpen) ...[

                        SizedBox(height: 10.h),

                       
                        Column(
  children:
      employees.map((employee) {

    final isSelected =
        selectedEmployees.contains(employee);

    return GestureDetector(
      onTap: () {

        setState(() {

          if (isSelected) {
            selectedEmployees.remove(employee);
          } else {
            selectedEmployees.add(employee);
          }
        });
      },

      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(
          vertical: 8.h,
        ),

        child: Text(
          employee,
          style: AppFonts.custom(
            size: 16.sp,
            weight: FontWeight.w500,

            
            color: isSelected
                ? const Color(0xFF0074BE)
                : const Color(0xFF6B7280),
          ),
        ),
      ),
    );
  }).toList(),
),
                      ],
                    ],
                  ),
                ),

                SizedBox(height: 24.h),



                
_label("Role Type"),

SizedBox(height: 10.h),

Container(
  height: 56.h,
  padding: EdgeInsets.symmetric(horizontal: 16.w),
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
  child: Row(
    children: [

      SvgPicture.asset(
        'assets/images/bag.svg',
        height: 20.h,
        width: 20.w,
        colorFilter: const ColorFilter.mode(
          Color(0xFF9CA3AF),
          BlendMode.srcIn,
        ),
      ),

      SizedBox(width: 12.w),

      Expanded(
        child: Text(
          "Select your role",
          style: AppFonts.custom(
            size: 16.sp,
            weight: FontWeight.w400,
            color: const Color(0xFF9CA3AF),
          ),
        ),
      ),

      Icon(
        Icons.keyboard_arrow_down_rounded,
        color: const Color(0xFF9CA3AF),
        size: 24.sp,
      ),
    ],
  ),
),

SizedBox(height: 20.h),


_label("Location"),

SizedBox(height: 10.h),

Container(
  height: 56.h,
  padding: EdgeInsets.symmetric(horizontal: 16.w),
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
  child: Row(
    children: [

      SvgPicture.asset(
        'assets/images/location.svg',
        height: 20.h,
        width: 20.w,
        colorFilter: const ColorFilter.mode(
          Color(0xFF9CA3AF),
          BlendMode.srcIn,
        ),
      ),

      SizedBox(width: 12.w),

      Expanded(
        child: TextField(
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: "Enter your name",
            hintStyle: AppFonts.custom(
              size: 14.sp,
              weight: FontWeight.w400,
              color: const Color(0xFF9CA3AF),
            ),
          ),
        ),
      ),
    ],
  ),
),

SizedBox(height: 20.h),


_label("Date"),

SizedBox(height: 10.h),

Container(
  height: 56.h,
  padding: EdgeInsets.symmetric(horizontal: 16.w),
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
  child: Row(
    children: [

      Expanded(
        child: Text(
          "Select date",
          style: AppFonts.custom(
            size: 16.sp,
            weight: FontWeight.w400,
            color: const Color(0xFF9CA3AF),
          ),
        ),
      ),

      SvgPicture.asset(
        'assets/images/calendar2.svg',
        height: 22.h,
        width: 22.w,
        colorFilter: const ColorFilter.mode(
          Color(0xFF6B7280),
          BlendMode.srcIn,
        ),
      ),
    ],
  ),
),

SizedBox(height: 20.h),


_label("Shift"),

SizedBox(height: 10.h),

Container(
  width: double.infinity,
  padding: EdgeInsets.all(16.w),
  decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(18.r),
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

          Expanded(
            child: Text(
              "Shift details",
              style: AppFonts.custom(
                size: 14.sp,
                weight: FontWeight.w400,
                color: const Color(0xFF374151),
              ),
            ),
          ),

          Icon(
            Icons.keyboard_arrow_up_rounded,
            color: const Color(0xFF9CA3AF),
            size: 24.sp,
          ),
        ],
      ),

      SizedBox(height: 10.h),

      const Divider(
        height: 1,
        color: Color(0xFFE5E7EB),
      ),

      SizedBox(height: 14.h),

      Column(
        crossAxisAlignment:
            CrossAxisAlignment.start,
        children: [

          GestureDetector(
            onTap: () {
              setState(() {
                selectedShift = "Day";
              });
            },
            child: Text(
              "Day",
              style: AppFonts.custom(
                size: 14.sp,
                weight: FontWeight.w400,
                color: selectedShift == "Day"
                    ? const Color(0xFF0074BE)
                    : const Color(0xFF374151),
              ),
            ),
          ),

          SizedBox(height: 12.h),

          GestureDetector(
            onTap: () {
              setState(() {
                selectedShift = "Night";
              });
            },
            child: Text(
              "Night",
              style: AppFonts.custom(
                size: 14.sp,
                weight: FontWeight.w400,
                color: selectedShift == "Night"
                    ? const Color(0xFF0074BE)
                    : const Color(0xFF374151),
              ),
            ),
          ),
        ],
      ),

      SizedBox(height: 16.h),

   
      Container(
        height: 48.h,
        padding:
            EdgeInsets.symmetric(horizontal: 14.w),
        decoration: BoxDecoration(
          borderRadius:
              BorderRadius.circular(12.r),
          border: Border.all(
            color: const Color(0xFFD1D5DB),
          ),
        ),
        child: Center(
          child: TextField(
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText:
                  "Enter timing e.g. 8.00 AM - 6.00 PM",
              hintStyle: AppFonts.custom(
                size: 14.sp,
                weight: FontWeight.w400,
                color: const Color(0xFF9CA3AF),
              ),
            ),
          ),
        ),
      ),

      SizedBox(height: 18.h),

  
      Row(
        mainAxisAlignment:
            MainAxisAlignment.spaceBetween,
        children: weekDays.map((day) {

          final isSelected =
              selectedDays.contains(day);

          return GestureDetector(
            onTap: () {

              setState(() {

                if (isSelected) {
                  selectedDays.remove(day);
                } else {
                  selectedDays.add(day);
                }
              });
            },

            child: Text(
              day,
              style: AppFonts.custom(
                size: 14.sp,
                weight: FontWeight.w400,
                color: isSelected
                    ? const Color(0xFF0074BE)
                    : const Color(0xFF4B5563),
              ),
            ),
          );
        }).toList(),
      ),
    ],
  ),
),

SizedBox(height: 20.h),


_label("Salary"),

SizedBox(height: 10.h),

_textField(
  controller: TextEditingController(),
  hintText: "e.g \$50",
),

SizedBox(height: 24.h),


_label("Job Description"),

SizedBox(height: 10.h),

Container(
  width: double.infinity,
  padding: EdgeInsets.all(16.w),
  decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(18.r),
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
        children: [

          Expanded(
            child: Text(
              "Describe the job details",
              style: AppFonts.custom(
                size: 15.sp,
                weight: FontWeight.w400,
                color: const Color(0xFF9CA3AF),
              ),
            ),
          ),

          
        ],
      ),

      SizedBox(height: 10.h),

      
      SizedBox(
        height: 80.h,
        child: TextField(
          maxLines: null,
          expands: true,
          textAlignVertical:
              TextAlignVertical.top,

          decoration: const InputDecoration(
            border: InputBorder.none,
          ),

          style: AppFonts.custom(
            size: 15.sp,
            weight: FontWeight.w400,
            color: const Color(0xFF374151),
          ),
        ),
      ),
    ],
  ),
),

SizedBox(height: 24.h),
                
                

                SizedBox(height: 24.h),

                
                SizedBox(
                  width: double.infinity,
                  height: 54.h,
                  child: ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(
                      padding: EdgeInsets.zero,
                      backgroundColor:
                          Colors.transparent,
                      shadowColor:
                          Colors.transparent,
                      shape:
                          RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(
                                12.r),
                      ),
                    ),
                    onPressed: () {},
                    child: Ink(
                      decoration: BoxDecoration(
                        gradient:
                            AppColors.buttonColor,
                        borderRadius:
                            BorderRadius.circular(
                                12.r),
                      ),
                      child: Center(
                        child: Text(
                          "Post Job",
                          style:
                              AppFonts.custom(
                            size: 16.sp,
                            weight:
                                FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 24.h),
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
        weight: FontWeight.w400,
        color: const Color(0xFF374151),
      ),
    );
  }

  
  Widget _textField({
    required TextEditingController controller,
    required String hintText,
  }) {
    return Container(
      height: 56.h,
      padding:
          EdgeInsets.symmetric(horizontal: 16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius:
            BorderRadius.circular(16.r),
        boxShadow: const [
          BoxShadow(
            color: Color(0x14000000),
            offset: Offset(0, 4),
            blurRadius: 8,
          ),
        ],
      ),
      child: Center(
        child: TextField(
          controller: controller,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: hintText,
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
    );
  }
}