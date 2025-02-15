import 'package:flutter/material.dart';
import 'package:sketch/features/profile/features/profile/Presentation/Widgets/project_card.dart';
import 'package:sketch/features/project/user_proposed_project/data/model/user_proposed_project_model/user_proposed_project_model.dart';

class ProjectsView extends StatelessWidget {
  final List<UserProposedProjectModel> projects;
  const ProjectsView({super.key, required this.projects});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(5, (index) {
        return ProjectCard(project: projects[index]);
      }),
    );
  }
}
