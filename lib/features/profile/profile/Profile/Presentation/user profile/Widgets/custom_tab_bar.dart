import 'package:flutter/material.dart';
import 'package:sketch/constants.dart';
import 'package:sketch/core/classes/cashe_helper.dart';
import 'package:sketch/core/constant/app_colors/app_colors.dart';
import 'package:sketch/features/profile/profile/Profile/data/models/profile_model/profile_model.dart';
import 'package:sketch/features/profile/profile/follows/presentation/views/follows_view.dart'; // Import the FollowsView

class CustomTabBar extends StatelessWidget {
  final TabController tabController;
  ProfileModel profileModel;

  CustomTabBar(
      {super.key, required this.tabController, required this.profileModel});

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
              builder: (context) => FollowsView(
                  username: profileModel.name,
                  followers: profileModel.followers ?? [],
                  following: profileModel.following ?? []),
            ),
          );
        } else {
          tabController.animateTo(index);
        }
      },
      tabs: [
        const Tab(text: "Posts"),
        Tab(
            text: isUser && CacheHelper.userID == profileModel.id
                ? "my projects"
                : CacheHelper.userID == profileModel.id
                    ? "my portfolio"
                    : isUser
                        ? "projects"
                        : 'portfolio'),
        const Tab(text: "Follows"),
      ],
    );
  }
}
