import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sketch/core/constant/app_images_icons/app_assets.dart';
import 'package:sketch/core/ui/widgets/custom_button.dart';
import 'package:sketch/features/Profile/data/models/profile_model/profile_model.dart';
import 'package:sketch/features/Profile/data/models/profile_user_model.dart';

class ProfileBodyContent extends StatelessWidget {
  final ProfileModel profile;

  const ProfileBodyContent({super.key, required this.profile});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          profile.name ?? '',
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
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
                  text:
                      'conttec', // profile.isConnected ? "Connected" : "Connect",
                  h: MediaQuery.of(context).size.height * 0.06,
                  w: MediaQuery.of(context).size.width * 0.42,
                  color: Colors.white,
                  borderSideColor: const Color(0xff408bc1),
                  textStyle: TextStyle(
                    color: const Color(0xff408bc1),
                    fontSize: MediaQuery.of(context).size.width * 0.04,
                  ),
                  onPressed: () {
                    // TODO: Handle connect logic
                  },
                ),
              ),
              const SizedBox(width: 15),
              Expanded(
                child: CustomButton(
                  icon: Assets.imagesChatCircleDots,
                  text: "Message",
                  h: MediaQuery.of(context).size.height * 0.06,
                  w: MediaQuery.of(context).size.width * 0.42,
                  borderSideColor: const Color(0xff408bc1),
                  textStyle: TextStyle(
                    color: Colors.white,
                    fontSize: MediaQuery.of(context).size.width * 0.04,
                  ),
                ),
              ),
              const SizedBox(width: 15),
              Container(
                width: MediaQuery.of(context).size.width * 0.1,
                height: MediaQuery.of(context).size.width * 0.1,
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
