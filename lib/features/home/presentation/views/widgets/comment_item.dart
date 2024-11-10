import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sketch/constants.dart';
import 'package:sketch/core/functions/format_time.dart';
import 'package:sketch/core/utils/app_assets.dart';
import 'package:sketch/core/utils/app_styles.dart';
import 'package:sketch/features/home/presentation/data/models/comment_model.dart';

class CommentItem extends StatelessWidget {
  const CommentItem({super.key, required this.commentModel});
  final CommentModel commentModel;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 6),
        child: Row(
          children: [
            SvgPicture.asset(
                commentModel.commentOwner.image ?? Assets.imagesAvatar13),
            const SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      commentModel.commentOwner.userName,
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
                    Text(
                      formatTime(commentModel.commentDate),
                    ),
                    Row(
                      children: [
                        const SizedBox(
                          width: 16,
                        ),
                        Text(commentModel.reactions.length.toString()),
                        const Text(' like'),
                        const SizedBox(
                          width: 16,
                        ),
                      ],
                    ),
                    const Text('Reply'),
                  ],
                )
              ],
            ),
            const Spacer(),
            SvgPicture.asset(
              Assets.imagesLike,
              height: 20,
              width: 20,
              color: kGreyColor,
            )
          ],
        ),
      ),
    );
  }
}
