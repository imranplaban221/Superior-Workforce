import 'package:flutter/material.dart';
import 'package:flutter_extension/controller/educational_background_controller.dart';
import 'package:flutter_extension/views/base/custom_educational_background.dart';
import 'package:get/get.dart';

class EducationalBackground extends GetView<EducationalBackgroundController> {
  const EducationalBackground({super.key});

  @override
  Widget build(context) {
    return CustomEducationalBackground(controller: controller);
  }
}
