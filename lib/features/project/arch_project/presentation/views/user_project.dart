import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sketch/core/boilerplate/create_model/widgets/create_model.dart';
import 'package:sketch/core/classes/cashe_helper.dart';
import 'package:sketch/core/constant/app_colors/app_colors.dart';
import 'package:sketch/core/constant/text_styles/app_text_style.dart';
import 'package:sketch/core/ui/dialogs/dialogs.dart';
import 'package:sketch/core/ui/widgets/custom_button.dart';
import 'package:sketch/core/ui/widgets/custom_text_form_field.dart';
import 'package:sketch/features/profile/data/repository/profile_repository.dart';
import 'package:sketch/features/profile/data/use_case/add_user_project_use_case.dart';
import 'package:sketch/features/project/arch_project/presentation/widgets/date_picker.dart';

import '../../../../../core/constant/text_styles/font_size.dart'; // Import your CustomButton widget

class UserProject extends StatelessWidget {
  UserProject({super.key});

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _budgetController = TextEditingController();
  final TextEditingController _durationController = TextEditingController();
  static final _formKey = GlobalKey<FormState>();
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
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
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
                    height:
                        screenHeight * 0.15, // Larger height for description
                    maxLines: 5,
                  ),
                  const SizedBox(height: 12),
                  _buildLabel("Budget"),
                  CustomTextFormField(
                    borderRadius: 2,
                    controller: _budgetController,
                    borderColor: AppColors.greyDD,
                    hintText: 'usd',
                    hintStyle:
                        AppTextStyle.getLightStyle(color: AppColors.grey3C),
                    fillColor: Colors.white,
                    height: screenHeight * 0.05, // Fixed height
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(height: 12),
                  _buildLabel("Deadline"),
                  DatePickerField(controller: _durationController),
                  const SizedBox(height: 60),
                  Center(
                    child: CreateModel(
                      onCubitCreated: (c) {},
                      withValidation: true,
                      onTap: () =>
                          true, //_formKey.currentState?.validate() ?? false,
                      useCaseCallBack: (model) {
                        return AddUserProjectUseCase(
                                profileRepository: ProfileRepository())
                            .call(
                                params: AddUserProjectParams(
                          budget: double.parse(_budgetController.text),
                          deadline: _durationController.text.toString(),
                          description: _descriptionController.text,
                          title: _titleController.text,
                          userId: CacheHelper.userID,
                        ));
                      },
                      onError: (val) {
                        print('in on error the error is $val');

                        Dialogs.showErrorSnackBar(
                            message: val, context: context);
                      },
                      onSuccess: (m) {
                        Dialogs.showSnackBar(
                            message: "Project added successfuly",
                            context: context,
                            typeSnackBar: AnimatedSnackBarType.success);
                        GoRouter.of(context).pop();
                      },
                      child: CustomButton(
                        text: "Submit",
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
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
}
