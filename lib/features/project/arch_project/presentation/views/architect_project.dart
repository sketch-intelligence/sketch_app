import 'dart:io';

import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:sketch/core/boilerplate/create_model/widgets/create_model.dart';
import 'package:sketch/core/classes/cashe_helper.dart';
import 'package:sketch/core/constant/app_colors/app_colors.dart';
import 'package:sketch/core/constant/text_styles/app_text_style.dart';
import 'package:sketch/core/ui/dialogs/dialogs.dart';
import 'package:sketch/core/ui/widgets/custom_button.dart';
import 'package:sketch/core/ui/widgets/custom_text_form_field.dart';
import 'package:sketch/core/utils/app_validator.dart';
import 'package:sketch/features/profile/data/repository/profile_repository.dart';
import 'package:sketch/features/profile/data/use_case/add_portfolio_project_use_case.dart';
import 'package:sketch/features/project/arch_project/presentation/widgets/date_picker.dart';
import 'package:sketch/features/project/arch_project/presentation/widgets/file_upload_widget.dart';
import 'package:sketch/features/project/arch_project/presentation/widgets/label_widget.dart';

import '../../../../../core/constant/text_styles/font_size.dart';

class ArchitectProject extends StatefulWidget {
  const ArchitectProject({super.key});

  @override
  _ArchitectProjectState createState() => _ArchitectProjectState();
}

class _ArchitectProjectState extends State<ArchitectProject> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _completionDateController =
      TextEditingController();
  File? selectedFile;
  final formkey = GlobalKey<FormState>();

  Future<void> _chooseImage() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.image,
    );

    if (result != null && result.files.single.path != null) {
      setState(() {
        selectedFile = File(result.files.single.path!);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        title: LayoutBuilder(
          builder: (context, constraints) {
            double fontSize = constraints.maxWidth < 360 ? 16 : 20;
            return Text(
              "Add New Project",
              style: TextStyle(fontSize: fontSize),
            );
          },
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
        child: SingleChildScrollView(
          child: Form(
            key: formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const LabelWidget(text: "Project Title"),
                CustomTextFormField(
                  controller: _titleController,
                  borderColor: AppColors.greyDD,
                  fillColor: Colors.white,
                  height: MediaQuery.of(context).size.height * 0.05,
                  validator: (po) {
                    AppValidators.validateFillFields(
                        context, _titleController.text);
                  },
                ),
                const SizedBox(height: 12),
                const LabelWidget(text: "Project Gallery"),
                FileUploadWidget(
                  selectedFile: selectedFile,
                  onTap: _chooseImage,
                ),
                const SizedBox(height: 12),
                const LabelWidget(text: "Project Description"),
                CustomTextFormField(
                  controller: _descriptionController,
                  borderColor: AppColors.greyDD,
                  fillColor: Colors.white,
                  height: MediaQuery.of(context).size.height * 0.15,
                  maxLines: 5,
                  validator: (po) {
                    AppValidators.validateFillFields(
                        context, _descriptionController.text);
                  },
                ),
                const SizedBox(height: 12),
                const LabelWidget(
                  text: "Completion Dateee",
                ),
                DatePickerField(controller: _completionDateController),
                const SizedBox(height: 60),
                Center(
                  child: CreateModel(
                    withValidation: true,
                    useCaseCallBack: (model) {
                      return AddPortfolioProjectUseCase(
                              profileRepository: ProfileRepository())
                          .call(
                              params: AddPortfolioProjectParams(
                                  image: selectedFile,
                                  title: _titleController.text,
                                  description: _descriptionController.text,
                                  archId: CacheHelper.userID));
                    },
                    onTap: () => formkey.currentState?.validate() ?? false,
                    onError: (val) {
                      Dialogs.showErrorSnackBar(
                          message: val,
                          context: context,
                          typeSnackBar: AnimatedSnackBarType.error);
                    },
                    onSuccess: (model) {
                      Dialogs.showSnackBar(
                          message: "project added successfully",
                          context: context,
                          typeSnackBar: AnimatedSnackBarType.success);
                    },
                    child: CustomButton(
                      text: "Submit",
                      w: MediaQuery.of(context).size.width * 0.85,
                      h: MediaQuery.of(context).size.height * 0.06,
                      color: AppColors.primary,
                      textStyle: AppTextStyle.getBoldStyle(
                        fontSize: AppFontSize.size_16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
