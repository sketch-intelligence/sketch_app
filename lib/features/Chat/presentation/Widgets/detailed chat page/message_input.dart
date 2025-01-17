import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sketch/core/constant/app_images_icons/app_assets.dart';
import 'package:sketch/translations.dart';

class buildMessageInput extends StatelessWidget {
  const buildMessageInput({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          // Icons before the TextField
          Row(
            children: [
              SvgPicture.asset(Assets.imagesShareNetwork),
              const SizedBox(width: 8.0),
              SvgPicture.asset(Assets.imagesSmiley),
              const SizedBox(width: 8.0),
              SvgPicture.asset(Assets.imagesImage59)
            ],
          ),
          const SizedBox(width: 8.0), // Space between icons and TextField
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: AppLocalizations.of(context)!.message,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0), // Rounded corners
                  borderSide: BorderSide.none, // Remove border line
                ),
                filled: true,
                fillColor: Colors.grey[200], // Match the background color
                contentPadding: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 16.0), // Adjust padding
              ),
            ),
          ),
          const SizedBox(width: 8.0), // Space between TextField and IconButton
          Container(
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.blue, // Change this to your desired color
            ),
            child: IconButton(
              icon: const Icon(Icons.send,
                  color: Colors.white), // White icon color
              onPressed: () {
                // Handle sending message logic here
              },
            ),
          ),
        ],
      ),
    );
  }
}
