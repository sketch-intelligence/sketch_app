import 'package:flutter/material.dart';
import 'package:sketch/core/constant/app_colors/app_colors.dart';
import 'package:sketch/core/constant/text_styles/app_text_style.dart';
import 'package:sketch/features/profile/data/models/portfolio_project_model/portfolio_project_model.dart';
import 'package:sketch/features/project/user_proposed_project/data/model/user_proposed_project_model/user_proposed_project_model.dart';

class ProjectDetailsPage extends StatelessWidget {
  final UserProposedProjectModel project;

  const ProjectDetailsPage({
    super.key,
    required this.project,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return SafeArea(
        child: Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        title: Text(
          "Project Details",
          style: AppTextStyle.getBoldStyle(
            fontSize: 20,
            color: AppColors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(screenWidth < 350 ? 12.0 : 16.0),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Project Image
              // Center(
              //   child: SvgPicture.asset(
              //     project.i,
              //     height: screenHeight * 0.3,
              //     width: screenWidth * 0.4,
              //     fit: BoxFit.cover,
              //   ),
              // ),
              // SizedBox(height: screenHeight < 600 ? 16 : 24),
              // Project Title
              Center(
                child: Text(
                  project.title ?? '',
                  style: AppTextStyle.getBoldStyle(
                    fontSize: screenWidth < 350 ? 20 : 24,
                    color: AppColors.black,
                  ),
                ),
              ),
              SizedBox(height: screenHeight < 600 ? 8 : 12),
              // Project Description
              Text(
                project.description,
                style: AppTextStyle.getRegularStyle(
                  fontSize: screenWidth < 350 ? 14 : 16,
                  color: AppColors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}

class PortfolioProjectDetailsPage extends StatelessWidget {
  final PortfolioProjectModel project;

  const PortfolioProjectDetailsPage({
    super.key,
    required this.project,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return SafeArea(
        child: Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        title: Text(
          "Project Details",
          style: AppTextStyle.getBoldStyle(
            fontSize: 20,
            color: AppColors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(screenWidth < 350 ? 12.0 : 16.0),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Project Image
              // Center(
              //   child: SvgPicture.asset(
              //     project.i,
              //     height: screenHeight * 0.3,
              //     width: screenWidth * 0.4,
              //     fit: BoxFit.cover,
              //   ),
              // ),
              // SizedBox(height: screenHeight < 600 ? 16 : 24),
              // Project Title
              Center(
                child: Text(
                  project.title ?? '',
                  style: AppTextStyle.getBoldStyle(
                    fontSize: screenWidth < 350 ? 20 : 24,
                    color: AppColors.black,
                  ),
                ),
              ),
              SizedBox(height: screenHeight < 600 ? 8 : 12),
              // Project Description
              Text(
                project.description ?? '',
                style: AppTextStyle.getRegularStyle(
                  fontSize: screenWidth < 350 ? 14 : 16,
                  color: AppColors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
