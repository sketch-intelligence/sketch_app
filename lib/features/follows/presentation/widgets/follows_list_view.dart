import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sketch/core/constant/app_colors/app_colors.dart';
import 'package:sketch/core/constant/app_images_icons/app_assets.dart';
import 'package:sketch/core/constant/text_styles/font_size.dart';
import 'package:sketch/core/ui/widgets/custom_button.dart';
import 'package:sketch/features/follows/data/models/follows_model.dart';
import 'package:sketch/features/home/data/models/person_model.dart';

class FollowsListView extends StatelessWidget {
  const FollowsListView({
    super.key,
    required this.users,
  });

  final List<FollowModel> users;

  @override
  Widget build(BuildContext context) {
    // Get screen width and height for responsive design
    final screenWidth = MediaQuery.of(context).size.width;

    return ListView.builder(
      itemCount: users.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.05, // Dynamic horizontal padding
            vertical: 10.0,
          ),
          child: ListTile(
            contentPadding: EdgeInsets.zero,
            leading: SvgPicture.asset(Assets.imagesAvatar23),
            title: Text(
              users[index].person.userName,
              style: TextStyle(
                fontSize: screenWidth < 350
                    ? AppFontSize
                        .size_12 // Smaller font size on smaller screens
                    : AppFontSize.size_14, // Regular font size
              ),
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // CustomButton adjusts its width based on screen size
                SizedBox(
                  width: screenWidth < 350
                      ? screenWidth *
                          0.22 // Use a percentage of the screen width for smaller screens
                      : screenWidth *
                          0.25, // Slightly larger for bigger screens
                  child: CustomButton(
                    h: screenWidth < 350
                        ? 30
                        : 36, // Adjust button height for smaller screens
                    text: "following",
                    color: AppColors.white,
                    textStyle: TextStyle(
                      color: AppColors.black,
                      fontSize: screenWidth < 350
                          ? AppFontSize
                              .size_12 // Smaller font size for smaller screens
                          : AppFontSize.size_14, // Regular font size
                    ),
                    borderSideColor: AppColors.grey3B,
                  ),
                ),
                const SizedBox(width: 10),
                SvgPicture.asset(Assets.imagesDotsThreeVertical)
              ],
            ),
          ),
        );
      },
    );
  }
}
