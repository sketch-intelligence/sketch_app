import 'package:flutter/material.dart';
import 'package:sketch/core/constant/app_colors/app_colors.dart';
import 'package:sketch/core/constant/text_styles/app_text_style.dart';
import 'package:sketch/core/ui/widgets/custom_button.dart';
import 'package:sketch/core/ui/widgets/custom_text_form_field.dart';

import '../../../../core/constant/text_styles/font_size.dart'; // Import your CustomButton widget

class UserProject extends StatelessWidget {
  UserProject({super.key});

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _budgetController = TextEditingController();
  final TextEditingController _durationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;

    return SafeArea(
        child: Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        title: Text(
          "Add New Project",
          style: AppTextStyle.getMediumStyle(
            fontSize: MediaQuery.of(context).size.width *
                0.06, // Responsive font size
            color: Colors.black, // Adjust color if needed
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildLabel("Project Title"),
            CustomTextFormField(
              borderRadius: 2,
              controller: _titleController,
              borderColor: AppColors.greyDD,
              fillColor: Colors.white,
              height: screenHeight * 0.05, // Fixed height
            ),
            const SizedBox(height: 12),
            _buildLabel("Project Description"),
            CustomTextFormField(
              borderRadius: 2,
              textAlign: TextAlign.start,
              controller: _descriptionController,
              borderColor: AppColors.greyDD,
              fillColor: Colors.white,
              height: screenHeight * 0.15, // Larger height for description
              maxLines: 5,
            ),
            const SizedBox(height: 12),
            _buildLabel("Budget"),
            CustomTextFormField(
              borderRadius: 2,
              controller: _budgetController,
              borderColor: AppColors.greyDD,
              fillColor: Colors.white,
              height: screenHeight * 0.05, // Fixed height
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 12),
            _buildLabel("Duration"),
            CustomTextFormField(
              borderRadius: 2,
              controller: _durationController,
              borderColor: AppColors.greyDD,
              fillColor: Colors.white,
              height: screenHeight * 0.05, // Fixed height
            ),
            const SizedBox(height: 60),
            Center(
              child: CustomButton(
                radius: 2,
                text: "Submit",
                w: MediaQuery.of(context).size.width * 0.9,
                h: MediaQuery.of(context).size.height * 0.06,
                color: AppColors.primary,
                textStyle: AppTextStyle.getBoldStyle(
                  fontSize: AppFontSize.size_16,
                  color: Colors.white,
                ),
                onPressed: () {
                  _submitProject();
                },
              ),
            ),
          ],
        ),
      ),
    ));
  }

  Widget _buildLabel(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Text(
        text,
        style: AppTextStyle.getMediumStyle(
          fontSize: AppFontSize.size_14,
          color: Colors.black87,
        ),
      ),
    );
  }

  void _submitProject() {
    // Handle form submission logic here
    print("Project Submitted: ${_titleController.text}");
  }
}
