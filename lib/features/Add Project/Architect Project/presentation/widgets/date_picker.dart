// lib/features/Add Project/Architect Project/widgets/date_picker_field.dart
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sketch/core/constant/app_colors/app_colors.dart';
import 'package:sketch/core/ui/widgets/custom_text_form_field.dart';

class DatePickerField extends StatelessWidget {
  final TextEditingController controller;

  const DatePickerField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        DateTime? pickedDate = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(2000),
          lastDate: DateTime(2101),
        );
        if (pickedDate != null) {
          controller.text = DateFormat('dd MMM yyyy').format(pickedDate);
        }
      },
      child: AbsorbPointer(
        child: CustomTextFormField(
          controller: controller,
          borderColor: AppColors.greyDD,
          fillColor: Colors.white,
          height: MediaQuery.of(context).size.height * 0.05,
          prefixIcon: const Icon(Icons.calendar_today, color: Colors.grey),
        ),
      ),
    );
  }
}
