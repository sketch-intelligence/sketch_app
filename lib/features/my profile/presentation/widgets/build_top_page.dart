import 'package:flutter/material.dart';
import 'package:sketch/features/Profile/Presentation/user%20profile/Widgets/build_cover_image.dart';
import 'package:sketch/features/Profile/Presentation/user%20profile/Widgets/build_profile_image.dart';

class BuildTopPage extends StatelessWidget {
  const BuildTopPage({super.key});

  @override
  Widget build(BuildContext context) {
    double coverHeight = MediaQuery.of(context).size.height *
        0.22; // Slightly smaller cover height
    double profilePictureTop =
        coverHeight - (MediaQuery.of(context).size.width * 0.18);

    double profilePictureOffset = 10.0;

    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(bottom: profilePictureTop / 2),
          child: CoverImageWidget(
            imageUrl:
                "https://www.ultrasawt.com/sites/default/files/%D8%A7%D9%84%D8%B3%D8%A7%D8%B1%D9%88%D8%AA-2.png",
          ),
        ),
        Positioned(
          top: profilePictureTop - profilePictureOffset,
          child: ProfileImageWidget(
              imageUrl:
                  "https://www.ultrasawt.com/sites/default/files/%D8%A7%D9%84%D8%B3%D8%A7%D8%B1%D9%88%D8%AA-2.png"),
        ),
      ],
    );
  }
}
