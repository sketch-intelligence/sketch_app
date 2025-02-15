import 'package:flutter/material.dart';
import 'package:sketch/constants.dart';
import 'package:sketch/features/profile/features/profile/data/models/profile_model/profile_model.dart';

class ProfileImageWidget extends StatelessWidget {
  final ProfileModel person; // Expect a ProfileModel here

  const ProfileImageWidget({super.key, required this.person});

  @override
  Widget build(BuildContext context) {
    double radius = MediaQuery.of(context).size.width * 0.15; // Adjust size

    // Check if profileImage exists; if not, use a fallback image
    return CircleAvatar(
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
    );
  }
}
