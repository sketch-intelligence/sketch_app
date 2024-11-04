import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class UserImageContainer extends StatelessWidget {
  final String imagePath;

  const UserImageContainer({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    bool isSvg = imagePath.toLowerCase().endsWith('.svg');

    return Container(
      height: 50,
      width: 50,
      // Set height to control the circular shape
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
    );
  }
}
