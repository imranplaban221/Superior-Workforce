import 'package:flutter/material.dart';
import 'package:flutter_extension/helper/route_helper.dart';
import 'package:flutter_extension/util/app_colors.dart';
import 'package:flutter_extension/util/app_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';



class MessageCard extends StatelessWidget {
  final String imagePath;
  final String senderName;
  final String message;
  final String timeAgo;
  final bool isOnline;

  const MessageCard({
    super.key,
    required this.imagePath,
    required this.senderName,
    required this.message,
    required this.timeAgo,
    this.isOnline = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(
          color: const Color(0xFFE7E8EA),
          width: 0.5,
        ),
        boxShadow: const [
          BoxShadow(
            color: Color(0x0A000000),
            offset: Offset(0, 4),
            blurRadius: 4,
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
         
          Stack(
            children: [
              Container(
                width: 40.w,
                height: 40.w,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.asset(
                    imagePath,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              if (isOnline)
                Positioned(
                  bottom: 2,
                  right: 2,
                  child: Container(
                    width: 12.w,
                    height: 12.w,
                    decoration: BoxDecoration(
                      color: const Color(0xFF22C55E),
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.white,
                        width: 2,
                      ),
                    ),
                  ),
                ),
            ],
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
                        senderName,
                        style: AppFonts.custom(
                          size: 18.sp,
                          weight: FontWeight.w600,
                          color: const Color(0xFF374151),
                        ),
                      ),
                    ),
                    Text(
                      timeAgo,
                      style: AppFonts.custom(
                        size: 12.sp,
                        weight: FontWeight.w500,
                        color: const Color(0xFF6B7280),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 8.h),

                Text(
                  message,
                  style: AppFonts.custom(
                    size: 14.sp,
                    weight: FontWeight.w400,
                    color: const Color(0xFF374151),
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


class MessageScreen extends StatefulWidget {
  const MessageScreen({super.key});

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                SizedBox(height: 16.h),

                
                Row(
                  children: [
                    IconButton(
                      onPressed: Get.back,
                      icon: const Icon(Icons.arrow_back),
                      iconSize: 22.sp,
                    ),
                    SizedBox(width: 8.w),
                    Text(
                      "Messages",
                      style: AppFonts.custom(
                        size: 24.sp,
                        weight: FontWeight.w600,
                        color: const Color(0xFF374151),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 24.h),

                Text(
                  "3 New",
                  style: AppFonts.custom(
                    size: 18.sp,
                    weight: FontWeight.w500,
                    color: const Color(0xFF374151),
                  ),
                ),

                SizedBox(height: 16.h),

                
                 GestureDetector(
                  onTap: () {

                    Get.toNamed(AppRoutes.chatScreen);
                    
                  },
                  child: const MessageCard(
                    imagePath: 'assets/images/spider_man.jpg',
                    senderName: 'City Hospital',
                    message: "We'd like to schedule an interview for the RN position",
                    timeAgo: '1m ago',
                    isOnline: true,
                  ),
                ),

                SizedBox(height: 12.h),

                GestureDetector(
                  onTap: () {
                    Get.toNamed(AppRoutes.chatScreen);
                  },
                  child: const MessageCard(
                    imagePath: 'assets/images/spider_man.jpg',
                    senderName: 'General Clinic',
                    message: 'Your application has been reviewed successfully',
                    timeAgo: '10m ago',
                    isOnline: false,
                  ),
                ),

                SizedBox(height: 12.h),

                GestureDetector(
                  onTap: () {
                    Get.toNamed(AppRoutes.chatScreen);
                  },
                  child: const MessageCard(
                    imagePath: 'assets/images/spider_man.jpg',
                    senderName: 'Metro Health',
                    message: 'Please confirm your availability for next Monday',
                    timeAgo: '1h ago',
                    isOnline: true,
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}