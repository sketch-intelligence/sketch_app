import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sketch/constants.dart';
import 'package:sketch/core/constant/app_images_icons/app_assets.dart';
import 'package:sketch/core/functions/format_time.dart';
import 'package:sketch/features/home/data/models/post_model/post_model.dart';
import 'package:sketch/features/profile/features/Profile/Presentation/views/profile_views.dart';

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
        GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              print('${postModel.ownerId}');
              return ProfilePage(userId: postModel.ownerId ?? 0);
            }));
          },
          child: CircleAvatar(
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
        ),
        const SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(postModel.owner?.name ?? ''),
            Row(
              children: [
                Text(formatTime(DateTime(
                    postModel.timeStamp?[0] ?? 2020, // Year
                    postModel.timeStamp?[1] ?? 1, // Month
                    postModel.timeStamp?[2] ?? 1, // Day
                    postModel.timeStamp?[3] ?? 0, // Hour
                    postModel.timeStamp?[4] ?? 0, // Minute
                    postModel.timeStamp?[5] ?? 0 // Second
                    ))),
                const Text('.'),
                SvgPicture.asset(
                  // postModel.isPublic
                  // ?
                  Assets.imagesGlobeHemisphereEast,
                  // : Assets.imagesLock,
                  height: 16,
                  width: 16,
                ),
              ],
            ),
          ],
        ),
        const Spacer(),
        SvgPicture.asset(
          Assets.imagesDotsThreeVertical,
          height: 20,
          width: 20,
          color: Colors.black,
        ),
      ],
    );
  }
}
