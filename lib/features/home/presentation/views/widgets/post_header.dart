import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sketch/core/constant/app_images_icons/app_assets.dart';
import 'package:sketch/core/functions/format_time.dart';
import 'package:sketch/features/Profile/Presentation/user%20profile/views/profile_views.dart';
import 'package:sketch/features/Profile/data/models/profile_user_model.dart';
import 'package:sketch/features/home/data/models/person_model.dart';
import 'package:sketch/features/home/data/models/post_model.dart';

class PostHeader extends StatelessWidget {
  PostHeader({
    super.key,
    required this.postModel,
  });

  final PostModel postModel;
  List<ProfileModel> users = [
    ProfileModel(
      person: PersonModel(
        userName: "Omar",
        image: Assets.imagesAvatar13,
      ),
      bio: "Architect | Designer | Innovator",
      followersCount: 120,
      followingCount: 80,
      isConnected: false,
    ),
    ProfileModel(
      person: PersonModel(
        userName: "omar",
        image: "https://example.com/janesmith.jpg",
      ),
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
        GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return ProfilePage(profile: postModel.postOwner);
            }));
          },
          child: CircleAvatar(
            backgroundImage:
                NetworkImage(postModel.postOwner.person.image ?? ""),
            radius: 20,
          ),
        ),
        const SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(postModel.postOwner.person.userName),
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
