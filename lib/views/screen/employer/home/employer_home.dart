import 'package:flutter/material.dart';
import 'package:flutter_extension/controller/nav_controller.dart';
import 'package:flutter_extension/util/app_colors.dart';
import 'package:flutter_extension/views/base/custom_bottom_navbar.dart';
import 'package:flutter_extension/views/screen/employer/home/employer_home_tab.dart';
import 'package:flutter_extension/views/screen/employer/home/employer_job_tab.dart';
import 'package:flutter_extension/views/screen/employer/home/employer_payment_tab.dart';
import 'package:flutter_extension/views/screen/employer/home/employer_profile_tab.dart';
import 'package:get/get.dart';

class EmployerHome extends StatefulWidget {
  const EmployerHome({super.key});

  @override
  State<EmployerHome> createState() => _EmployerHomeState();
}

class _EmployerHomeState extends State<EmployerHome> {

   late final NavController navController;

  
  final List<Widget> pages = const [
    EmployerHomeTab(),
    EmployerJobTab(),
    EmployerPaymentTab(),
    EmployerProfileTab(),
  ];

  @override
  void initState() {
    super.initState();

    
    if (Get.isRegistered<NavController>()) {
      navController = Get.find<NavController>();
    } else {
      navController = Get.put(NavController());
    }
  }
  @override
  Widget build(BuildContext context) {
   return Scaffold(
      backgroundColor: AppColors.backgroundColor,

     
      body: Obx(
        () => IndexedStack(
          index: navController.currentIndex.value,
          children: pages,
        ),
      ),

      bottomNavigationBar: CustomBottomNav(),
    );
  }
}