import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sketch/features/Profile/Presentation/views/profile_views.dart';

// Update with your actual path

class UserImageContainer extends StatelessWidget {
  final String imagePath;

  const UserImageContainer({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    bool isSvg = imagePath.toLowerCase().endsWith('.svg');

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ProfilePage()), // Navigate to ProfileView
        );
      },
      child: Container(
        height: 50,
        width: 50,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
        ),
        child: ClipOval(
          child: isSvg
              ? SvgPicture.asset(
                  imagePath,
                  fit: BoxFit.cover,
                )
              : Image.asset(
                  imagePath,
                  fit: BoxFit.cover,
                ),
        ),
      ),
    );
  }
}