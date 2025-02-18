import 'package:flutter/material.dart';
import 'package:sketch/core/boilerplate/get_model/widgets/get_model.dart';
import 'package:sketch/core/constant/app_colors/app_colors.dart';
import 'package:sketch/core/constant/text_styles/app_text_style.dart';
import 'package:sketch/core/ui/widgets/custom_button.dart';
import 'package:sketch/features/home/presentation/repository/home_repository.dart';
import 'package:sketch/features/home/presentation/use_case/get_image_use_case.dart';
import 'package:sketch/features/profile/data/models/portfolio_project_model/portfolio_project_model.dart';
import 'package:sketch/features/profile/features/user_profile/Presentation/Widgets/project_detailed_page.dart';
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
            project.projectImage != null
                ? project.projectImage!.isNotEmpty
                    ? GetModel(
                        useCaseCallBack: () {
                          return GetImageUseCase(
                                  homeRepository: HomeRepository())
                              .call(
                                  params: GetImageParams(
                                      imageName:
                                          project.projectImage![0].fileName!));
                        },
                        onSuccess: (ImageModel image) {},
                        errorWidget: Icon(Icons.image_not_supported,
                            size: 50, color: Colors.grey),
                        modelBuilder: (ImageModel model) {
                          return Image.memory(model.imageData);
                        },
                      )
                    : SizedBox()
                : SizedBox(),
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
            project.projectImage != null
                ? project.projectImage!.isNotEmpty
                    ? GetModel(
                        useCaseCallBack: () {
                          return GetImageUseCase(
                                  homeRepository: HomeRepository())
                              .call(
                                  params: GetImageParams(
                                      imageName:
                                          project.projectImage![0].fileName!));
                        },
                        onSuccess: (ImageModel image) {},
                        errorWidget: Icon(Icons.image_not_supported,
                            size: 50, color: Colors.grey),
                        modelBuilder: (ImageModel model) {
                          return Image.memory(model.imageData);
                        },
                      )
                    : SizedBox()
                : SizedBox(),
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
