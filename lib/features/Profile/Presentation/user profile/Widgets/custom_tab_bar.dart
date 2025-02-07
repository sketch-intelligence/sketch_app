import 'package:flutter/material.dart';
import 'package:sketch/core/constant/app_colors/app_colors.dart';
import 'package:sketch/features/follows/presentation/views/follows_view.dart'; // Import the FollowsView

class CustomTabBar extends StatelessWidget {
  final TabController tabController;

  const CustomTabBar({super.key, required this.tabController});

  @override
  Widget build(BuildContext context) {
    return TabBar(
      controller: tabController,
      indicatorColor: AppColors.primary,
      labelColor: AppColors.primary,
      onTap: (index) {
        if (index == 2) {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => FollowsView(),
            ),
          );
        } else {
          tabController.animateTo(index);
        }
      },
      tabs: const [
        Tab(text: "Posts"),
        Tab(text: "Projects"),
        Tab(text: "Follows"),
      ],
    );
  }
}
