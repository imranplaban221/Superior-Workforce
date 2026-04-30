import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfessionalDetailsController extends GetxController {
  final TextEditingController skillController = TextEditingController();
  final TextEditingController certificationController = TextEditingController();
  final TextEditingController bioController = TextEditingController();
  final TextEditingController roleController = TextEditingController();
  final TextEditingController experienceController = TextEditingController();
  final FocusNode roleFocusNode = FocusNode();
  final FocusNode experienceFocusNode = FocusNode();
  final FocusNode skillFocusNode = FocusNode();
  final FocusNode certificationFocusNode = FocusNode();

  final GlobalKey roleDropdownKey = GlobalKey();
  final GlobalKey experienceDropdownKey = GlobalKey();

  final List<String> roleOptions = <String>[
    'Certified Nursing Assistant (CNA)',
    'Doctor',
    'Nurse',
    'Physician Assistant',
    'Nurse Practitioner',
    'Dietary',
    'Housekeeping',
    'Phlebotomist',
    'Laundry',
  ];

  final List<String> experienceOptions = <String>[
    'Less than 1 year',
    '1-2 years',
    '3-5 years',
    '5+ years',
  ];

  final List<String> skillSuggestionsPool = <String>[
    'Patient Care',
    'Vital Signs',
    'CPR',
    'Medical Records',
    'IV Therapy',
    'Wound Care',
  ];

  final List<String> certificationSuggestionsPool = <String>[
    'BLS',
    'ACLS',
    'PALS',
    'RN License',
    'CNA License',
    'CPR Certified',
  ];

  final RxList<String> selectedSkills = <String>[].obs;

  final RxList<String> selectedCertifications = <String>[].obs;

  final RxnString selectedRole = RxnString();
  final RxnString selectedExperience = RxnString();

  @override
  void onInit() {
    super.onInit();
    void closeDropdownOverlays() {
      roleFocusNode.unfocus();
      experienceFocusNode.unfocus();
    }

    skillFocusNode.addListener(() {
      if (skillFocusNode.hasFocus) closeDropdownOverlays();
    });
    certificationFocusNode.addListener(() {
      if (certificationFocusNode.hasFocus) closeDropdownOverlays();
    });
    roleFocusNode.addListener(() {
      if (roleFocusNode.hasFocus) {
        skillFocusNode.unfocus();
        certificationFocusNode.unfocus();
      }
    });
    experienceFocusNode.addListener(() {
      if (experienceFocusNode.hasFocus) {
        skillFocusNode.unfocus();
        certificationFocusNode.unfocus();
      }
    });
  }

  void selectRole(String value) {
    final String trimmed = value.trim();
    if (trimmed.isEmpty) return;
    selectedRole.value = trimmed;
    roleController.text = trimmed;
  }

  void selectExperience(String value) {
    final String trimmed = value.trim();
    if (trimmed.isEmpty) return;
    selectedExperience.value = trimmed;
    experienceController.text = trimmed;
  }

  List<String> get skillSuggestions => skillSuggestionsPool
      .where((String s) => !selectedSkills.contains(s))
      .toList();

  List<String> get certificationSuggestions =>
      certificationSuggestionsPool
          .where((String s) => !selectedCertifications.contains(s))
          .toList();

  void addSkillFromField() =>
      _addChipFromField(skillController, selectedSkills);

  void addCertificationFromField() =>
      _addChipFromField(certificationController, selectedCertifications);

  void addSkillSuggestion(String value) {
    final String v = value.trim();
    if (v.isEmpty || selectedSkills.contains(v)) return;
    selectedSkills.add(v);
  }

  void addCertificationSuggestion(String value) {
    final String v = value.trim();
    if (v.isEmpty || selectedCertifications.contains(v)) return;
    selectedCertifications.add(v);
  }

  void removeSelectedSkill(String value) => selectedSkills.remove(value);

  void removeSelectedCertification(String value) =>
      selectedCertifications.remove(value);

  /// Same as [selectedSkills] / [selectedCertifications] — useful if a screen
  /// still references `skills` / `certifications`.
  RxList<String> get skills => selectedSkills;

  RxList<String> get certifications => selectedCertifications;

  void addSkill() => addSkillFromField();

  void addCertification() => addCertificationFromField();

  void removeSkill(String value) => removeSelectedSkill(value);

  void removeCertification(String value) =>
      removeSelectedCertification(value);

  void _addChipFromField(
    TextEditingController source,
    RxList<String> target,
  ) {
    final String value = source.text.trim();
    if (value.isEmpty) return;
    if (!target.contains(value)) {
      target.add(value);
    }
    source.clear();
  }

  @override
  void onClose() {
    skillController.dispose();
    certificationController.dispose();
    bioController.dispose();
    roleController.dispose();
    experienceController.dispose();
    roleFocusNode.dispose();
    experienceFocusNode.dispose();
    skillFocusNode.dispose();
    certificationFocusNode.dispose();
    super.onClose();
  }
}
