import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sketch/core/functions/format_time.dart';
import 'package:sketch/core/utils/app_assets.dart';
import 'package:sketch/features/home/presentation/data/models/post_model.dart';

class PostHeader extends StatelessWidget {
  const PostHeader({
    super.key,
    required this.postModel,
  });

  final PostModel postModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(postModel.postOwner.image ?? Assets.imagesAvatar13),
        const SizedBox(
          width: 12,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(postModel.postOwner.userName),
            Row(
              children: [
                Text(formatTime(postModel.postDate)),
                const Text('.'),
                SvgPicture.asset(
                  postModel.isPublic
                      ? Assets.imagesGlobeHemisphereEast
                      : Assets.imagesLock,
                  height: 16,
                  width: 16,
                )
              ],
            )
          ],
        ),
        const Spacer(),
        SvgPicture.asset(
          Assets.imagesDotsThreeVertical,
          height: 20,
          width: 20,
          color: Colors.black,
        )
      ],
    );
  }
}
