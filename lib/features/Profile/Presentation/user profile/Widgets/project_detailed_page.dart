import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sketch/core/constant/app_colors/app_colors.dart';
import 'package:sketch/core/constant/text_styles/app_text_style.dart';
import 'package:sketch/features/Profile/data/models/project_model.dart';

class ProjectDetailsPage extends StatelessWidget {
  final ProjectModel project;

  const ProjectDetailsPage({
    Key? key,
    required this.project,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: AppColors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          project.title,
          style: AppTextStyle.getBoldStyle(
            fontSize: 20,
            color: AppColors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(screenWidth < 350 ? 12.0 : 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Project Image
            Center(
              child: SvgPicture.asset(
                project.imageUrl,
                height: screenHeight * 0.3,
                width: screenWidth * 0.8,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: screenHeight < 600 ? 16 : 24),
            // Project Title
            Text(
              project.title,
              style: AppTextStyle.getBoldStyle(
                fontSize: screenWidth < 350 ? 20 : 24,
                color: AppColors.black,
              ),
            ),
            SizedBox(height: screenHeight < 600 ? 8 : 12),
            // Project Description
            Text(
              project.description,
              style: AppTextStyle.getRegularStyle(
                fontSize: screenWidth < 350 ? 14 : 16,
                color: AppColors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
