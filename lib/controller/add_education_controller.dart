import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddEducationController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController degreeController = TextEditingController();
  final TextEditingController institutionController = TextEditingController();
  final TextEditingController yearController = TextEditingController();
  final TextEditingController licenseController = TextEditingController();

  
  final RxBool isCompleted = true.obs;

  final RxnString certificateFileName = RxnString();
  String? certificateFilePath;

  void setCompletion({required bool completed}) {
    isCompleted.value = completed;
  }

  Future<void> pickCertificate() async {
    final FilePickerResult? result = await FilePicker.pickFiles(
      type: FileType.custom,
      allowedExtensions: <String>['pdf', 'jpg', 'jpeg', 'png', 'webp'],
    );
    if (result != null && result.files.isNotEmpty) {
      final PlatformFile file = result.files.single;
      certificateFileName.value = file.name;
      certificateFilePath = file.path;
    }
  }

  void clearCertificate() {
    certificateFileName.value = null;
    certificateFilePath = null;
  }

  void onCancel() => Get.back();

  void onAdd() {
    if (!(formKey.currentState?.validate() ?? false)) {
      return;
    }
    Get.back();
  }

  @override
  void onClose() {
    degreeController.dispose();
    institutionController.dispose();
    yearController.dispose();
    licenseController.dispose();
    super.onClose();
  }
}
