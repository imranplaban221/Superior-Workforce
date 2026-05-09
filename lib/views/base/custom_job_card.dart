import 'package:flutter/material.dart';
import 'package:flutter_extension/helper/route_helper.dart';
import 'package:flutter_extension/util/app_colors.dart';
import 'package:flutter_extension/util/app_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart' show SvgPicture;
import 'package:get/get.dart';

class JobCard extends StatelessWidget {
  final String title;
  final String role;
  final String time;
  final String location;
  final String pay;
  final String shift;
  final String jobType;
  final String date;
  final double rating;
  

  const JobCard({
    super.key,
    required this.title,
    required this.role,
    required this.time,
    required this.location,
    required this.pay,
    required this.shift,
    required this.jobType,
    required this.date,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: const [
          BoxShadow(
            color: Color(0x14000000),
            offset: Offset(0, 3),
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
    child: SvgPicture.asset(
      'assets/images/luffy.svg',
      fit: BoxFit.cover,
    ),
  ),
),

              SizedBox(width: 10.w),

              
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: AppFonts.custom(size: 16, weight: FontWeight.w600)),
                    Row(
                      children: [
                        Text(role, style: AppFonts.body(color: const Color(0xFF0074BE))),
                        SizedBox(width: 10.w),
                        Text(time, style: AppFonts.body(color: const Color(0xFF5E6670))),
                      ],
                    ),
                  ],
                ),
              ),

          
            Container(
  padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
  decoration: BoxDecoration(
    color: const Color(0xFFFEFCE8), 
    borderRadius: BorderRadius.circular(20.r), 
  ),
  child: Row(
    mainAxisSize: MainAxisSize.min, 
    children: [
      SvgPicture.asset(
        'assets/images/star.svg',
        color: const Color(0xFFF59E0B), 
        width: 14,
      ),

      SizedBox(width: 4.w),

      Text(
        rating.toString(),
        style: AppFonts.body(
          color: const Color(0xFFA65F00), // darker text
        ),
      ),
    ],
  ),
),
            ],
          ),

          SizedBox(height: 10.h),

          
          Row(
            children: [
              SvgPicture.asset('assets/images/location.svg', height: 14, width: 14, color: const Color(0xFF3E4955)),
              SizedBox(width: 6.w),
              Text(location, style: AppFonts.body(color: const Color(0xFF3E4955))),
            ],
          ),

          SizedBox(height: 6.h),

          
          Row(
            children: [
              Container(),
              SvgPicture.asset('assets/images/doller.svg', height: 16, width: 16, color: Colors.green),
              SizedBox(width: 6.w),
              Text(pay, style: AppFonts.custom(size: 14, weight: FontWeight.w600, color: Colors.green)),
            ],
          ),

          SizedBox(height: 6.h),

          
          Row(
            children: [
              const Icon(Icons.access_time, size: 14, color:  Color(0xFF3E4955)),
              SizedBox(width: 6.w),
              Text("$shift • $jobType", style: AppFonts.body(color: const Color(0xFF3E4955))),
              const Spacer(),
              Text(date, style: AppFonts.body(color: const Color(0xFF3E4955))),
            ],
          ),

         SizedBox(height: 10.h),

Divider(
  color: const Color(0xFFE5E7EB), 
  thickness: 1,
),

SizedBox(height: 10.h),

          
         Row(
  children: [

    Expanded(
      child: SizedBox(
        height: 44,
        child: OutlinedButton(
          style: OutlinedButton.styleFrom(
            padding: EdgeInsets.zero,
            side: BorderSide(
              color: AppColors.primaryColor,
              width: 1,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          onPressed:  () => Get.toNamed(
                            AppRoutes.jobDetails,
                          ),
          child: Text(
            "View Details",
            style: AppFonts.body(color: AppColors.primaryColor),
          ),
        ),
      ),
    ),

    SizedBox(width: 12),

  
    Expanded(
      child: Container(
        height: 44,
        decoration: BoxDecoration(
          gradient: AppColors.buttonColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.zero,
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          onPressed: () {},
          child: Text(
            "Book Now",
            style: AppFonts.body(color: Colors.white),
          ),
        ),
      ),
    ),

    SizedBox(width: 12),

    
    SizedBox(
      width: 40,
      height: 40,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.zero,
          backgroundColor: const Color(0xFFF5EDE7),
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        onPressed: () {},
        child: const Icon(
          Icons.close,
          size: 18,
          color: Color(0xFFE53935),
        ),
      ),
    ),
  ],
),
        ],
      ),
    );
  }
}


