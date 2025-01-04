import 'package:flutter/material.dart';
import 'package:sketch/core/constant/app_colors/app_colors.dart';
import 'package:sketch/features/follows/presentation/views/follows_view.dart';

class CustomTabBar extends StatelessWidget {
  const CustomTabBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TabBar(
      indicatorColor: AppColors.primary,
      labelColor: AppColors.primary,
      tabs: [
        Tab(text: "Posts"),
        Tab(text: "Projects"),
        Tab(text: "Follows"),
      ],
      onTap: (index) {
        // Check if the "Follows" tab (index 2) is tapped
        if (index == 2) {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => FollowsView(), // Navigate to FollowsView
            ),
          );
        }
      },
    );
  }
}