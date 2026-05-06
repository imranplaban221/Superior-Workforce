import 'package:flutter/material.dart';
import 'package:flutter_extension/controller/nav_controller.dart';
import 'package:flutter_extension/util/app_colors.dart';
import 'package:flutter_extension/views/base/custom_bottom_navbar.dart';
import 'package:flutter_extension/views/screen/home/home_tab.dart';
import 'package:flutter_extension/views/screen/home/job_tab.dart';
import 'package:flutter_extension/views/screen/home/payment_tab.dart';
import 'package:flutter_extension/views/screen/home/profile_tab.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  late final NavController navController;

  
  final List<Widget> pages = const [
    HomeTab(),
    JobsTab(),
    PaymentTab(),
    ProfileTab(),
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