import 'dart:io';

import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sketch/core/boilerplate/create_model/widgets/create_model.dart';
import 'package:sketch/core/classes/cashe_helper.dart';
import 'package:sketch/core/constant/app_colors/app_colors.dart';
import 'package:sketch/core/ui/dialogs/dialogs.dart';
import 'package:sketch/core/ui/widgets/custom_button.dart';
import 'package:sketch/core/ui/widgets/custom_text_form_field.dart';
import 'package:sketch/core/ui/widgets/upload_image_bottom_sheet.dart';
import 'package:sketch/core/utils/app_validator.dart';
import 'package:sketch/features/auth/data/model/login_model/login_model.dart';
import 'package:sketch/features/profile/data/cubit/profile_cubit.dart';
import 'package:sketch/features/profile/data/repository/profile_repository.dart';
import 'package:sketch/features/profile/data/use_case/update_profile_pic.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();
  File? _profileImage;
  File? _coverImage;

  Future<void> _pickImage(bool isProfileImage) async {
    FilePickerResult? result =
        await FilePicker.platform.pickFiles(type: FileType.image);
    if (result != null && result.files.single.path != null) {
      setState(() {
        if (isProfileImage) {
          _profileImage = File(result.files.single.path!);
        } else {
          _coverImage = File(result.files.single.path!);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.white,
        appBar: AppBar(
          title:
              const Text("Edit Profile", style: TextStyle(color: Colors.black)),
          centerTitle: true,
          backgroundColor: AppColors.white,
          elevation: 0.5,
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
              horizontal: screenWidth * 0.05, vertical: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return UploadPhotoBottomSheet(whenDone: (p0) {
                          _coverImage = p0;
                          context
                              .read<ProfileCubit>()
                              .profilePicParams
                              .coverImage = p0;
                          setState(() {});
                        });
                      });
                },
                child: Container(
                  height: 200,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.grey[200],
                    image: _coverImage != null
                        ? DecorationImage(
                            image: FileImage(_coverImage!),
                            fit: BoxFit.cover,
                          )
                        : null,
                  ),
                  child: _coverImage == null
                      ? Center(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.camera_alt,
                                  size: 40, color: Colors.grey[600]),
                              const SizedBox(height: 8),
                              Text("Tap to edit cover photo",
                                  style: TextStyle(color: Colors.grey[600]))
                            ],
                          ),
                        )
                      : null,
                ),
              ),
              const SizedBox(height: 16),
              // Profile Image Section
              GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return UploadPhotoBottomSheet(whenDone: (p0) {
                          _profileImage = p0;
                          context
                              .read<ProfileCubit>()
                              .profilePicParams
                              .profileImage = p0;
                          setState(() {});
                        });
                      });
                },
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    CircleAvatar(
                      radius: screenWidth * 0.15,
                      backgroundColor: Colors.grey[200],
                      child: CircleAvatar(
                        backgroundColor: Colors.grey[200],
                        radius: screenWidth * 0.14,
                        backgroundImage: _profileImage != null
                            ? FileImage(_profileImage!)
                            : null,
                        child: _profileImage == null
                            ? Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.camera_alt,
                                      size: screenWidth * 0.07,
                                      color: Colors.grey[600]),
                                  const SizedBox(height: 4),
                                  Text(
                                    "Tap to edit\nprofile photo",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: screenWidth * 0.03,
                                        color: Colors.grey[600]),
                                  ),
                                ],
                              )
                            : null,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              CustomTextFormField(
                initValue: context.read<ProfileCubit>().profilePicParams.name,
                onChanged: (p0) {
                  context.read<ProfileCubit>().profilePicParams.name = p0;
                },
                validator: (p0) {
                  AppValidators.validateFillFields(context,
                      context.read<ProfileCubit>().profilePicParams.name);
                },
              ),

              const SizedBox(height: 30),
              CreateModel(
                withValidation: false,
                useCaseCallBack: (model) {
                  return UpdateProfilePicUseCase(
                          profileRepository: ProfileRepository())
                      .call(
                          params:
                              context.read<ProfileCubit>().profilePicParams);
                },
                onSuccess: (LoginModel model) {
                  CacheHelper.userInfo!.user!.name = model.user!.name;
                  CacheHelper.setCoverImageUrl(model.user!.coverImageUrl);
                  CacheHelper.setProfileImageUrl(model.user!.imageUrl);
                  Dialogs.showSnackBar(
                      message: 'Updated successfully',
                      context: context,
                      typeSnackBar: AnimatedSnackBarType.success);
                },
                onError: (val) {
                  Dialogs.showSnackBar(
                      message: val,
                      context: context,
                      typeSnackBar: AnimatedSnackBarType.error);
                },
                child: CustomButton(
                  color: AppColors.primary,
                  w: screenWidth * 0.4,
                  h: 35,
                  borderSideColor: AppColors.primary,
                  radius: 8,
                  text: "Save Changes",
                  textStyle: TextStyle(
                      fontSize: screenWidth * 0.04,
                      fontWeight: FontWeight.bold,
                      color: AppColors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
