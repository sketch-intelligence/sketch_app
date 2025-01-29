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
          // Assuming 2 is the index for the Follows tab
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => FollowsView(), // Navigate to FollowsView
            ),
          );
        } else {
          tabController.animateTo(index); // Change the tab if it's not Follows
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
