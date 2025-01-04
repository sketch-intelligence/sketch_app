import 'package:flutter/material.dart';
import 'package:sketch/features/Profile/Presentation/Widgets/build_cover_image.dart';
import 'package:sketch/features/Profile/Presentation/Widgets/build_profile_image.dart';

class BuildTopPage extends StatelessWidget {
  const BuildTopPage({super.key});

  @override
  Widget build(BuildContext context) {
    double coverHeight = MediaQuery.of(context).size.height * 0.25; // 25% of screen height
    double profilePictureTop = coverHeight - (MediaQuery.of(context).size.width * 0.15); // Adjust based on profile picture size

    // Adjust the offset for the profile picture
    double profilePictureOffset = 10.0; // Change this value to move the profile picture higher

    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(bottom: profilePictureTop / 2),
          child: buildCoverImage(context),
        ),
        Positioned(
          top: profilePictureTop - profilePictureOffset, // Apply the offset here
          child: buildProfilePicture(context),
        ),
      ],
    );
  }
}