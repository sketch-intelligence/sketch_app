import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sketch/core/constant/app_images_icons/app_assets.dart';
import 'package:sketch/features/Chat/data/models/chat_model.dart';
import 'package:sketch/translations.dart';

class DetailedTopSection extends StatelessWidget {
  const DetailedTopSection({
    super.key,
    required this.chat,
  });

  final Chat chat;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // User's Image Placeholder
        SvgPicture.asset(Assets.imagesAvatar22),
        const SizedBox(width: 10),
        // User's Name
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              chat.userName,
              style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 16),
            ),
            Text(
              AppLocalizations.of(context)!.activeNow,
              style: const TextStyle(color: Colors.grey, fontSize: 12),
            ),
          ],
        ),
      ],
    );
  }
}
