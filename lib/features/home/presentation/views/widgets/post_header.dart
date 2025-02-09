import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sketch/core/constant/app_images_icons/app_assets.dart';
import 'package:sketch/core/functions/format_time.dart';
import 'package:sketch/features/Profile/data/models/profile_user_model.dart';
import 'package:sketch/features/home/data/models/person_model/person_model.dart';
import 'package:sketch/features/home/data/models/person_model/profile_image.dart';
import 'package:sketch/features/home/data/models/post_model/post_model.dart';

class PostHeader extends StatelessWidget {
  PostHeader({
    super.key,
    required this.postModel,
  });

  final PostModel postModel;
  List<ProfileModel> users = [
    ProfileModel(
      person: PersonModel(
          name: "Omar",
          profileImage: ProfileImage(
            downloadUrl: Assets.imagesAvatar13,
          )),
      bio: "Architect | Designer | Innovator",
      followersCount: 120,
      followingCount: 80,
      isConnected: false,
    ),
    ProfileModel(
      person: PersonModel(
          name: "Omar",
          profileImage: ProfileImage(
            downloadUrl: Assets.imagesAvatar13,
          )),
      bio: "Urban Planner | Engineer",
      followersCount: 200,
      followingCount: 150,
      isConnected: true,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // GestureDetector(
        //   onTap: () {
        //     Navigator.push(context, MaterialPageRoute(builder: (context) {
        //       return ProfilePage(profile: users[0]);
        //     }));
        //   },
        //   // child: const CircleAvatar(
        //   //   backgroundImage:// NetworkImage(dummyProfileImage),
        //   //   //radius: 20,//
        //   // ),
        // ),
        const SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(users[0].person.name ?? ''),
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
