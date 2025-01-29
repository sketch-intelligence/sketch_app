import 'package:flutter/material.dart';
import 'package:sketch/features/Profile/Presentation/user%20profile/Widgets/postTab.dart';
import 'package:sketch/features/Profile/Presentation/user%20profile/Widgets/project_view.dart';
import 'package:sketch/features/Profile/data/models/project_model.dart';
import 'package:sketch/features/follows/presentation/views/follows_view.dart';
import 'package:sketch/features/follows/presentation/widgets/FollowsBody.dart';
import 'package:sketch/features/home/presentation/views/widgets/mobile_home_view_body.dart';

class CustomTabBarView extends StatelessWidget {
  final TabController tabController;
  final List<ProjectModel> projects;
  const CustomTabBarView(
      {super.key, required this.tabController, required this.projects});

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      controller: tabController,
      children: [
        PostsTab(
          posts: HomeViewBody.posts,
        ),
        ProjectsView(
          projects: [],
        ),
        FollowsView(),
      ],
    );
  }
}
