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
import 'package:sketch/features/profile/data/repository/profile_repository.dart';
import 'package:sketch/features/profile/data/use_case/add_post_use_case.dart';
import 'package:sketch/features/project/arch_project/presentation/widgets/label_widget.dart';

import '../../../../../core/constant/text_styles/font_size.dart';

class AddPost extends StatefulWidget {
  const AddPost({super.key});

  @override
  _AddPostState createState() => _AddPostState();
}

class _AddPostState extends State<AddPost> {
  final TextEditingController _descriptionController = TextEditingController();

  File? selectedFile;
  final _formKey = GlobalKey<FormState>();

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
        elevation: 0,
        title: const Text(
          "Add New Post",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: AppColors.black,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const LabelWidget(text: "Post Description"),
              const SizedBox(height: 8),
              CustomTextFormField(
                controller: _descriptionController,
                borderColor: AppColors.greyDD,
                fillColor: Colors.white,
                height: MediaQuery.of(context).size.height * 0.15,
                maxLines: 8,
                hintText: "What's in your mind...",
              ),
              const SizedBox(height: 20),
              const LabelWidget(text: "Add Image"),
              const SizedBox(height: 8),
              GestureDetector(
                onTap: _chooseImage,
                child: Container(
                  width: double.infinity,
                  height: 150,
                  decoration: BoxDecoration(
                    color: AppColors.greyDD.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: AppColors.greyDD,
                      width: 1,
                    ),
                  ),
                  child: selectedFile == null
                      ? const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.image,
                                size: 40, color: AppColors.babyBlue),
                            SizedBox(height: 8),
                            Text(
                              'Tap to upload an image',
                              style: TextStyle(
                                fontSize: 14,
                                color: AppColors.babyBlue,
                              ),
                            ),
                          ],
                        )
                      : ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.file(
                            selectedFile!,
                            width: double.infinity,
                            height: 150,
                            fit: BoxFit.cover,
                          ),
                        ),
                ),
              ),
              const SizedBox(height: 60),
              CreateModel(
                withValidation: true,
                onTap: () => _formKey.currentState?.validate() ?? false,
                useCaseCallBack: (model) {
                  return AddPostUseCase(profileRepository: ProfileRepository())
                      .call(
                          params: AddPostParams(
                    image: selectedFile,
                    ownerId: CacheHelper.userID,
                    text: _descriptionController.text,
                    timeStamp: DateTime.now(),
                  ));
                },
                onError: (val) {
                  Dialogs.showErrorSnackBar(message: val, context: context);
                },
                onSuccess: (model) {
                  Dialogs.showSnackBar(
                      message: "Post added successfully",
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
            ],
          ),
        ),
      ),
    ));
  }
}
