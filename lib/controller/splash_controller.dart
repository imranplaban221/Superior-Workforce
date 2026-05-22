import 'package:flutter_extension/helper/route_helper.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashController extends GetxController {

  @override
  void onInit() {

    super.onInit();

    Future.delayed(
      const Duration(seconds: 2),
      () {

        if (!isClosed) {
          jumpNextScreen();
        }
      },
    );
  }

  Future<void> jumpNextScreen() async {

    final SharedPreferences prefs =
        await SharedPreferences.getInstance();

    final bool hasSeenOnboarding =
        prefs.getBool(
          'onboarding_seen',
        ) ??
        false;

    if (hasSeenOnboarding) {

      Get.offNamed(
        AppRoutes.roleScreen,
      );

    } else {

      Get.offNamed(
        AppRoutes.onboardingScreen,
      );
    }
  }
}