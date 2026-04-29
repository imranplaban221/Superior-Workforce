import 'package:flutter_extension/controller/onboarding_controller.dart';
import 'package:flutter_extension/controller/otp_controller.dart';
import 'package:flutter_extension/controller/role_controller.dart';
import 'package:flutter_extension/views/screen/common/role_screen.dart';
import 'package:flutter_extension/views/screen/common/auth/complete_sign_up.dart';
import 'package:flutter_extension/views/screen/common/auth/confirmation_screen.dart';
import 'package:flutter_extension/views/screen/common/auth/forget_password_screen.dart';
import 'package:flutter_extension/views/screen/common/auth/log_in_screen.dart';
import 'package:flutter_extension/views/screen/common/auth/new_password.dart';
import 'package:flutter_extension/views/screen/common/auth/otp_screen.dart';
import 'package:flutter_extension/views/screen/common/auth/sign_up_screen.dart';
import 'package:flutter_extension/views/screen/home/home_screen.dart';
import 'package:flutter_extension/views/screen/job_seeker/profile/personal_info_screen.dart';
import 'package:flutter_extension/views/screen/onbording/onbording.dart';
import 'package:get/get.dart';

import '../views/screen/splash/splash_screen.dart';

class AppRoutes{

  static String splashScreen="/splash_screen";
  static String onboardingScreen="/onboarding_screen";
  static String homeScreen="/home_screen";
  static String roleScreen="/role_screen";
  static String loginScreen="/login_screen";
  static String signUpScreen="/sign_up_screen";
  static String forgetPasswordScreen="/forget_password_screen";
  static String otpScreen="/otp_screen";
  static String newPasswordScreen="/new_password_screen";
  static String confirmationScreen="/confirmation_screen";
  static String completeSignUpScreen="/complete_sign_up_screen";
  static String personalInfoScreen="/personal_info_screen";

  static String getOtpScreen() => otpScreen;

 static List<GetPage> page=[
    GetPage(name:splashScreen, page: ()=>const SplashScreen()),
    GetPage(
      name: onboardingScreen,
      page: () => const OnboardingScreen(),
      binding: BindingsBuilder(() {
        Get.lazyPut(() => OnboardingController(), fenix: true);
      }),
    ),

     GetPage(name:homeScreen, page: ()=>const HomeScreen()),
     GetPage(
       name: roleScreen,
       page: () => const RoleScreen(),
       binding: BindingsBuilder(() {
         Get.lazyPut(() => RoleController(), fenix: true);
       }),
     ),
     GetPage(name:loginScreen, page: ()=>const LogInScreen()),
     GetPage(name:signUpScreen, page: ()=>const SignUpScreen()),
     GetPage(name:forgetPasswordScreen, page: ()=>const ForgetPasswordScreen()),
     GetPage(
       name: otpScreen,
       page: () => const OtpScreen(),
       binding: BindingsBuilder(() {
         Get.lazyPut(() => OtpController(), fenix: true);
       }),
     ),
     GetPage(name:newPasswordScreen, page: ()=>const NewPasswordScreen()),
     GetPage(name:confirmationScreen, page: ()=>const ConfirmationScreen()),
     GetPage(name:completeSignUpScreen, page: ()=>const CompleteSignUpScreen()),
     GetPage(name:personalInfoScreen, page: ()=>const PersonalInfoScreen()),
  

  ];

  



}