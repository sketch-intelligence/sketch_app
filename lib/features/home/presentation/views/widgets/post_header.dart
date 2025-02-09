import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:sketch/features/home/data/models/post_model/post_model.dart';
=======
import 'package:flutter_svg/svg.dart';
import 'package:sketch/core/constant/app_images_icons/app_assets.dart';
import 'package:sketch/core/functions/format_time.dart';
import 'package:sketch/features/Profile/Presentation/user%20profile/views/profile_views.dart';
import 'package:sketch/features/Profile/data/models/profile_user_model.dart';
import 'package:sketch/features/home/data/models/person_model.dart';
import 'package:sketch/features/home/data/models/post_model.dart';
>>>>>>> 7613813d15eba02fe73f001a02c26797a579b2fa

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
<<<<<<< HEAD
        // SvgPicture.asset(/*postModel.ownerId.image ?? */ Assets.imagesAvatar13),
        const SizedBox(
          width: 12,
=======
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
>>>>>>> 7613813d15eba02fe73f001a02c26797a579b2fa
        ),
        const SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
<<<<<<< HEAD
            Text(postModel.owner?.name ?? ''),
            const Row(
              children: [
                // Text(formatTime(postModel.postDate)),
                Text('.'),
                // SvgPicture.asset(
                //   // postModel.isPublic
                //   //     ?
                //   Assets.imagesGlobeHemisphereEast,
                //   // : Assets.imagesLock,
                //   height: 16,
                //   width: 16,
                // )
=======
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
>>>>>>> 7613813d15eba02fe73f001a02c26797a579b2fa
              ],
            ),
          ],
        ),
        const Spacer(),
<<<<<<< HEAD
        // SvgPicture.asset(
        //   Assets.imagesDotsThreeVertical,
        //   height: 20,
        //   width: 20,
        //   color: Colors.black,
        // )
=======
        SvgPicture.asset(
          Assets.imagesDotsThreeVertical,
          height: 20,
          width: 20,
          color: Colors.black,
        ),
>>>>>>> 7613813d15eba02fe73f001a02c26797a579b2fa
      ],
    );
  }
}
