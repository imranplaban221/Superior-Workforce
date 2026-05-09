import 'package:flutter/material.dart';
import 'package:flutter_extension/util/app_colors.dart';
import 'package:flutter_extension/util/app_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PaymentDropdownCard extends StatefulWidget {
  const PaymentDropdownCard({super.key});

  @override
  State<PaymentDropdownCard> createState() => _PaymentDropdownCardState();
}

class _PaymentDropdownCardState extends State<PaymentDropdownCard> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      padding: EdgeInsets.all(12.w),
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
                isExpanded = !isExpanded;
              });
            },
            child: Row(
              children: [

               
                Container(
                  width: 40.w,
                  height: 40.w,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(11.43.r),
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
                  child:      Container(
  width: 40,
  height: 40,
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(11.43),
    border: Border.all(
      color: Colors.grey,
      width: 0.71,
    ),
  ),
  child: ClipRRect(
    borderRadius: BorderRadius.circular(11.43),
    child: Image.asset(
      'assets/images/cat.jpg',
      fit: BoxFit.cover,
    ),
  ),
),
                ),

                SizedBox(width: 10.w),

              
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "City Hospital",
                        style: AppFonts.custom(
                          size: 18.sp,
                          weight: FontWeight.w600,
                          color: const Color(0xFF374151),
                        ),
                      ),

                      if (isExpanded)
                        Text(
                          "CNA",
                          style: AppFonts.custom(
                            size: 14.sp,
                            weight: FontWeight.w600,
                            color: const Color(0xFF0074BE),
                          ),
                        ),
                    ],
                  ),
                ),

                
                Text(
                  "\$1,850.00",
                  style: AppFonts.custom(
                    size: 16.sp,
                    weight: FontWeight.w600,
                    color: const Color(0xFF22C55E),
                  ),
                ),

                SizedBox(width: 6.w),

                // Arrow
                Icon(
                  isExpanded
                      ? Icons.keyboard_arrow_up
                      : Icons.keyboard_arrow_down,
                ),
              ],
            ),
          ),

          if (isExpanded) ...[
            SizedBox(height: 12.h),

            

            

           
            Row(
              children: [
                const Icon(Icons.access_time,
                    size: 14, color: Color(0xFF3E4955)),
                SizedBox(width: 6.w),
                Text(
                  "Night Shift • Full-time",
                  style: AppFonts.body(color: const Color(0xFF3E4955)),
                ),
                const Spacer(),
                Text(
                  "12 March, 2026",
                  style: AppFonts.body(color: const Color(0xFF3E4955)),
                ),
              ],
            ),

            SizedBox(height: 12.h),

         
            Container(
              padding: EdgeInsets.all(16.w),
              decoration: BoxDecoration(
                color: const Color(0xFFD9E4F2),
                borderRadius: BorderRadius.circular(16.r),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Text(
                    "Pay Rate breakdown",
                    style: AppFonts.custom(
                      size: 14.sp,
                      weight: FontWeight.w600,
                      color: const Color(0xFF1D4ED8),
                    ),
                  ),

                  SizedBox(height: 10.h),

                  Row(
                    children: [
                      Text("You worked", style: AppFonts.body()),
                      const Spacer(),
                      Text("10 hrs", style: AppFonts.body()),
                    ],
                  ),

                  SizedBox(height: 6.h),

                  Row(
                    children: [
                      Text("Shift rate per hour", style: AppFonts.body()),
                      const Spacer(),
                      Text("\$48.00/hr", style: AppFonts.body()),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }
}