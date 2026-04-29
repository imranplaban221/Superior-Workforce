import 'package:flutter/material.dart';
import 'package:flutter_extension/controller/home_controller.dart';
import 'package:flutter_extension/controller/localization_controller.dart';
import 'package:flutter_extension/util/app_constants.dart';
import 'package:flutter_extension/views/base/custom_button.dart';
import 'package:flutter_extension/views/base/custom_image.dart';
import 'package:get/get.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home Screen')),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Home Screen'),
            const SizedBox(height: 20),
            GetBuilder<LocalizationController>(
              builder: (LocalizationController localizationController) {
                int selectedIndex = 0;
                final List<DropdownMenuItem<int>> languageItems = [];
                for (int index = 0;
                    index < AppConstants.languages.length;
                    index++) {
                  languageItems.add(
                    DropdownMenuItem(
                      value: index,
                      child: Text(AppConstants.languages[index].languageName),
                    ),
                  );
                  if (AppConstants.languages[index].languageCode ==
                      localizationController.locale.languageCode) {
                    selectedIndex = index;
                  }
                }
                return DropdownButton<int>(
                  value: selectedIndex,
                  items: languageItems,
                  dropdownColor: Theme.of(context).cardColor,
                  icon: const Icon(Icons.keyboard_arrow_down),
                  elevation: 0,
                  iconSize: 30,
                  underline: const SizedBox(),
                  onChanged: (int? index) {
                    if (index == null) {
                      return;
                    }
                    localizationController.setLanguage(
                      Locale(
                        AppConstants.languages[index].languageCode,
                        AppConstants.languages[index].countryCode,
                      ),
                    );
                  },
                );
              },
            ),
            const SizedBox(width: 20),
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: const CustomImage(
                image: "slslsls",
                height: 100,
                width: 200,
              ),
            ),
            const SizedBox(height: 20),
            CustomButton(
              onTap: () {},
              text: "Click Me",
            ),
          ],
        ),
      ),
    );
  }
}
