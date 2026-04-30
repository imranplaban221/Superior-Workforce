import 'package:flutter/material.dart';
import 'package:flutter_extension/controller/professional_details_controller.dart';
import 'package:flutter_extension/helper/route_helper.dart';
import 'package:flutter_extension/util/app_colors.dart';
import 'package:flutter_extension/util/app_text.dart';
import 'package:flutter_extension/views/base/custom_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ProfessionalDetails extends GetView<ProfessionalDetailsController> {
  const ProfessionalDetails({super.key});

  ProfessionalDetailsController get _controller {
    if (Get.isRegistered<ProfessionalDetailsController>()) {
      return Get.find<ProfessionalDetailsController>();
    }
    return Get.put(ProfessionalDetailsController());
  }

  Widget _label(String text) {
    return Text(
      text,
      style: AppFonts.custom(
        size: 14,
        weight: FontWeight.w500,
        color: const Color(0xFF3D4A57),
      ),
    );
  }

  Widget _dropdown({
    required GlobalKey anchorKey,
    required TextEditingController textController,
    required FocusNode focusNode,
    required String hint,
    required List<String> options,
    required ValueChanged<String> onChanged,
  }) {
    return Container(
      key: anchorKey,
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: const Color(0xFFE5E7EB), width: 1.w),
      ),
      child: RawAutocomplete<String>(
        textEditingController: textController,
        focusNode: focusNode,
        displayStringForOption: (String option) => option,
        optionsBuilder: (TextEditingValue textEditingValue) {
          final String query = textEditingValue.text.trim().toLowerCase();
          if (query.isEmpty) return options;
          return options.where(
            (String option) => option.toLowerCase().contains(query),
          );
        },
        onSelected: onChanged,
        fieldViewBuilder: (
          BuildContext context,
          TextEditingController textController,
          FocusNode focusNode,
          VoidCallback onFieldSubmitted,
        ) {
          return TextField(
            controller: textController,
            focusNode: focusNode,
            cursorColor: const Color(0xFF0074BE),
            style: AppFonts.custom(
              size: 13,
              weight: FontWeight.w400,
              color: const Color(0xFF3E4955),
            ),
            onSubmitted: (String value) => onChanged(value.trim()),
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: AppFonts.custom(
                size: 13,
                weight: FontWeight.w400,
                color: const Color(0xFF9CA3AF),
              ),
              border: InputBorder.none,
              suffixIcon: Icon(
                Icons.keyboard_arrow_down_rounded,
                color: const Color(0xFF9CA3AF),
                size: 20.w,
              ),
            ),
          );
        },
        optionsViewBuilder: (
          BuildContext context,
          AutocompleteOnSelected<String> onSelected,
          Iterable<String> filteredOptions,
        ) {
          final List<String> items = filteredOptions.toList();
          final RenderBox? box =
              anchorKey.currentContext?.findRenderObject() as RenderBox?;
          final double optionWidth = (box != null && box.hasSize)
              ? box.size.width
              : (MediaQuery.sizeOf(context).width - 32.w);
          return Align(
            alignment: Alignment.topLeft,
            child: Material(
              color: Colors.white,
              elevation: 3,
              borderRadius: BorderRadius.circular(12.r),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxHeight: 180.h,
                  minWidth: optionWidth,
                  maxWidth: optionWidth,
                ),
                child: ListView.builder(
                  padding: EdgeInsets.symmetric(vertical: 6.h),
                  shrinkWrap: true,
                  itemCount: items.length,
                  itemBuilder: (BuildContext context, int index) {
                    final String option = items[index];
                    return InkWell(
                      onTap: () => onSelected(option),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 12.w,
                          vertical: 8.h,
                        ),
                        child: Text(
                          option,
                          style: AppFonts.custom(
                            size: 12,
                            weight: FontWeight.w400,
                            color: const Color(0xFF3E4955),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          );
        }, // end optionsViewBuilder
      ), // end RawAutocomplete<String> (child of Container)
    ); // end Container — return of _dropdown
  }

  Widget _chipInput({
    required TextEditingController textController,
    FocusNode? focusNode,
    required String hint,
    required VoidCallback onSubmitted,
  }) {
    return TextField(
      controller: textController,
      focusNode: focusNode,
      cursorColor: const Color(0xFF0074BE),
      style: AppFonts.custom(
        size: 13,
        weight: FontWeight.w400,
        color: const Color(0xFF3E4955),
      ),
      spellCheckConfiguration: const SpellCheckConfiguration.disabled(),
      magnifierConfiguration: TextMagnifierConfiguration.disabled,
      onSubmitted: (_) => onSubmitted(),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: AppFonts.custom(
          size: 11,
          weight: FontWeight.w400,
          color: const Color(0xFF8EA2B6),
        ),
        filled: true,
        fillColor: const Color(0xFFDCE8F5),
        contentPadding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide(color: const Color(0xFF0074BE), width: 1.w),
        ),
      ),
    );
  }

  Widget _selectedChipsRow(
    List<String> items, {
    required ValueChanged<String> onRemove,
  }) {
    if (items.isEmpty) {
      return const SizedBox.shrink();
    }
    return Padding(
      padding: EdgeInsets.only(bottom: 8.h),
      child: Wrap(
        spacing: 6.w,
        runSpacing: 6.h,
        children: items
            .map(
              (String item) => GestureDetector(
                onTap: () => onRemove(item),
                child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
                  decoration: BoxDecoration(
                    gradient: AppColors.buttonColor,
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(
                        item,
                        style: AppFonts.custom(
                          size: 11,
                          weight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(width: 4.w),
                      Icon(
                        Icons.close_rounded,
                        size: 14.w,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }

  Widget _suggestionChipsWrap(
    List<String> items, {
    required ValueChanged<String> onAdd,
  }) {
    if (items.isEmpty) {
      return const SizedBox.shrink();
    }
    return Wrap(
      spacing: 6.w,
      runSpacing: 6.h,
      children: items
          .map(
            (String item) => GestureDetector(
              onTap: () => onAdd(item),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.r),
                  border: Border.all(
                    color: const Color(0xFFE5E7EB),
                    width: 1.w,
                  ),
                ),
                child: Text(
                  item,
                  style: AppFonts.custom(
                    size: 10,
                    weight: FontWeight.w400,
                    color: const Color(0xFF6B7280),
                  ),
                ),
              ),
            ),
          )
          .toList(),
    );
  }

  Widget _bioInput() {
    return TextField(
      controller: _controller.bioController,
      maxLines: 3,
      cursorColor: const Color(0xFF0074BE),
      style: AppFonts.custom(
        size: 13,
        weight: FontWeight.w400,
        color: const Color(0xFF3E4955),
      ),
      decoration: InputDecoration(
        hintText: 'Write here',
        hintStyle: AppFonts.custom(
          size: 12,
          weight: FontWeight.w400,
          color: const Color(0xFF9CA3AF),
        ),
        filled: true,
        fillColor: Colors.white,
        contentPadding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(color: const Color(0xFFE5E7EB), width: 1.w),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(color: const Color(0xFF0074BE), width: 1.w),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final double keyboardBottom = MediaQuery.viewInsetsOf(context).bottom;
    return Scaffold(
      backgroundColor: const Color(0xFFEDEFF2),
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: SingleChildScrollView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            padding: EdgeInsets.only(bottom: 16.h + keyboardBottom),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
              SizedBox(height: 8.h),
              Row(
                children: <Widget>[
                  IconButton(
                    onPressed: Get.back,
                    padding: EdgeInsets.zero,
                    icon: Icon(
                      Icons.arrow_back_rounded,
                      size: 22.w,
                      color: const Color(0xFF3D4A57),
                    ),
                  ),
                  SizedBox(width: 6.w),
                  Text(
                    'Professional Details',
                    style: AppFonts.custom(
                      size: 22.sp,
                      weight: FontWeight.w600,
                      color: const Color(0xFF3D4A57),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 14.h),
              Row(
                children: <Widget>[
                  Text(
                    'Step 2 of 5',
                    style: AppFonts.custom(
                      size: 14,
                      weight: FontWeight.w500,
                      color: Colors.black87,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    '50%',
                    style: AppFonts.custom(
                      size: 14,
                      weight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8.h),
              Container(
                width: double.infinity,
                height: 6.h,
                decoration: BoxDecoration(
                  color: const Color(0xFFD9DDE3),
                  borderRadius: BorderRadius.circular(999.r),
                ),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: FractionallySizedBox(
                    widthFactor: 0.50,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        gradient: AppColors.buttonColor,
                        borderRadius: BorderRadius.circular(999.r),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 18.h),
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 18.h),
                decoration: BoxDecoration(
                  color: const Color(0xFFF7F8FA),
                  borderRadius: BorderRadius.circular(16.r),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      color: const Color(0x0A000000),
                      blurRadius: 8.r,
                      offset: Offset(0, 4.h),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                        _label('Professional Role'),
                        SizedBox(height: 8.h),
                        _dropdown(
                          anchorKey: _controller.roleDropdownKey,
                          textController: _controller.roleController,
                          focusNode: _controller.roleFocusNode,
                          hint: 'Select your role',
                          options: _controller.roleOptions,
                          onChanged: (String value) {
                            _controller.selectRole(value);
                          },
                        ),
                        SizedBox(height: 14.h),
                        _label('Years of Experience'),
                        SizedBox(height: 8.h),
                        _dropdown(
                          anchorKey: _controller.experienceDropdownKey,
                          textController: _controller.experienceController,
                          focusNode: _controller.experienceFocusNode,
                          hint: 'Select experience level',
                          options: _controller.experienceOptions,
                          onChanged: (String value) {
                            _controller.selectExperience(value);
                          },
                        ),
                        SizedBox(height: 14.h),
                        _label('Skills'),
                        SizedBox(height: 8.h),
                        Obx(
                          () => _selectedChipsRow(
                            _controller.selectedSkills,
                            onRemove: _controller.removeSelectedSkill,
                          ),
                        ),
                        _chipInput(
                          textController: _controller.skillController,
                          focusNode: _controller.skillFocusNode,
                          hint: 'Type a skill and press Enter',
                          onSubmitted: _controller.addSkillFromField,
                        ),
                        SizedBox(height: 8.h),
                        Obx(
                          () => _suggestionChipsWrap(
                            _controller.skillSuggestions,
                            onAdd: _controller.addSkillSuggestion,
                          ),
                        ),
                        SizedBox(height: 14.h),
                        _label('Certifications'),
                        SizedBox(height: 8.h),
                        Obx(
                          () => _selectedChipsRow(
                            _controller.selectedCertifications,
                            onRemove:
                                _controller.removeSelectedCertification,
                          ),
                        ),
                        _chipInput(
                          textController: _controller.certificationController,
                          focusNode: _controller.certificationFocusNode,
                          hint: 'Type a certification and press Enter',
                          onSubmitted: _controller.addCertificationFromField,
                        ),
                        SizedBox(height: 8.h),
                        Obx(
                          () => _suggestionChipsWrap(
                            _controller.certificationSuggestions,
                            onAdd: _controller.addCertificationSuggestion,
                          ),
                        ),
                        SizedBox(height: 14.h),
                        _label('Add Bio'),
                        SizedBox(height: 8.h),
                        _bioInput(),
                  ],
                ),
              ),
              SizedBox(height: 20.h),
              Row(
                children: <Widget>[
                  Expanded(
                    child: SizedBox(
                      height: 44.h,
                      child: OutlinedButton(
                        onPressed: Get.back,
                        style: OutlinedButton.styleFrom(
                          side: BorderSide(
                            color: const Color(0xFF80B7DD),
                            width: 1.w,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          backgroundColor: const Color(0xFFF3F8FC),
                        ),
                        child: Text(
                          'Back',
                          style: AppFonts.custom(
                            size: 14,
                            weight: FontWeight.w600,
                            color: const Color(0xFF0074BE),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Expanded(
                    child: CustomButton(
                      text: 'Next',
                      height: 44.h,
                      onTap: () => Get.toNamed(
                            AppRoutes.educationalBackgroundScreen,
                          ),
                      margin: EdgeInsets.zero,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 22.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
