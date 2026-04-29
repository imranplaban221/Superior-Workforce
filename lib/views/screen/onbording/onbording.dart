import 'package:flutter/material.dart';
import 'package:flutter_extension/controller/onboarding_controller.dart';
import 'package:flutter_extension/views/base/custom_onbording_design.dart';
import 'package:get/get.dart';

class OnboardingScreen extends GetView<OnboardingController> {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Obx(() {
        final int idx = controller.currentIndex.value;
        final bool isLastPage = controller.isLastPage;
        return PageView.builder(
          controller: controller.pageController,
          itemCount: OnboardingController.pages.length,
          onPageChanged: controller.onPageChanged,
          itemBuilder: (BuildContext context, int index) {
            final OnboardingData page = OnboardingController.pages[index];
            return CustomOnbordingDesign(
              page: page,
              currentIndex: idx,
              pageCount: OnboardingController.pages.length,
              buttonText: isLastPage ? 'GET STARTED' : 'Next',
              onBack: controller.goBack,
              onNext: controller.goNext,
            );
          },
        );
      }),
    );
  }
}
