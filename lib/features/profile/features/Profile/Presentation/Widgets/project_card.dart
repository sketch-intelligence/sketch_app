import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sketch/core/constant/app_colors/app_colors.dart';
import 'package:sketch/core/constant/text_styles/app_text_style.dart';
import 'package:sketch/core/ui/widgets/custom_button.dart';
import 'package:sketch/features/profile/features/profile/Presentation/Widgets/project_detailed_page.dart';
import 'package:sketch/features/profile/features/profile/data/models/portfolio_project_model/portfolio_project_model.dart';
import 'package:sketch/features/project/user_proposed_project/data/model/user_proposed_project_model/user_proposed_project_model.dart';

class ProjectCard extends StatelessWidget {
  final UserProposedProjectModel project;

  const ProjectCard({
    super.key,
    required this.project,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Card(
      color: Colors.white,
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      elevation: 2,
      child: Padding(
        padding: EdgeInsets.all(screenWidth < 350 ? 8.0 : 16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // SvgPicture.asset(
            //   project.,
            //   height: screenHeight < 600 ? 120 : 150,
            //   width: screenWidth < 350 ? 80 : 100,
            //   fit: BoxFit.cover,
            // ),
            // SizedBox(width: screenWidth < 350 ? 8 : 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    project.title ?? '',
                    style: TextStyle(
                      fontSize: screenWidth < 350 ? 16 : 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    project.description,
                    style: TextStyle(
                      fontSize: screenWidth < 350 ? 12 : 14,
                    ),
                  ),
                  SizedBox(height: screenHeight < 600 ? 20 : 28),
                  CustomButton(
                    text: "View Project",
                    color: AppColors.white,
                    w: screenWidth < 350 ? 75 : 87,
                    h: screenHeight < 600 ? 28 : 32,
                    borderSideColor: AppColors.primary,
                    textStyle:
                        AppTextStyle.getLightStyle(color: AppColors.primary),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return ProjectDetailsPage(project: project);
                      }));
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PortfolioProjectCard extends StatelessWidget {
  final PortfolioProjectModel project;

  const PortfolioProjectCard({
    super.key,
    required this.project,
  });

  Future<String> getLocalPath(String fileName) async {
    final directory = await getApplicationDocumentsDirectory();
    return '${directory.path}/$fileName'; // Use the app's local storage path
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    String? imageUrl = project.projectImage?.isNotEmpty == true
        ? project.projectImage![0].fileName
        : null;

    Widget imageWidget;

    if (imageUrl != null && imageUrl.startsWith('http')) {
      // Case 1: Load from network if it's a URL
      imageWidget = Image.network(
        imageUrl,
        height: screenHeight < 600 ? 120 : 150,
        width: screenWidth < 350 ? 80 : 100,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
          return const Icon(Icons.broken_image, size: 50, color: Colors.red);
        },
      );
    } else if (imageUrl != null) {
      // Case 2: Try loading from local storage
      imageWidget = FutureBuilder<String>(
        future: getLocalPath(imageUrl),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done &&
              snapshot.hasData &&
              File(snapshot.data!).existsSync()) {
            return Image.file(
              File(snapshot.data!),
              height: screenHeight < 600 ? 120 : 150,
              width: screenWidth < 350 ? 80 : 100,
              fit: BoxFit.cover,
            );
          } else {
            return const Icon(Icons.image_not_supported,
                size: 50, color: Colors.grey);
          }
        },
      );
    } else {
      // Case 3: Show default placeholder
      imageWidget = const Icon(Icons.image, size: 50, color: Colors.grey);
    }
    return Card(
      color: Colors.white,
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      elevation: 2,
      child: Padding(
        padding: EdgeInsets.all(screenWidth < 350 ? 8.0 : 16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            imageWidget,
            SizedBox(width: screenWidth < 350 ? 8 : 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    project.title ?? '',
                    style: TextStyle(
                      fontSize: screenWidth < 350 ? 16 : 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    project.description ?? '',
                    style: TextStyle(
                      fontSize: screenWidth < 350 ? 12 : 14,
                    ),
                  ),
                  SizedBox(height: screenHeight < 600 ? 20 : 28),
                  CustomButton(
                    text: "View Project",
                    color: AppColors.white,
                    w: screenWidth < 350 ? 75 : 87,
                    h: screenHeight < 600 ? 28 : 32,
                    borderSideColor: AppColors.primary,
                    textStyle:
                        AppTextStyle.getLightStyle(color: AppColors.primary),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return PortfolioProjectDetailsPage(project: project);
                      }));
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
