import 'package:flutter/material.dart';
import 'package:sketch/core/constant/app_colors/app_colors.dart';
import 'package:sketch/features/follows/presentation/views/follows_view.dart';
import 'package:sketch/translations.dart';

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
        Tab(
          text: AppLocalizations.of(context)!.posts,
        ),
        Tab(
          text: AppLocalizations.of(context)!.projects,
        ),
        Tab(
          text: AppLocalizations.of(context)!.follows,
        ),
      ],
      onTap: (index) {
        // Check if the "Follows" tab (index 2) is tapped
        if (index == 2) {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) =>
                  const FollowsView(), // Navigate to FollowsView
            ),
          );
        }
      },
    );
  }
}
