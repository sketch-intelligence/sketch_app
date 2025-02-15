import 'package:flutter/material.dart';
import 'package:sketch/features/profile/profile/Profile/Presentation/user%20profile/Widgets/build_cover_image.dart';
import 'package:sketch/features/profile/profile/Profile/Presentation/user%20profile/Widgets/build_profile_image.dart';
import 'package:sketch/features/profile/profile/Profile/data/models/profile_model/profile_model.dart';

class BuildTopPage extends StatelessWidget {
  final ProfileModel person;

  const BuildTopPage({super.key, required this.person});

  @override
  Widget build(BuildContext context) {
    double coverHeight = MediaQuery.of(context).size.height * 0.25;
    double profilePictureTop =
        coverHeight - (MediaQuery.of(context).size.width * 0.15);
    double profilePictureOffset = 10.0;

    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(bottom: profilePictureTop / 3.0),
          child: const CoverImageWidget(imageUrl: ''),
        ),
        Positioned(
          top: profilePictureTop - profilePictureOffset,
          child: ProfileImageWidget(
            person: person,
          ),
        ),
      ],
    );
  }
}
