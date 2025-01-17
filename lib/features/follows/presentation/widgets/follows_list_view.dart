import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sketch/core/constant/app_colors/app_colors.dart';
import 'package:sketch/core/constant/app_images_icons/app_assets.dart';
import 'package:sketch/core/constant/text_styles/font_size.dart';
import 'package:sketch/core/ui/widgets/custom_button.dart';
import 'package:sketch/features/home/data/models/person_model.dart';
import 'package:sketch/translations.dart';

class FollowsListView extends StatelessWidget {
  const FollowsListView({
    super.key,
    required this.users,
  });

  final List<PersonModel> users;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: users.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: SvgPicture.asset(Assets.imagesAvatar23),
          title: Text(users[index].userName),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomButton(
                w: 92,
                h: 36,
                text: AppLocalizations.of(context)!.following,
                color: AppColors.white,
                textStyle: const TextStyle(
                    color: AppColors.black, fontSize: AppFontSize.size_14),
                borderSideColor: AppColors.grey3B,
              ),
              const SizedBox(
                width: 10,
              ),
              SvgPicture.asset(Assets.imagesDotsThreeVertical)
            ],
          ),
        );
      },
    );
  }
}