class BookedJobCard extends StatelessWidget {
  const BookedJobCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: const [
          BoxShadow(
            color: Color(0x14000000),
            offset: Offset(0, 3),
            blurRadius: 8,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [


          Padding(
                  padding: EdgeInsets.all(12.w),

            child: Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(11.43),
                    border: Border.all(color: Colors.grey, width: 0.71),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(11.43),
                    child: SvgPicture.asset(
                      'assets/images/luffy.svg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
            
                SizedBox(width: 10.w),
            
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("City Hospital",
                          style: AppFonts.custom(size: 16, weight: FontWeight.w600)),
            
                      Row(
                        children: [
                          Text("CNA",
                              style: AppFonts.body(color: const Color(0xFF0074BE)),
                              
                              ),
                          SizedBox(width: 6.w),
                          Text("Upcoming",
                              style: AppFonts.body(color: const Color(0xFF6B7280))),
                        ],
                      ),
                    ],
                  ),
                ),
            
            
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFEFCE8),
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SvgPicture.asset(
                        'assets/images/star.svg',
                        color: const Color(0xFFF59E0B),
                        width: 14,
                      ),
                      SizedBox(width: 4.w),
                      Text("4.8",
                          style: AppFonts.body(color: const Color(0xFFA65F00))),
                    ],
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 10.h),

      
   Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [


    Padding(
      padding: const EdgeInsets.only(left: 12),
      child: Row(
        children: [
          SvgPicture.asset(
            'assets/images/location.svg',
            height: 14,
            width: 14,
            color: const Color(0xFF3E4955),
          ),
          SizedBox(width: 6.w),
          Text(
            "Los Angeles, CA",
            style: AppFonts.body(color: const Color(0xFF3E4955)),
          ),
        ],
      ),
    ),

    
    Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
      decoration: BoxDecoration(
        color: const Color(0xFFE6F4EA),
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(8),topLeft: Radius.circular(8)),
      ),
      child: Text(
        "Booked",
        style: AppFonts.body(color: Colors.green),
      ),
    ),
  ],
),

          SizedBox(height: 6.h),

       
          Padding(
            padding: const EdgeInsets.only(left: 12),
            child: Row(
              children: [
                SvgPicture.asset('assets/images/doller.svg',
                    height: 16, width: 16, color: Colors.green),
                SizedBox(width: 6.w),
                Text("\$22 / hour",
                    style: AppFonts.custom(
                        size: 14,
                        
                        weight: FontWeight.w600,
                        color: Colors.green)),
              ],
            ),
          ),

          SizedBox(height: 6.h),

          Padding(
            padding: const EdgeInsets.only(left: 12, right: 12),
            child: Row(
              children: [
                const Icon(Icons.access_time,
                    size: 14, color: Color(0xFF3E4955)),
                SizedBox(width: 6.w),
                Text("Night Shift • Full-time",
                    style: AppFonts.body(color: const Color(0xFF3E4955))),
                const Spacer(),
                Text("12 March, 2026",
                    style: AppFonts.body(color: const Color(0xFF3E4955))),
              ],
            ),
          ),

          SizedBox(height: 10.h),

          Padding(
            padding: const EdgeInsets.only(left: 12, right: 12, ),
            child: Divider(
              color: const Color(0xFFE5E7EB), 
              thickness: 1,
            ),
          ),

          SizedBox(height: 10.h),

          Row(
            children: [

         
              Padding(
                padding: const EdgeInsets.only(left: 12, right: 12, bottom: 12),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      'assets/images/time.svg',
                      color: const Color(0xFF0074BE),
                      height: 18,
                      width: 18,
                    ),
                    SizedBox(width: 6.w),
                    Text(
                      "8h remaining",
                      style: AppFonts.body(color: const Color(0xFF0074BE)),
                    ),
                  ],
                ),
              ),

              const Spacer(),

              Padding(
                padding: const EdgeInsets.only( bottom: 12),
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration:  BoxDecoration(
                    color: Color(0xFFE5F1FF),
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(13),
                  ),
                  child: SvgPicture.asset(
                    'assets/images/message.svg',
                    color: Color(0xFF0074BE),
                    width: 20,
                    height: 20,
                  ),
                ),
              ),

              SizedBox(width: 10.w),

              Padding(
                padding: const EdgeInsets.only( bottom: 12),
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration:  BoxDecoration(
                    color: Color(0xFFE5F1FF),
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(13),
                  ),
                  child: SvgPicture.asset(
                    'assets/images/send.svg',
                    color: Color(0xFF0074BE),
                    width: 20,
                    height: 20,
                  ),
                ),
              ),

              SizedBox(width: 10.w),

             Material(
  color: Colors.transparent,
  child: InkWell(
    borderRadius: BorderRadius.circular(12),
    onTap:   () => Get.toNamed(
                            AppRoutes.jobDetails,
                          ),
    child: Padding(
      padding: const EdgeInsets.only(right: 12, bottom: 12),
      child: Container(
        height: 40,
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        decoration: BoxDecoration(
          gradient: AppColors.buttonColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Text(
            "View Details",
            style: AppFonts.body(color: Colors.white),
          ),
        ),
      ),
    ),
  ),
)
            ],
          ),
        ],
      ),
    );
  }
}



