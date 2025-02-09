import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sketch/core/constant/app_colors/app_colors.dart';
import 'package:sketch/core/constant/app_images_icons/app_assets.dart';
import 'package:sketch/core/utils/app_styles.dart';
import 'package:sketch/features/home/data/models/post_model/comment.dart';
import 'package:sketch/translations.dart';

class CommentItem extends StatelessWidget {
  const CommentItem({super.key, required this.commentModel});
  final Comment commentModel;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 6),
        child: Row(
          children: [
            // SvgPicture.asset(
            //     commentModel.userId.image ?? Assets.imagesAvatar13),
            const SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      commentModel.userId.toString(),
                      style: AppStyles.styleBold14(context),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(commentModel.text ?? '')
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    // Text(
                    //   formatTime(commentModel.),
                    // ),
                    Row(
                      children: [
                        const SizedBox(
                          width: 16,
                        ),
                        // Text(commentModel.reactions.length.toString()),
                        Text(
                          AppLocalizations.of(context)!.like,
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                      ],
                    ),
                    Text(
                      AppLocalizations.of(context)!.reply,
                    ),
                  ],
                )
              ],
            ),
            const Spacer(),
            SvgPicture.asset(
              Assets.imagesLike,
              height: 20,
              width: 20,
              color: AppColors.grey3C,
            )
          ],
        ),
      ),
    );
  }
}
