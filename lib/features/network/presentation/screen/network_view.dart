import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sketch/constants.dart';
import 'package:sketch/core/constant/app_colors/app_colors.dart';
import 'package:sketch/core/constant/app_images_icons/app_assets.dart';
import 'package:sketch/core/constant/text_styles/font_size.dart';
import 'package:sketch/core/ui/widgets/custom_button.dart';
import 'package:sketch/features/home/data/models/person_model/person_model.dart';
import 'package:sketch/features/home/data/models/person_model/profile_image.dart';
import 'package:sketch/features/profile/features/follows/data/models/follows_model.dart';

class SuggestedForYouPage extends StatefulWidget {
  SuggestedForYouPage({super.key});

  // Initialize with suggested FollowModel instances
  final List<FollowModel> suggestedUsers = [
    FollowModel(
        person: PersonModel(
            name: "Omar",
            profileImage: ProfileImage(downloadUrl: Assets.imagesAvatar13))),
    FollowModel(
        person: PersonModel(
            name: "Beshir",
            profileImage: ProfileImage(downloadUrl: Assets.imagesAvatar13))),
    FollowModel(
        person: PersonModel(
            name: "Quotish",
            profileImage: ProfileImage(downloadUrl: Assets.imagesAvatar13))),
    FollowModel(
        person: PersonModel(
            name: "Quotish",
            profileImage: ProfileImage(downloadUrl: Assets.imagesAvatar13))),
    FollowModel(
        person: PersonModel(
            name: "Quotish",
            profileImage: ProfileImage(downloadUrl: Assets.imagesAvatar13))),
    FollowModel(
        person: PersonModel(
            name: "Quotish",
            profileImage: ProfileImage(downloadUrl: Assets.imagesAvatar13))),
    FollowModel(
        person: PersonModel(
            name: "Quotish",
            profileImage: ProfileImage(downloadUrl: Assets.imagesAvatar13))),
    FollowModel(
        person: PersonModel(
            name: "Quotish",
            profileImage: ProfileImage(downloadUrl: Assets.imagesAvatar13))),
    FollowModel(
        person: PersonModel(
            name: "Quotish",
            profileImage: ProfileImage(downloadUrl: Assets.imagesAvatar13))),
    // Add more users as needed
  ];

  @override
  State<SuggestedForYouPage> createState() => _SuggestedForYouPageState();
}

class _SuggestedForYouPageState extends State<SuggestedForYouPage> {
  late List<FollowModel> filteredUsers; // Change type to FollowModel
  final TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    filteredUsers =
        widget.suggestedUsers; // Initialize with all suggested users
  }

  void _filterUsers(String query) {
    setState(() {
      // Filter by userName from the FollowModel's person
      filteredUsers = widget.suggestedUsers
          .where((follow) =>
              follow.person.name!.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final isSmallScreen = screenWidth < 350;

    return SafeArea(
        child: Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: const Text("Suggested for You"),
        centerTitle: true,
        backgroundColor: AppColors.white,
        elevation: 0.5,
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(screenWidth * 0.03), // Responsive padding
            child: TextField(
              controller: searchController,
              onChanged: _filterUsers,
              decoration: InputDecoration(
                hintText: "Search...",
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(
                    color: AppColors.babyBlue,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredUsers.length,
              itemBuilder: (context, index) {
                final followModel = filteredUsers[index];

                return Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: screenWidth * 0.05,
                    vertical:
                        screenHeight * 0.01, // Responsive vertical padding
                  ),
                  child: ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: SvgPicture.asset(
                      followModel.person.profileImage?.downloadUrl ??
                          dummyProfileImage, // Accessing the person's image
                      width: 40,
                      height: 40,
                    ),
                    title: Text(
                      followModel.person.name ??
                          '', // Accessing the person's username
                      style: TextStyle(
                        fontSize: isSmallScreen
                            ? AppFontSize.size_12
                            : AppFontSize.size_14,
                      ),
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          width: isSmallScreen
                              ? screenWidth * 0.22
                              : screenWidth * 0.25,
                          child: CustomButton(
                            h: isSmallScreen
                                ? 30
                                : 36, // Responsive button height
                            text: "Follow",
                            color: AppColors.primary,
                            textStyle: TextStyle(
                              color: AppColors.white,
                              fontSize: isSmallScreen
                                  ? AppFontSize.size_12
                                  : AppFontSize.size_14,
                            ),
                            borderSideColor: AppColors.primary,
                            onPressed: () {
                              // Handle follow action, could update state or call a service
                              // print("Following ${followModel.person.userName}");
                            },
                          ),
                        ),
                        SizedBox(
                            width: screenWidth * 0.02), // Responsive spacing
                        SvgPicture.asset(
                          Assets.imagesDotsThreeVertical,
                          width: screenWidth * 0.06, // Responsive icon size
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    ));
  }
}
