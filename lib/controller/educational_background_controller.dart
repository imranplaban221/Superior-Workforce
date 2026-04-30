import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class EducationEntry {
  EducationEntry({
    required this.degreeOrCertification,
    required this.institutionName,
    required this.year,
    required this.statusLabel,
    required this.licenseNumber,
    this.certificateName,
  });

  final String degreeOrCertification;
  final String institutionName;
  final String year;
  final String statusLabel;
  final String licenseNumber;
  final String? certificateName;
}

class EducationalBackgroundController extends GetxController {
  final RxBool showAddEducationForm = false.obs;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final RxList<EducationEntry> educationEntries = <EducationEntry>[].obs;
  final RxnInt editingIndex = RxnInt();

  final TextEditingController degreeController = TextEditingController();
  final TextEditingController institutionController = TextEditingController();
  final TextEditingController yearController = TextEditingController();
  final TextEditingController licenseController = TextEditingController();

  final RxBool isCompleted = false.obs;
  final RxBool hasCompletionSelection = false.obs;
  final RxnString certificateFileName = RxnString();
  String? certificateFilePath;

  void openAddEducationForm() {
    editingIndex.value = null;
    _clearFormFields();
    showAddEducationForm.value = true;
  }

  void cancelAddEducationForm() {
    showAddEducationForm.value = false;
    editingIndex.value = null;
    _clearFormFields();
  }

  void setCompletion({required bool completed}) {
    hasCompletionSelection.value = true;
    isCompleted.value = completed;
  }

  Future<void> pickCertificate() async {
    try {
      final FilePickerResult? result = await FilePicker.pickFiles(
        type: FileType.custom,
        allowedExtensions: <String>['pdf', 'jpg', 'jpeg', 'png', 'webp'],
      );

      if (result == null || result.files.isEmpty) {
        return;
      }

      final PlatformFile file = result.files.single;
      certificateFileName.value = file.name;
      certificateFilePath = file.path;

      Get.snackbar(
        'File selected',
        file.name,
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 2),
      );
    } on MissingPluginException {
      Get.snackbar(
        'Picker unavailable',
        'Please restart the app (full restart) to load file picker plugin.',
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 3),
      );
    } on PlatformException catch (e) {
      Get.snackbar(
        'Picker error',
        e.message ?? 'Could not open file picker.',
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 3),
      );
    } catch (_) {
      Get.snackbar(
        'Picker error',
        'Could not open file picker.',
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 3),
      );
    }
  }

  void clearCertificate() {
    certificateFileName.value = null;
    certificateFilePath = null;
  }

  void submitEducation() {
    if (!(formKey.currentState?.validate() ?? false)) return;

    final String statusLabel = hasCompletionSelection.value
        ? (isCompleted.value ? 'Completed' : 'Ongoing')
        : 'N/A';

    final EducationEntry entry = EducationEntry(
      degreeOrCertification: degreeController.text.trim().isEmpty
          ? 'N/A'
          : degreeController.text.trim(),
      institutionName: institutionController.text.trim(),
      year: yearController.text.trim().isEmpty ? 'N/A' : yearController.text.trim(),
      statusLabel: statusLabel,
      licenseNumber: licenseController.text.trim().isEmpty
          ? 'N/A'
          : licenseController.text.trim(),
      certificateName: certificateFileName.value,
    );

    if (editingIndex.value != null) {
      educationEntries[editingIndex.value!] = entry;
    } else {
      educationEntries.add(entry);
    }

    showAddEducationForm.value = false;
    editingIndex.value = null;
    _clearFormFields();
  }

  void editEducation(int index) {
    if (index < 0 || index >= educationEntries.length) return;
    final EducationEntry entry = educationEntries[index];
    editingIndex.value = index;

    degreeController.text =
        entry.degreeOrCertification == 'N/A' ? '' : entry.degreeOrCertification;
    institutionController.text =
        entry.institutionName == 'N/A' ? '' : entry.institutionName;
    yearController.text = entry.year == 'N/A' ? '' : entry.year;
    licenseController.text =
        entry.licenseNumber == 'N/A' ? '' : entry.licenseNumber;

    if (entry.statusLabel == 'Completed') {
      hasCompletionSelection.value = true;
      isCompleted.value = true;
    } else if (entry.statusLabel == 'Ongoing') {
      hasCompletionSelection.value = true;
      isCompleted.value = false;
    } else {
      hasCompletionSelection.value = false;
      isCompleted.value = false;
    }

    certificateFileName.value = entry.certificateName;
    showAddEducationForm.value = true;
  }

  void removeEducation(int index) {
    if (index < 0 || index >= educationEntries.length) return;
    educationEntries.removeAt(index);
  }

  void _clearFormFields() {
    degreeController.clear();
    institutionController.clear();
    yearController.clear();
    licenseController.clear();
    hasCompletionSelection.value = false;
    isCompleted.value = false;
    certificateFileName.value = null;
    certificateFilePath = null;
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
