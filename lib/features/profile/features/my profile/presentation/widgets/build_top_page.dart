import 'package:flutter/material.dart';
import 'package:sketch/core/classes/cashe_helper.dart';
import 'package:sketch/features/profile/data/models/profile_model/profile_model.dart';
import 'package:sketch/features/profile/features/user_profile/Presentation/Widgets/build_cover_image.dart';
import 'package:sketch/features/profile/features/user_profile/Presentation/Widgets/build_profile_image.dart';

class BuildTopPage extends StatelessWidget {
  final ProfileModel person; // Accept ProfileModel dynamically
  final bool isOwner;
  const BuildTopPage({super.key, required this.person, required this.isOwner});

  @override
  Widget build(BuildContext context) {
    double coverHeight =
        MediaQuery.of(context).size.height * 0.25; // 25% of screen height
    double profilePictureTop = coverHeight -
        (MediaQuery.of(context).size.width *
            0.35); // Adjust based on profile picture size
    double profilePictureOffset =
        10.0; // Adjust the offset for the profile picture

    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(bottom: profilePictureTop / 2),
          child: CoverImageWidget(
              imageUrl:
                  isOwner ? CacheHelper.profileCoverUrl : person.coverImageUrl),
        ),
        Positioned(
          top: profilePictureTop - profilePictureOffset, // Apply the offset
          child: ProfileImageWidget(
            isOwner: CacheHelper.userID == person.id,
            person: person, // Pass the person data to display profile image
          ),
        ),
      ],
    );
  }
}
