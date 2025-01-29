import 'package:flutter/material.dart';
import 'package:sketch/core/constant/app_images_icons/app_assets.dart';
import 'package:sketch/features/Profile/Presentation/user%20profile/Widgets/project_card.dart';
import 'package:sketch/features/Profile/data/models/project_model.dart';

class ProjectsView extends StatelessWidget {
  final List<ProjectModel> projects;
  ProjectsView({super.key, required this.projects});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(5, (index) {
        return ProjectCard(project: projects[index]);
      }),
    );
  }
}
