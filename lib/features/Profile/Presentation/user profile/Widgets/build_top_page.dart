import 'package:flutter/material.dart';
import 'package:sketch/constants.dart';
import 'package:sketch/features/Profile/Presentation/user%20profile/Widgets/build_cover_image.dart';
import 'package:sketch/features/Profile/Presentation/user%20profile/Widgets/build_profile_image.dart';
import 'package:sketch/features/Profile/data/models/profile_model/profile_model.dart';
import 'package:sketch/features/Profile/data/models/profile_user_model.dart';
import 'package:sketch/features/home/data/models/person_model.dart';

class BuildTopPage extends StatelessWidget {
  final ProfileModel person; // Accept ProfileModel dynamically

  const BuildTopPage({super.key, required this.person});

  @override
  Widget build(BuildContext context) {
    double coverHeight =
        MediaQuery.of(context).size.height * 0.25; // 25% of screen height
    double profilePictureTop = coverHeight -
        (MediaQuery.of(context).size.width *
            0.15); // Adjust based on profile picture size
    double profilePictureOffset =
        10.0; // Adjust the offset for the profile picture

    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(bottom: profilePictureTop / 3.0),
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
        Positioned(
          top: profilePictureTop - profilePictureOffset, // Apply the offset
          child: ProfileImageWidget(
            person: person, // Pass the person data to display profile image
          ),
        ),
      ],
    );
  }
}
