import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:sketch/core/constant/app_colors/app_colors.dart';
import 'package:sketch/core/ui/widgets/custom_button.dart';
import 'package:sketch/core/widgets/custom_text_field.dart';

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
                onTap: () => _pickImage(false),
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
                onTap: () => _pickImage(true),
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
              CustomTextField(
                controller: _nameController,
                label: "Name",
              ),
              const SizedBox(height: 16),
              CustomTextField(
                controller: _bioController,
                label: "Bio",
              ),

              const SizedBox(height: 30),
              CustomButton(
                onPressed: () {
                  // Handle save action
                },
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
            ],
          ),
        ),
      ),
    );
  }
}
