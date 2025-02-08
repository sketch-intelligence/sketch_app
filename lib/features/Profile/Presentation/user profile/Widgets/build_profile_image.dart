import 'package:flutter/material.dart';
import 'package:sketch/core/constant/app_images_icons/app_assets.dart';
import 'package:sketch/features/Profile/data/models/profile_user_model.dart';

class ProfileImageWidget extends StatelessWidget {
  final ProfileModel person; // Expect a ProfileModel here

  const ProfileImageWidget({super.key, required this.person});

  @override
  Widget build(BuildContext context) {
    double radius = MediaQuery.of(context).size.width * 0.15; // Adjust size

    // Check if profileImage exists; if not, use a fallback image
    return CircleAvatar(
      radius: radius,
      backgroundImage:
          person.profileImage != null && person.profileImage!.isNotEmpty
              ? NetworkImage(
                  person.profileImage!) // If the image URL exists, use it
              : AssetImage(Assets.imagesAvatar13)
                  as ImageProvider, // Fallback image
    );
  }
}
