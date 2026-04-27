import 'package:flutter_extension/views/screen/common/role_screen.dart';
import 'package:flutter_extension/views/screen/home/home_screen.dart';
import 'package:flutter_extension/views/screen/onbording/onbording.dart';
import 'package:get/get.dart';

import '../views/screen/splash/splash_screen.dart';

class AppRoutes{

  static String splashScreen="/splash_screen";
  static String onboardingScreen="/onboarding_screen";
  static String homeScreen="/home_screen";
  static String roleScreen="/role_screen";

 static List<GetPage> page=[
    GetPage(name:splashScreen, page: ()=>const SplashScreen()),
    GetPage(name:onboardingScreen, page: ()=>const OnboardingScreen()),

     GetPage(name:homeScreen, page: ()=>const HomeScreen()),
     GetPage(name:roleScreen, page: ()=>const RoleScreen()),
  

  ];

  



}