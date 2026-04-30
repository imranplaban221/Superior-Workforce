import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_extension/controller/auth_controller.dart';
import 'package:flutter_extension/controller/splash_controller.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../controller/home_controller.dart';
import '../controller/localization_controller.dart';

import '../data/model/language_model.dart';
import '../util/app_constants.dart';

Future<Map<String, Map<String, String>>> init() async {
  final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  Get.lazyPut(() => sharedPreferences);

  Get.lazyPut(() => LocalizationController(sharedPreferences: Get.find()));
  Get.put(SplashController());
  Get.lazyPut(() => AuthController());
  Get.lazyPut(() => HomeController());

  final Map<String, Map<String, String>> languages = <String, Map<String, String>>{};
  for (final LanguageModel languageModel in AppConstants.languages) {
    final String jsonStringValues = await rootBundle.loadString(
      'assets/language/${languageModel.languageCode}.json',
    );
    final Map<String, dynamic> mappedJson =
        jsonDecode(jsonStringValues) as Map<String, dynamic>;
    final Map<String, String> entries = <String, String>{};
    for (final MapEntry<String, dynamic> entry in mappedJson.entries) {
      entries[entry.key] = entry.value.toString();
    }
    languages['${languageModel.languageCode}_${languageModel.countryCode}'] =
        entries;
  }
  return languages;
}
