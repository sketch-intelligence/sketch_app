import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sketch/core/constant/app_colors/app_colors.dart';
import 'package:sketch/core/constant/app_images_icons/app_assets.dart';
import 'package:sketch/core/ui/widgets/custom_button.dart';
import 'package:sketch/translations.dart';

class MyProfileSecondSection extends StatelessWidget {
  const MyProfileSecondSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // Get the screen width and height
    final screenWidth = MediaQuery.of(context).size.width;

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          child: PopupMenuButton<String>(
            color: AppColors.white,
            onSelected: (value) {
              // Handle selection
              if (value == 'Post') {
                // Navigate to Post creation page or show related widget
              } else if (value == 'Project') {
                // Navigate to Project creation page or show related widget
              }
            },
            child: CustomButton(
              text: AppLocalizations.of(context)!.add,
              h: 36,
              w: 136,
              color: Colors.white,
              borderSideColor: const Color(0xff408bc1),
              textStyle: const TextStyle(color: Color(0xff408bc1)),
            ),
            itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem<String>(
                  value: 'Post',
                  child: SizedBox(
                    width: screenWidth * 0.2, // 50% of screen width
                    height: 30, // Fixed height for consistency
                    child: Row(
                      children: [
                        SvgPicture.asset(
                            Assets.imagesNewspaperClipping), // Icon for post
                        const SizedBox(width: 8),
                        Text(AppLocalizations.of(context)!.like,
                            style: const TextStyle(fontSize: 16)),
                      ],
                    ),
                  ),
                ),
                PopupMenuItem<String>(
                  value: 'Project',
                  child: SizedBox(
                    width: screenWidth * 0.2, // 50% of screen width
                    height: 30, // Fixed height for consistency
                    child: Row(
                      children: [
                        SvgPicture.asset(
                            Assets.imagesMeeting), // Icon for project
                        const SizedBox(width: 8),
                        Text(AppLocalizations.of(context)!.projects,
                            style: const TextStyle(fontSize: 16)),
                      ],
                    ),
                  ),
                ),
              ];
            },
          ),
        ),
        const SizedBox(width: 15),
        Expanded(
          child: CustomButton(
            text: AppLocalizations.of(context)!.editProfile,
            h: 36,
            w: 136,
            borderSideColor: const Color(0xff408bc1),
            textStyle: const TextStyle(color: Colors.white),
          ),
        ),
        const SizedBox(width: 15),
        Container(
          width: 36,
          height: 36,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(8),
          ),
          child: SvgPicture.asset(Assets.imagesDotsThreeVertical),
        ),
      ],
    );
  }
}
