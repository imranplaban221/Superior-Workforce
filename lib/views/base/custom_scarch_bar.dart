import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity, 
      height: 50,
      padding: const EdgeInsets.fromLTRB(20, 12, 20, 12),
      decoration: BoxDecoration(
        color: Colors.white, 
        borderRadius: BorderRadius.circular(16),

        
        boxShadow: const [
          BoxShadow(
            color: Color(0x14000000), 
            offset: Offset(0, 3),
            blurRadius: 8,
          ),
        ],
      ),

      child: Row(
        children: [
         
          SvgPicture.asset('assets/images/search.svg',
                                      width: 18.w,
                                      height: 18.h,
                                      fit: BoxFit.contain,
                                    ),

          const SizedBox(width: 12), 

          
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: "Enter ZIP code for search job",
                hintStyle: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xFF9CA3AF),
                ),
                border: InputBorder.none,
                isDense: true, 
              ),
            ),
          ),
        ],
      ),
    );
  }
}