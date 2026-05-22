// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_extension/util/app_colors.dart';
import 'package:flutter_extension/util/app_text.dart';
import 'package:flutter_extension/views/base/custom_payment_dropdown.dart';
import 'package:flutter_extension/views/base/custom_wallet_card.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';




class PaymentTab extends StatefulWidget {
  const PaymentTab({super.key});

  @override
  State<PaymentTab> createState() => _PaymentTabState();
}

class _PaymentTabState extends State<PaymentTab> {
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
                  Text("My Earnings",
                  style: AppFonts.custom(
                    size: 24.sp,
                    weight: FontWeight.w600,
                    color:  Colors.black,
                    height: 1,
                  ),
                ),
      
                SizedBox(height: 8.h),
      
                Text(
                  'Track your payments and earnings',
                  style: AppFonts.custom(
                    size: 14.sp,
                    weight: FontWeight.w400,
                    color: const Color(0xFF3D4A57),
                    height: 1,
                  ),
                ),
      
                SizedBox(height: 20.h),

                Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [

    _earningBox(
      imagePath: 'assets/images/doller.svg',
      imageColor: const Color(0xFF22C55E),
      amount: "\$4112",
      title: "Total Earned",
    ),

    _earningBox(
      imagePath: 'assets/images/arrow.svg',
      imageColor: const Color(0xFF3B82F6),
      amount: "\$123",
      title: "This Month",
    ),

    _earningBox(
      imagePath: 'assets/images/clock.svg',
      imageColor: const Color(0xFFF97316),
      amount: "\$348",
      title: "Pending",
    ),

  ],
),

SizedBox(height: 20.h,),

const WalletCard(),

SizedBox(height: 20.h,),

Text('PAYMENTS HISTORY (5)',
style: AppFonts.custom(
                    size: 16.sp,
                    weight: FontWeight.w400,
                    color: const Color(0xFF3D4A57),
                    height: 1,
                  ),),


                  SizedBox(height: 20.h,),


                  const PaymentDropdownCard(),



              ],
            ),
          ),
        ),
      ));
  }

  Widget _earningBox({
  required String imagePath,
  required Color imageColor,
  required String amount,
  required String title,
}) {
  return Container(
    width: 110.w,
    constraints: BoxConstraints( 
      minHeight: 106.h,
    ),
    padding: EdgeInsets.all(12.w),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(16.r),
      boxShadow: const [
        BoxShadow(
          color: Color(0x14000000),
          offset: Offset(0, 4),
          blurRadius: 4,
        ),
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min, 
      children: [

        Container(
          padding: EdgeInsets.all(8.8.w),
          decoration: BoxDecoration(
            color: imageColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: SvgPicture.asset(
  imagePath,
  height: 17,
  width: 17,
  colorFilter: ColorFilter.mode(
    imageColor, 
    BlendMode.srcIn,
  ),
),
        ),

        SizedBox(height: 10.h),

        Text(
          amount,
          style: AppFonts.custom(
            size: 18.sp,
            weight: FontWeight.w600,
            color: Colors.black,
          ),
        ),

        SizedBox(height: 4.h),

        Text(
          title,
          style: AppFonts.custom(
            size: 12.sp,
            weight: FontWeight.w400,
            color: const Color(0xFF6B7280),
          ),
        ),

        
      ],


      
    ),
  );
}
}