class OngoingJobCard extends StatelessWidget {
  const OngoingJobCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: const [
          BoxShadow(
            color: Color(0x14000000),
            offset: Offset(0, 3),
            blurRadius: 8,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [


          Padding(
                  padding: EdgeInsets.all(12.w),

            child: Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(11.43),
                    border: Border.all(color: Colors.grey, width: 0.71),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(11.43),
                    child: SvgPicture.asset(
                      'assets/images/luffy.svg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
            
                SizedBox(width: 10.w),
            
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("City Hospital",
                          style: AppFonts.custom(size: 16, weight: FontWeight.w600)),
            
                      Row(
                        children: [
                          Text("CNA",
                              style: AppFonts.body(color: const Color(0xFF0074BE)),
                              
                              ),
                          SizedBox(width: 6.w),
                          Text("Ongoing",
                              style: AppFonts.body(color: const Color(0xFF6B7280))),
                        ],
                      ),
                    ],
                  ),
                ),
            
            
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFEFCE8),
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SvgPicture.asset(
                        'assets/images/star.svg',
                        color: const Color(0xFFF59E0B),
                        width: 14,
                      ),
                      SizedBox(width: 4.w),
                      Text("4.8",
                          style: AppFonts.body(color: const Color(0xFFA65F00))),
                    ],
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 10.h),

      
   Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [


    Padding(
      padding: const EdgeInsets.only(left: 12),
      child: Row(
        children: [
          SvgPicture.asset(
            'assets/images/location.svg',
            height: 14,
            width: 14,
            color: const Color(0xFF3E4955),
          ),
          SizedBox(width: 6.w),
          Text(
            "Los Angeles, CA",
            style: AppFonts.body(color: const Color(0xFF3E4955)),
          ),
        ],
      ),
    ),

    
    // Container(
    //   padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
    //   decoration: BoxDecoration(
    //     color: const Color(0xFFE6F4EA),
    //     borderRadius: BorderRadius.only(bottomLeft: Radius.circular(8),topLeft: Radius.circular(8)),
    //   ),
    //   child: Text(
    //     "Booked",
    //     style: AppFonts.body(color: Colors.green),
    //   ),
    // ),
  ],
),

          SizedBox(height: 6.h),

       
          Padding(
            padding: const EdgeInsets.only(left: 12),
            child: Row(
              children: [
                SvgPicture.asset('assets/images/doller.svg',
                    height: 16, width: 16, color: Colors.green),
                SizedBox(width: 6.w),
                Text("\$22 / hour",
                    style: AppFonts.custom(
                        size: 14,
                        
                        weight: FontWeight.w600,
                        color: Colors.green)),
              ],
            ),
          ),

          SizedBox(height: 6.h),

          Padding(
            padding: const EdgeInsets.only(left: 12, right: 12),
            child: Row(
              children: [
                const Icon(Icons.access_time,
                    size: 14, color: Color(0xFF3E4955)),
                SizedBox(width: 6.w),
                Text("Night Shift • Full-time",
                    style: AppFonts.body(color: const Color(0xFF3E4955))),
                const Spacer(),
                Text("12 March, 2026",
                    style: AppFonts.body(color: const Color(0xFF3E4955))),
              ],
            ),
          ),

          SizedBox(height: 10.h),

          Padding(
            padding: const EdgeInsets.only(left: 12, right: 12, ),
            child: Divider(
              color: const Color(0xFFE5E7EB), 
              thickness: 1,
            ),
          ),

          SizedBox(height: 10.h),

          Row(
            children: [

         
              Padding(
                padding: const EdgeInsets.only(left: 12, right: 12, bottom: 12),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      'assets/images/time.svg',
                      color: const Color(0xFF0074BE),
                      height: 18,
                      width: 18,
                    ),
                    SizedBox(width: 6.w),
                    Text(
                      "8h remaining",
                      style: AppFonts.body(color: const Color(0xFF0074BE)),
                    ),
                  ],
                ),
              ),

              const Spacer(),

              Padding(
                padding: const EdgeInsets.only( bottom: 12),
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration:  BoxDecoration(
                    color: Color(0xFFE5F1FF),
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(13),
                  ),
                  child: SvgPicture.asset(
                    'assets/images/message.svg',
                    color: Color(0xFF0074BE),
                    width: 20,
                    height: 20,
                  ),
                ),
              ),

              SizedBox(width: 10.w),

              Padding(
                padding: const EdgeInsets.only( bottom: 12),
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration:  BoxDecoration(
                    color: Color(0xFFE5F1FF),
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(13),
                  ),
                  child: SvgPicture.asset(
                    'assets/images/send.svg',
                    color: Color(0xFF0074BE),
                    width: 20,
                    height: 20,
                  ),
                ),
              ),

              SizedBox(width: 10.w),

             Material(
  color: Colors.transparent,
  child: InkWell(
    borderRadius: BorderRadius.circular(12),
    onTap:   () => Get.toNamed(
                            AppRoutes.jobDetails,
                          ),
    child: Padding(
      padding: const EdgeInsets.only(right: 12, bottom: 12),
      child: Container(
        height: 40,
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        decoration: BoxDecoration(
          gradient: AppColors.buttonColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Text(
            "View Details",
            style: AppFonts.body(color: Colors.white),
          ),
        ),
      ),
    ),
  ),
)
            ],
          ),
        ],
      ),
    );
  }
}


