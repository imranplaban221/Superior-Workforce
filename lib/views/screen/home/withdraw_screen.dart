import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_extension/helper/route_helper.dart';
import 'package:flutter_extension/util/app_colors.dart';
import 'package:flutter_extension/util/app_text.dart';
import 'package:flutter_extension/views/base/custom_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';



class WithdrawScreen extends StatefulWidget {
  const WithdrawScreen({super.key});

  @override
  State<WithdrawScreen> createState() => _WithdrawScreenState();
}

class _WithdrawScreenState extends State<WithdrawScreen> {

int selectedIndex = 0;

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
                    GestureDetector(
                      onTap: () => Get.back(),
                      child: const Icon(Icons.arrow_back),
                    ),
                     SizedBox(width: 16.w),
                    Text(
                      "Withdraw Amount",
                      style: AppFonts.custom(
                        size: 24.sp,
                        weight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
            
                 SizedBox(height: 20.h),


                 Container(
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
                width: 40.w,
  height: 40.w,
                
                decoration: BoxDecoration(
                  color:  Colors.white,
                  borderRadius: BorderRadius.circular(12.r),
                   border: Border.all(
      color: const Color(0xFFE5E7EB), 
      width: 0.5,
    ),
     boxShadow: const [
      BoxShadow(
        color: Color(0x1A000000), 
        offset: Offset(0, 2.86),
        blurRadius: 4.29,
        spreadRadius: -0.71,
      ),
    ],
                ),
                child: Center(
                  child: SvgPicture.asset(
                    'assets/images/payments.svg',
                    height: 22,
                    width: 22,
                     colorFilter: const ColorFilter.mode(
        Color(0xFF374151), 
        BlendMode.srcIn,
      ),
                  ),
                ),
              ),

              SizedBox(width: 10.w),

              Text(
                "Digital Wallet",
                style: AppFonts.custom(
                  size: 18.sp,
                  weight: FontWeight.w600,
                  color:  Colors.black,
                ),
              ),
            ],
          ),

          SizedBox(height: 16.h),

          
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 20.h),
            decoration: BoxDecoration(
              color: const Color(0xFFE5F1FF),
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: Column(
              children: [
                Text(
                  "Total",
                  style: AppFonts.custom(
                    size: 14.sp,
                    weight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),


                Text(
                  "\$1,250",
                  style: AppFonts.custom(
                    size: 40.sp,
                    weight: FontWeight.w700,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 16.h),

         
          Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [

    
    Text(
      "Enter Amount",
      style: AppFonts.custom(
        size: 14.sp,
        weight: FontWeight.w400,
        color: const Color(0xFF374151),
      ),
    ),

    SizedBox(height: 8.h),

    
    Container(
      height: 48.h,
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(
          color: const Color(0xFFE5E7EB),
        ),
      ),
      child: Row(
        children: [

          SvgPicture.asset(
  'assets/images/doller.svg', 
  height: 18,
  width: 18,
  colorFilter: ColorFilter.mode(
    AppColors.primaryColor, 
    BlendMode.srcIn,
  ),
),

          SizedBox(width: 6.w),

          
          Expanded(
            child: TextField(

              keyboardType: const TextInputType.numberWithOptions(decimal: true),

  inputFormatters: [
    FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*')),
  ],
             
              decoration: InputDecoration(
                hintText: "0.00",
                hintStyle: AppFonts.custom(
                  size: 16.sp,
                  weight: FontWeight.w400,
                  color: const Color(0xFF9CA3AF),
                ),
                border: InputBorder.none,
                isDense: true,
              ),
              style: AppFonts.custom(
                size: 16.sp,
                weight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
      
      
    ),
  ],
  
),
        ],

        
      ),
      
    ),


    SizedBox(height: 20.h),




 Container(
  padding: EdgeInsets.all(12.w),
  decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(12.r),
    border: Border.all(color: const Color(0xFFE5E7EB)),
    boxShadow: const [
      BoxShadow(
        color: Color(0x1A000000),
        offset: Offset(0, 2.86),
        blurRadius: 4.29,
        spreadRadius: -0.71,
      ),
    ],
  ),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [

  
      Text(
        "Withdraw To",
        style: AppFonts.custom(
          size: 14.sp,
          weight: FontWeight.w500,
          color: const Color(0xFF374151),
        ),
      ),

      SizedBox(height: 12.h),

      Row(
        
        children: [
          _paymentOption("stripe", 0),
          SizedBox(width: 20.w),
          _paymentOption("VISA", 1),
          SizedBox(width: 20.w),
          _paymentOption("AMEX", 2),
        ],
      ),
    ],
  ),
),





 SizedBox(height: 240.h),
                  CustomButton(
                    text: 'WITHDRAW NOW',
                    height: 48.h,
                    onTap: () {},
                  ),
                  SizedBox(height: 16.h),




               


                ],
              
              ),
          ),
        ),
      ),
    );
  }


 String _getPaymentIcon(String title) {
    switch (title.toLowerCase()) {
      case 'stripe':
        return 'assets/images/stripe.svg';
      case 'visa':
        return 'assets/images/visa.svg';
      case 'amex':
        return 'assets/images/amex.svg';
      default:
        return '';
    }
  }




  Widget _paymentOption(String title, int index) {
  final isSelected = selectedIndex == index;

  return GestureDetector(
    onTap: () {
      setState(() {
        selectedIndex = index;
      });
    },
    child: Stack(
      clipBehavior: Clip.none,
      children: [

        
        Container(
          width: 75.25.w,
          height: 34.h,
          padding: EdgeInsets.symmetric(
            vertical: 8.h,
            horizontal: 16.w,
          ),
          decoration: BoxDecoration(
            color: const Color(0xFFE5F1FF),
            borderRadius: BorderRadius.circular(4.r),
          ),
          child: Center(
            child: SvgPicture.asset(
              _getPaymentIcon(title),
              height: 18,
              fit: BoxFit.contain,
            ),
          ),
        ),

       
        Positioned(
          top: -6,
          right: -6,
          child: Container(
            width: 18,
            height: 18,
           decoration: BoxDecoration(
  shape: BoxShape.circle,
  gradient: isSelected
      ? AppColors.buttonColor 
      : null,
  color: isSelected
      ? null
      : const Color(0xFFD1D5DB),
),
            child: const Icon(
              Icons.check,
              size: 16,
              color: Colors.white,
            ),
          ),
        ),
      ],
    ),
  );
}
}



