import 'package:flutter/material.dart';
import 'package:flutter_extension/util/app_colors.dart';
import 'package:flutter_extension/util/app_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class ReviewCard extends StatefulWidget {
  const ReviewCard({super.key});

  @override
  State<ReviewCard> createState() => _ReviewCardState();
}

class _ReviewCardState extends State<ReviewCard> {
  bool isExpanded = false;
  int rating = 4;
  

  final TextEditingController reviewController = TextEditingController();

  List<Map<String, dynamic>> reviews = [
    {"name": "Mr. John", "review": "Great Experience", "rating": 5},
    {"name": "Mr. John", "review": "Great Experience", "rating": 5},
  ];

  bool hasUserReviewed = false;

  

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
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Color(0xFFE5F1FF),
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: SvgPicture.asset(
                    'assets/images/review.svg',
                    color: Color(0xFF0074BE)),
              ),
              SizedBox(width: 10.w),
              Text("Review",
                  style: AppFonts.custom(
                      size: 20, weight: FontWeight.w600)),
              SizedBox(width: 8.w),
              Container(
                padding: EdgeInsets.symmetric(
                    horizontal: 10.w, vertical: 4.h),
                decoration: BoxDecoration(
                  color: const Color(0xFFFEFCE8),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      'assets/images/star.svg',
                      color: Color(0xFFF59E0B),
                      height: 14,
                      width: 14,
                    ),
                    SizedBox(width: 4.w),
                    Text("4.8",
                        style: AppFonts.body(
                            color: const Color(0xFFA65F00))),
                  ],
                ),
              ),
              const Spacer(),
              Text("2 Reviews",
                  style: AppFonts.body(color: Colors.grey)),
              IconButton(
                onPressed: () {
                  setState(() {
                    isExpanded = !isExpanded;

                      if (!isExpanded) {
      FocusScope.of(context).unfocus();
    }
                    
                  });
                },
                icon: Icon(
                  isExpanded
                      ? Icons.keyboard_arrow_up
                      : Icons.keyboard_arrow_down,
                ),
              )
            ],
          ),

          SizedBox(height: 10.h),

          // if (!isExpanded )
          //   SizedBox(
          //     width: double.infinity,
          //     height: 44,
          //     child: ElevatedButton(
          //       style: ElevatedButton.styleFrom(
          //         backgroundColor: Colors.transparent,
          //         shadowColor: Colors.transparent,
          //         shape: RoundedRectangleBorder(
          //           borderRadius: BorderRadius.circular(12),
          //         ),
          //       ),
          //       onPressed: () {
          //         setState(() {
          //           isExpanded = true;
          //         });
          //       },
          //       child: Padding(
          //         padding: const EdgeInsets.only(
          //             top: 12, bottom: 12, right: 16, left: 16),
          //         child: Ink(
          //           decoration: BoxDecoration(
          //             gradient: AppColors.buttonColor,
          //             borderRadius: BorderRadius.circular(8),
          //           ),
          //           child: Container(
          //             alignment: Alignment.center,
          //             child: Text(
          //               "Give Your Review",
          //               style: AppFonts.body(color: Colors.white),
          //             ),
          //           ),
          //         ),
          //       ),
          //     ),
          //   ),

          if (isExpanded) ...[
            const Divider(),
            SizedBox(height: 10.h),

            ...reviews.map((review) => Padding(
                  padding: EdgeInsets.only(bottom: 10.h),
                  child: _reviewItem(
                    name: review["name"],
                    review: review["review"],
                    rating: review["rating"],
                  ),
                )),

            SizedBox(height: 12.h),

            if (!hasUserReviewed)
              Container(
                padding: EdgeInsets.all(12.w),
                decoration: BoxDecoration(
                  color: const Color(0xFFE5F1FF),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Your Review",
                        style: AppFonts.custom(
                            size: 14, weight: FontWeight.w400)),
                    SizedBox(height: 8.h),

                    Container(
                      height: 78,
                      width: 326,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: TextFormField(
                        controller: reviewController,
                        maxLines: null,
                        expands: true,
                        decoration: const InputDecoration(
                          hintText: "Write here",
                          border: InputBorder.none,
                        ),
                        style:
                            const TextStyle(color: Colors.black),
                      ),
                    ),

                    SizedBox(height: 12.h),

                    Text("Rating",
                        style: AppFonts.custom(
                            size: 14, weight: FontWeight.w400)),
                    SizedBox(height: 8.h),

                    Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 12.w, vertical: 10.h),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: List.generate(5, (index) {
                                return GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      rating = index + 1;
                                    });
                                  },
                                  child: SvgPicture.asset(
                                    'assets/images/star.svg',
                                    width: 21,
                                    height: 20,
                                    colorFilter: ColorFilter.mode(
                                      index < rating
                                          ? const Color(0xFFF59E0B)
                                          : const Color(0xFFD1D5DB),
                                      BlendMode.srcIn,
                                    ),
                                  ),
                                );
                              }),
                            ),
                          ),
                          const Spacer(),
                          Text(
                            rating.toStringAsFixed(2),
                            style: AppFonts.body(),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 12.h),

                    SizedBox(
                      width: double.infinity,
                      height: 44,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          shadowColor: Colors.transparent,
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(12),
                          ),
                        ),
                        onPressed: () {
                          if (reviewController.text
                              .trim()
                              .isEmpty) {
                            Get.snackbar(
                                "Error", "Please write a review");
                            return;
                          }

                          setState(() {
                            reviews.add({
                              "name": "You",
                              "review": reviewController.text.trim(),
                              "rating": rating,
                            });

                            hasUserReviewed = true;
                            reviewController.clear();
                          });
                        },
                        child: Ink(
                          decoration: BoxDecoration(
                            gradient: AppColors.buttonColor,
                            borderRadius:
                                BorderRadius.circular(12),
                          ),
                          child: Container(
                            alignment: Alignment.center,
                            child: Text(
                              "Give Review",
                              style: AppFonts.body(
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
          ]
        ],
      ),
    );
  }

  Widget _reviewItem({
    required String name,
    required String review,
    required int rating,
  }) {
    return Container(
      padding: EdgeInsets.all(10.w),
      decoration: BoxDecoration(
        color: const Color(0xFFF9FAFB),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 16,
            backgroundColor: Colors.transparent,
            backgroundImage:
                AssetImage('assets/images/cat.jpg'),
          ),
          SizedBox(width: 10.w),
          Expanded(
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [
                Text(name,
                    style: AppFonts.custom(
                        size: 14,
                        weight: FontWeight.w600)),
                Text(review,
                    style:
                        AppFonts.body(color: Colors.grey)),
              ],
            ),
          ),
          Row(
            children: List.generate(
              5,
              (index) => SvgPicture.asset(
                'assets/images/star.svg',
                height: 16,
                width: 16,
                colorFilter: ColorFilter.mode(
                  index < rating
                      ? const Color(0xFFF59E0B)
                      : const Color(0xFFD1D5DB),
                  BlendMode.srcIn,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}