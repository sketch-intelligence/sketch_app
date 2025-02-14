import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:sketch/core/boilerplate/get_model/widgets/get_model.dart';
import 'package:sketch/core/constant/app_colors/app_colors.dart';
import 'package:sketch/core/constant/app_images_icons/app_assets.dart';
import 'package:sketch/core/constant/text_styles/app_text_style.dart';
import 'package:sketch/core/functions/format_time.dart';
import 'package:sketch/core/ui/widgets/custom_button.dart';
import 'package:sketch/core/utils/app_router.dart';
import 'package:sketch/core/utils/app_styles.dart';
import 'package:sketch/features/Profile/data/models/profile_model/profile_model.dart';
import 'package:sketch/features/Profile/data/repository/profile_repository.dart';
import 'package:sketch/features/Profile/data/use_case/get_profile_use_case.dart';
import 'package:sketch/features/user_proposed_project/data/model/user_proposed_project_model/user_proposed_project_model.dart';

class UserProposedProjectItem extends StatelessWidget {
  const UserProposedProjectItem({super.key, required this.project});
  final UserProposedProjectModel project;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      color: AppColors.white,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              project.title ?? '',
              style: AppStyles.styleBold18(context),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              project.description ?? '',
              style: AppStyles.styleRegular18(context)
                  .copyWith(color: AppColors.grey3B),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Row(
                children: [
                  GetModel<ProfileModel>(
                    useCaseCallBack: () {
                      return GetProfileUseCase(repository: ProfileRepository())
                          .call(
                              params: GetProfileParams(
                                  userId: project.architectId ?? 0));
                    },
                    modelBuilder: (model) => ProjectDetailsInfo(
                      name: model.name ?? '',
                      iconPath: Assets.imagesUserPenSolid,
                    ),
                  ),
                  ProjectDetailsInfo(
                    name: "Bids",
                    numberOfBids: project.bidDtos?.length.toString() ?? '0',
                    iconPath: Assets.imagesUserGroupSolid,
                  ),
                  ProjectDetailsInfo(
                    date: DateTime(2020), //project.budget ?? '3',
                    iconPath: Assets.imagesClockRegular,
                  ),
                ],
              ),
            ),
            CustomButton(
              text: 'View Project',
              color: Colors.transparent,
              textStyle: AppTextStyle.getMediumStyle(color: AppColors.primary),
              onPressed: () {
                GoRouter.of(context).push(AppRouter.kUserProposedProjectDetails,
                    extra: project);
              },
            )
          ],
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
        SvgPicture.asset(
          iconPath,
          height: 18,
          width: 18,
          color: AppColors.iconColor,
        ),
        const SizedBox(
          width: 4,
        ),
        if (numberOfBids != null) Text(numberOfBids!),
        if (date != null) Text(formatTime(date!)),
        if (name != null) Text(name!),
        const SizedBox(
          width: 16,
        ),
      ],
    );
  }
}
