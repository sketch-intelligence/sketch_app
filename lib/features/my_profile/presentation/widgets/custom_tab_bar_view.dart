import 'package:flutter/material.dart';
import 'package:sketch/features/Profile/Presentation/Widgets/postTab.dart';
import 'package:sketch/features/Profile/Presentation/Widgets/project_view.dart';


class CustomTabBarView extends StatelessWidget {
  const CustomTabBarView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      children: [
        PostsTab(),
        ProjectsView(), // ProjectsView is directly included
        Container(), // Placeholder for Follows tab
      ],
    );
  }
}
