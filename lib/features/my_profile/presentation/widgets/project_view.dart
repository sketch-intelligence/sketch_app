import 'package:flutter/material.dart';
import 'package:sketch/features/Profile/Presentation/Widgets/project_card.dart';

class ProjectsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(5, (index) {
        return ProjectCard(
          title: 'Project ${index + 1}',
          description:
              'Description for project ${index + 1}.',
          imageUrl:
              'https://upload.wikimedia.org/wikipedia/commons/thumb/3/31/Mark_Zuckerberg_at_the_37th_G8_Summit_in_Deauville_018_v1.jpg/800px-Mark_Zuckerberg_at_the_37th_G8_Summit_in_Deauville_018_v1.jpg',
        );
      }),
    );
  }
}