// lib/features/Add Project/Architect Project/widgets/file_upload_widget.dart
import 'package:flutter/material.dart';
import 'package:sketch/core/constant/app_colors/app_colors.dart';
import 'package:sketch/core/constant/text_styles/app_text_style.dart';
import 'package:sketch/core/constant/text_styles/font_size.dart';

class FileUploadWidget extends StatelessWidget {
  final String? selectedFile;
  final Function onTap;

  const FileUploadWidget({super.key, this.selectedFile, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Container(
        height: 120,
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.greyDD, width: 1),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: selectedFile == null
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.cloud_upload, size: 40, color: Colors.grey),
                    Text("Browse files",
                        style: AppTextStyle.getMediumStyle(
                            fontSize: AppFontSize.size_14, color: Colors.blue)),
                    Text("Supported format: PNG, JPG",
                        style: AppTextStyle.getRegularStyle(
                            fontSize: AppFontSize.size_12, color: Colors.grey)),
                  ],
                )
              : Text("Selected: $selectedFile",
                  style: AppTextStyle.getMediumStyle(
                      fontSize: AppFontSize.size_14, color: Colors.black)),
        ),
      ),
    );
  }
}
