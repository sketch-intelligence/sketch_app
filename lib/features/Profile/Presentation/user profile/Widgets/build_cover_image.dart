import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sketch/core/constant/app_images_icons/app_assets.dart';

class CoverImageWidget extends StatelessWidget {
  final String? imageUrl;

  const CoverImageWidget({super.key, this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.25,
      width: double.infinity,
      child: imageUrl != null && imageUrl!.isNotEmpty
          ? Image.network(
              imageUrl!,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Image.network(
                  imageUrl!, // Fallback if network fails
                  fit: BoxFit.cover,
                );
              },
            )
          : SvgPicture.asset(
              Assets.imagesAvatar13, // Fallback if no URL provided
              fit: BoxFit.cover,
            ),
    );
  }
}
