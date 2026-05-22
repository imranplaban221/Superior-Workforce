// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_extension/controller/nav_controller.dart';
import 'package:flutter_extension/util/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CustomBottomNav extends StatelessWidget {
  CustomBottomNav({super.key});

  final NavController controller = Get.find<NavController>();

  final List<Map<String, dynamic>> items = [
  {'icon': 'assets/images/home.svg', 'label': 'Home'},
  {'icon': 'assets/images/job.svg', 'label': 'Jobs'},
  {'icon': 'assets/images/payments.svg', 'label': 'Payments'},
  {'icon': 'assets/images/profile.svg', 'label': 'Profile'},
];

  @override
  Widget build(BuildContext context) {
 return SafeArea(
   top: false,
  left: false,
  right: false,
  bottom: false, 
  child: Container(
    padding: const EdgeInsets.fromLTRB(30, 12, 30, 12),
    decoration: const BoxDecoration(
      color: Colors.white,
      border: Border(
        top: BorderSide(
          color: Color(0xFFE5F1FF),
          width: 1,
        ),
      ),
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(16),
        topRight: Radius.circular(16),
      ),
    ),
    child: Obx(
      () => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(items.length, (index) {
          final isSelected = controller.currentIndex.value == index;

          return GestureDetector(
            onTap: () => controller.changeTab(index),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: const EdgeInsets.all(13),
                  decoration: BoxDecoration(
                    gradient:
                        isSelected ? AppColors.buttonColor : null,
                        color: isSelected ? null : const Color(0xFFE7E8EA),
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(20),
                    
                  ),
                 child: SvgPicture.asset(
  items[index]['icon'],
  width: 28.w,
  height: 28.h,
  color: isSelected ? Colors.white : Colors.black, 
),
                ),
                const SizedBox(height: 4),
                Text(
                  items[index]['label'],
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: const FontWeight(400),
                    color: isSelected
                        ? const Color(0xFF0E1B2A)
                        : const Color(0xFF9CA3AF),
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    ),
  ),
);
}
}