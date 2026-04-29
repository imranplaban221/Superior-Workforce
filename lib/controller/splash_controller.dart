import 'dart:async';

import 'package:flutter_extension/helper/route_helper.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    Future.delayed(const Duration(seconds: 2), () {
      if (!isClosed) {
        jumpNextScreen();
      }
    });
  }

  void jumpNextScreen() {
    Get.offNamed(AppRoutes.onboardingScreen);
  }
}