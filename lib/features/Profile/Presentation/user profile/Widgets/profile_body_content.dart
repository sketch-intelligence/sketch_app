import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sketch/core/constant/app_images_icons/app_assets.dart';
import 'package:sketch/core/ui/widgets/custom_button.dart';
import 'package:sketch/features/Profile/data/models/profile_user_model.dart';
import 'package:sketch/features/my%20profile/presentation/views/my_profile_view.dart';
import 'package:sketch/features/my%20profile/presentation/widgets/my_profile_body.dart';
import 'package:sketch/features/notification/presentation/views/notification_view.dart';

class ProfileBodyContent extends StatelessWidget {
  final ProfileModel profile;

  const ProfileBodyContent({
    super.key,
    required this.profile,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Dynamic name from ProfileModel
        Text(
          profile.person.userName,
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        // Dynamic bio from ProfileModel
        Text(
          profile.bio,
          style: const TextStyle(fontSize: 16, color: Colors.grey),
        ),
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: CustomButton(
                  icon: Assets.imagesCheckDouble,
                  text: profile.isConnected ? "Connected" : "Connect",
                  h: MediaQuery.of(context).size.height *
                      0.05, // 5% of screen height
                  w: MediaQuery.of(context).size.width *
                      0.35, // 35% of screen width
                  color: Colors.white,
                  borderSideColor: const Color(0xff408bc1),
                  textStyle: TextStyle(
                    color: const Color(0xff408bc1),
                    fontSize: MediaQuery.of(context).size.width *
                        0.035, // Dynamic font size (3.5% of screen width)
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return MyProfilePage();
                    }));
                  },
                ),
              ),
              const SizedBox(width: 15),
              Expanded(
                child: CustomButton(
                  icon: Assets.imagesChatCircleDots,
                  text: "Message",
                  h: MediaQuery.of(context).size.height *
                      0.05, // 5% of screen height
                  w: MediaQuery.of(context).size.width *
                      0.35, // 35% of screen width
                  borderSideColor: const Color(0xff408bc1),
                  textStyle: TextStyle(
                    color: Colors.white,
                    fontSize: MediaQuery.of(context).size.width *
                        0.035, // Dynamic font size (3.5% of screen width)
                  ),
                ),
              ),
              const SizedBox(width: 15),
              Container(
                width: MediaQuery.of(context).size.width *
                    0.1, // 10% of screen width
                height: MediaQuery.of(context).size.width *
                    0.1, // Square - 10% of screen width
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: SvgPicture.asset(Assets.imagesDotsThreeVertical),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