class UpcomingJobCard extends StatelessWidget {
  const UpcomingJobCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: const [
          BoxShadow(
            color: Color(0x14000000),
            offset: Offset(0, 3),
            blurRadius: 8,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [


          Padding(
                  padding: EdgeInsets.all(12.w),

            child: Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(11.43),
                    border: Border.all(color: Colors.grey, width: 0.71),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(11.43),
                    child: SvgPicture.asset(
                      'assets/images/luffy.svg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
            
                SizedBox(width: 10.w),
            
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("City Hospital",
                          style: AppFonts.custom(size: 16, weight: FontWeight.w600)),
            
                      Row(
                        children: [
                          Text("CNA",
                              style: AppFonts.body(color: const Color(0xFF0074BE)),
                              
                              ),
                          SizedBox(width: 6.w),
                          Text("Upcoming",
                              style: AppFonts.body(color: const Color(0xFF6B7280))),
                        ],
                      ),
                    ],
                  ),
                ),
            
            
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFEFCE8),
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SvgPicture.asset(
                        'assets/images/star.svg',
                        color: const Color(0xFFF59E0B),
                        width: 14,
                      ),
                      SizedBox(width: 4.w),
                      Text("4.8",
                          style: AppFonts.body(color: const Color(0xFFA65F00))),
                    ],
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 10.h),

      
   Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [


    Padding(
      padding: const EdgeInsets.only(left: 12),
      child: Row(
        children: [
          SvgPicture.asset(
            'assets/images/location.svg',
            height: 14,
            width: 14,
            color: const Color(0xFF3E4955),
          ),
          SizedBox(width: 6.w),
          Text(
            "Los Angeles, CA",
            style: AppFonts.body(color: const Color(0xFF3E4955)),
          ),
        ],
      ),
    ),

    
    
  ],
),

          SizedBox(height: 6.h),

       
          Padding(
            padding: const EdgeInsets.only(left: 12),
            child: Row(
              children: [
                SvgPicture.asset('assets/images/doller.svg',
                    height: 16, width: 16, color: Colors.green),
                SizedBox(width: 6.w),
                Text("\$22 / hour",
                    style: AppFonts.custom(
                        size: 14,
                        
                        weight: FontWeight.w600,
                        color: Colors.green)),
              ],
            ),
          ),

          SizedBox(height: 6.h),

          Padding(
            padding: const EdgeInsets.only(left: 12, right: 12),
            child: Row(
              children: [
                const Icon(Icons.access_time,
                    size: 14, color: Color(0xFF3E4955)),
                SizedBox(width: 6.w),
                Text("Night Shift • Full-time",
                    style: AppFonts.body(color: const Color(0xFF3E4955))),
                const Spacer(),
                Text("12 March, 2026",
                    style: AppFonts.body(color: const Color(0xFF3E4955))),
              ],
            ),
          ),

          SizedBox(height: 10.h),

          Padding(
            padding: const EdgeInsets.only(left: 12, right: 12, ),
            child: Divider(
              color: const Color(0xFFE5E7EB), 
              thickness: 1,
            ),
          ),

          SizedBox(height: 10.h),

          Row(
            children: [

         
              Padding(
                padding: const EdgeInsets.only(left: 12, right: 12, bottom: 12),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      'assets/images/time.svg',
                      color: const Color(0xFF0074BE),
                      height: 18,
                      width: 18,
                    ),
                    SizedBox(width: 6.w),
                    Text(
                      "8h remaining",
                      style: AppFonts.body(color: const Color(0xFF0074BE)),
                    ),
                  ],
                ),
              ),

              const Spacer(),

              Padding(
                padding: const EdgeInsets.only( bottom: 12),
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration:  BoxDecoration(
                    color: Color(0xFFE5F1FF),
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(13),
                  ),
                  child: SvgPicture.asset(
                    'assets/images/message.svg',
                    color: Color(0xFF0074BE),
                    width: 20,
                    height: 20,
                  ),
                ),
              ),

              SizedBox(width: 10.w),

              Padding(
                padding: const EdgeInsets.only( bottom: 12),
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration:  BoxDecoration(
                    color: Color(0xFFE5F1FF),
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(13),
                  ),
                  child: SvgPicture.asset(
                    'assets/images/send.svg',
                    color: Color(0xFF0074BE),
                    width: 20,
                    height: 20,
                  ),
                ),
              ),

              SizedBox(width: 10.w),

             Material(
  color: Colors.transparent,
  child: InkWell(
    borderRadius: BorderRadius.circular(12),
    onTap:   () => Get.toNamed(
                            AppRoutes.jobDetails,
                          ),
    child: Padding(
      padding: const EdgeInsets.only(right: 12, bottom: 12),
      child: Container(
        height: 40,
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        decoration: BoxDecoration(
          gradient: AppColors.buttonColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Text(
            "View Details",
            style: AppFonts.body(color: Colors.white),
          ),
        ),
      ),
    ),
  ),
)
            ],
          ),
        ],
      ),
    );
  }
}



