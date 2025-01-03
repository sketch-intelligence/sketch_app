import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:sketch/core/constant/app_colors/app_colors.dart';
import 'package:sketch/core/constant/app_images_icons/app_assets.dart';
import 'package:sketch/core/functions/format_time.dart';
import 'package:sketch/core/utils/app_router.dart';
import 'package:sketch/core/utils/app_styles.dart';
import 'package:sketch/features/user_proposed_project/data/model/user_proposed_project_model.dart';

class UserProposedProjectItem extends StatelessWidget {
  const UserProposedProjectItem({super.key, required this.project});
  final UserProposedProjectModel project;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context)
            .push(AppRouter.kUserProposedProjectDetails, extra: project);
      },
      child: Card(
        elevation: 2,
        color: AppColors.white,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                project.title,
                style: AppStyles.styleBold18(context),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                project.description,
                style: AppStyles.styleRegular18(context)
                    .copyWith(color: AppColors.grey3B),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: Row(
                  children: [
                    ProjectDetailsInfo(
                      name: project.author.userName,
                      iconPath: Assets.imagesProfile,
                    ),
                    ProjectDetailsInfo(
                      name: "Bids",
                      numberOfBids: project.numberOfBids,
                      iconPath: Assets.imagesChat,
                    ),
                    ProjectDetailsInfo(
                      date: project.postDate,
                      iconPath: Assets.imagesThumbUp,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProjectDetailsInfo extends StatelessWidget {
  const ProjectDetailsInfo(
      {super.key,
      this.name,
      required this.iconPath,
      this.numberOfBids,
      this.date});
  final String? name;
  final String iconPath;
  final String? numberOfBids;
  final DateTime? date;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(iconPath),
        const SizedBox(
          width: 4,
        ),
        if (numberOfBids != null) Text(numberOfBids!),
        if (date != null) Text(formatTime(date!)),
        if (name != null) Text(name!),
        const SizedBox(
          width: 12,
        ),
      ],
    );
  }
}
