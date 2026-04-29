import 'package:flutter/material.dart';
import 'package:flutter_extension/helper/route_helper.dart';
import 'package:flutter_extension/views/base/custom_onbording_design.dart';
import 'package:get/get.dart';

class OnboardingController extends GetxController {
  late final PageController pageController;
  final RxInt currentIndex = 0.obs;

  static const List<OnboardingData> pages = <OnboardingData>[
    OnboardingData(
      imagePath: 'assets/images/onboarding1.svg',
      title: 'Find Jobs Near You',
      description:
          'Search using your zip code to discover nearby shifts with your preferred radius. Get jobs that match your location instantly.',
      curveStyle: CurveStyle.defaultCurve,
      showBack: false,
    ),
    OnboardingData(
      imagePath: 'assets/images/onboarding2.svg',
      title: 'Upload Credentials Securely',
      description:
          'Your certifications and credentials are protected with bank-level encryption. Upload once and apply everywhere with confidence.',
      curveStyle: CurveStyle.secondCurve,
      showBack: true,
    ),
    OnboardingData(
      imagePath: 'assets/images/onboarding3.svg',
      title: 'Clear Pay. Trusted Work.',
      description:
          'View flat shifts upfront, receive payment securely, and work confidently with verified facilities. Upload licenses to work out-of-state jobs easily.',
      curveStyle: CurveStyle.defaultCurve,
      showBack: true,
    ),
  ];

  @override
  void onInit() {
    super.onInit();
    pageController = PageController();
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }

  void onPageChanged(int index) => currentIndex.value = index;

  bool get isLastPage => currentIndex.value == pages.length - 1;

  void goBack() {
    if (currentIndex.value > 0) {
      pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void goNext() {
    if (isLastPage) {
      Get.offNamed(AppRoutes.roleScreen);
    } else {
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }
}
