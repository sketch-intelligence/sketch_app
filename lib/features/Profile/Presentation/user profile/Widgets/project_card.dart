import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sketch/core/constant/app_colors/app_colors.dart';
import 'package:sketch/core/constant/text_styles/app_text_style.dart';
import 'package:sketch/core/ui/widgets/custom_button.dart';
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
        padding: EdgeInsets.all(screenWidth < 350
            ? 8.0
            : 16.0), // Adjust padding based on screen size
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Replace Image.network with SvgPicture.asset
            SvgPicture.asset(
              project.imageUrl, // Provide your SVG asset path here
              height: screenHeight < 600
                  ? 120
                  : 150, // Adjust image size for smaller screens
              width: screenWidth < 350
                  ? 80
                  : 100, // Adjust image width for smaller screens
              fit: BoxFit.cover,
            ),
            SizedBox(
                width: screenWidth < 350
                    ? 8
                    : 16), // Adjust space between image and text
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    project.title,
                    style: TextStyle(
                      fontSize:
                          screenWidth < 350 ? 16 : 18, // Adjust title font size
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    project.description,
                    style: TextStyle(
                      fontSize: screenWidth < 350
                          ? 12
                          : 14, // Adjust description font size
                    ),
                  ),
                  SizedBox(
                      height: screenHeight < 600
                          ? 20
                          : 28), // Adjust space before button
                  CustomButton(
                    text: "View Project",
                    color: AppColors.white,
                    w: screenWidth < 350 ? 75 : 87, // Adjust button width
                    h: screenHeight < 600 ? 28 : 32, // Adjust button height
                    borderSideColor: AppColors.primary,
                    textStyle:
                        AppTextStyle.getLightStyle(color: AppColors.primary),
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