class CompletedJobCard extends StatelessWidget {
  const CompletedJobCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: const [
          BoxShadow(
            color: Color(0x14000000),
            offset: Offset(0, 3),
            blurRadius: 8,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

         
          Padding(
            padding: EdgeInsets.all(12.w),
            child: Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(11.43),
                    border: Border.all(color: Colors.grey, width: 0.71),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(11.43),
                    child: SvgPicture.asset(
                      'assets/images/luffy.svg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                SizedBox(width: 10.w),

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("City Hospital",
                          style: AppFonts.custom(size: 16, weight: FontWeight.w600)),

                      Row(
                        children: [
                          Text("CNA",
                              style: AppFonts.body(color: const Color(0xFF0074BE))),
                          SizedBox(width: 6.w),
                          Text("Completed",
                              style: AppFonts.body(color: const Color(0xFF6B7280))),
                        ],
                      ),
                    ],
                  ),
                ),

                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFEFCE8),
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SvgPicture.asset(
                        'assets/images/star.svg',
                        color: const Color(0xFFF59E0B),
                        width: 14,
                      ),
                      SizedBox(width: 4.w),
                      Text("4.8",
                          style: AppFonts.body(color: const Color(0xFFA65F00))),
                    ],
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 10.h),

          
          Padding(
            padding: const EdgeInsets.only(left: 12),
            child: Row(
              children: [
                SvgPicture.asset(
                  'assets/images/location.svg',
                  height: 14,
                  width: 14,
                  color: const Color(0xFF3E4955),
                ),
                SizedBox(width: 6.w),
                Text(
                  "Los Angeles, CA",
                  style: AppFonts.body(color: const Color(0xFF3E4955)),
                ),
              ],
            ),
          ),

          SizedBox(height: 6.h),

         
          Padding(
            padding: const EdgeInsets.only(left: 12),
            child: Row(
              children: [
                SvgPicture.asset(
                  'assets/images/doller.svg',
                  height: 16,
                  width: 16,
                  color: Colors.green,
                ),
                SizedBox(width: 6.w),
                Text("\$22 / hour",
                    style: AppFonts.custom(
                        size: 14,
                        weight: FontWeight.w600,
                        color: Colors.green)),
              ],
            ),
          ),

          SizedBox(height: 6.h),

         
          Padding(
            padding: const EdgeInsets.only(left: 12, right: 12),
            child: Row(
              children: [
                const Icon(Icons.access_time,
                    size: 14, color: Color(0xFF3E4955)),
                SizedBox(width: 6.w),
                Text("Night Shift • Full-time",
                    style: AppFonts.body(color: const Color(0xFF3E4955))),
                const Spacer(),
                Text("12 March, 2026",
                    style: AppFonts.body(color: const Color(0xFF3E4955))),
              ],
            ),
          ),

          SizedBox(height: 10.h),

          
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Divider(
              color: const Color(0xFFE5E7EB),
              thickness: 1,
            ),
          ),

          SizedBox(height: 10.h),

          Padding(
            padding: const EdgeInsets.only(left: 12, right: 12, bottom: 12),
            child: Row(
              children: [

               
                Row(
                  children: [
                    SvgPicture.asset(
                      'assets/images/time.svg',
                      color: const Color(0xFF0074BE),
                      height: 18,
                      width: 18,
                    ),
                    SizedBox(width: 6.w),
                    Text(
                      "2d ago",
                      style: AppFonts.body(color: const Color(0xFF0074BE)),
                    ),
                  ],
                ),

                const Spacer(),

                
                SizedBox(
                  height: 40,
                  width: 130,
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(
                        color: AppColors.primaryColor,
                        width: 1,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () => Get.toNamed(AppRoutes.jobDetails),
                    child: Text(
                      "View Details",
                       overflow: TextOverflow.ellipsis, 
  maxLines: 1,
  style: AppFonts.custom(
    color: AppColors.primaryColor,
    size: 12,
                      ),
                    ),
                  ),
                ),

                SizedBox(width: 10.w),

             
                Container(
                  height: 40,
                  padding: EdgeInsets.symmetric(horizontal: 14.w),
                  decoration: BoxDecoration(
                    gradient: AppColors.buttonColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: InkWell(
                    onTap: () {},
                    child: Center(
                      child: Text(
                        "Remove",
                        style: AppFonts.body(color: Colors.white),
                      ),
                    ),
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








