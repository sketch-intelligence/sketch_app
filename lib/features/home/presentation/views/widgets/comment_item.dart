import 'package:flutter/material.dart';
import 'package:sketch/constants.dart';
import 'package:sketch/core/boilerplate/get_model/widgets/get_model.dart';
import 'package:sketch/core/utils/app_styles.dart';
import 'package:sketch/features/home/data/models/post_model/comment.dart';
import 'package:sketch/features/profile/data/models/profile_model/profile_model.dart';
import 'package:sketch/features/profile/data/repository/profile_repository.dart';
import 'package:sketch/features/profile/data/use_case/get_profile_use_case.dart';
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
            CircleAvatar(
              radius: 26,
              foregroundImage: const NetworkImage(dummyProfileImage),
              backgroundColor: Colors.grey,
              child: ClipOval(
                child: Image.network(
                  dummyProfileImage,
                  fit: BoxFit.cover,
                  width: 100,
                  height: 100,
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            GetModel(
              useCaseCallBack: () {
                return GetProfileUseCase(repository: ProfileRepository()).call(
                    params: GetProfileParams(userId: commentModel.userId ?? 0));
              },
              modelBuilder: (ProfileModel model) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        model.name ?? '',
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
            ),
            const Spacer(),
            // SvgPicture.asset(
            //   Assets.imagesLike,
            //   height: 20,
            //   width: 20,
            //   color: AppColors.grey3C,
            // )
          ],
        ),
      ),
    );
  }
}
