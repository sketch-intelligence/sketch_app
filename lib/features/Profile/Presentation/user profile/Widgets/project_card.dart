import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sketch/core/constant/app_colors/app_colors.dart';
import 'package:sketch/core/constant/text_styles/app_text_style.dart';
import 'package:sketch/core/ui/widgets/custom_button.dart';
import 'package:sketch/features/Profile/Presentation/user%20profile/Widgets/project_detailed_page.dart';
import 'package:sketch/features/Profile/Presentation/user%20profile/views/profile_views.dart';
import 'package:sketch/features/Profile/data/models/project_model.dart';

class ProjectCard extends StatelessWidget {
  final ProjectModel project;

  const ProjectCard({
    Key? key,
    required this.project,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Card(
      color: Colors.white,
      margin: EdgeInsets.symmetric(vertical: 8.0),
      elevation: 2,
      child: Padding(
        padding: EdgeInsets.all(screenWidth < 350 ? 8.0 : 16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SvgPicture.asset(
              project.imageUrl,
              height: screenHeight < 600 ? 120 : 150,
              width: screenWidth < 350 ? 80 : 100,
              fit: BoxFit.cover,
            ),
            SizedBox(width: screenWidth < 350 ? 8 : 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    project.title,
                    style: TextStyle(
                      fontSize: screenWidth < 350 ? 16 : 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 4),
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
