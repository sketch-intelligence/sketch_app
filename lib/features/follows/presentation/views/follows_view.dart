import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sketch/core/constant/app_colors/app_colors.dart';
import 'package:sketch/core/constant/app_images_icons/app_assets.dart';
import 'package:sketch/core/utils/adaptive_layout.dart';
import 'package:sketch/core/utils/size_config.dart';
import 'package:sketch/features/follows/presentation/widgets/FollowsBody.dart';
import 'package:sketch/features/home/data/models/person_model.dart';
import 'package:sketch/translations.dart';

class FollowsView extends StatelessWidget {
  static String username = "Katie Lee";

  static List<PersonModel> followers = [
    PersonModel(userName: "omar", image: Assets.imagesGlobeHemisphereEast),
    PersonModel(userName: "maher", image: Assets.imagesGlobeHemisphereEast),
    PersonModel(userName: "beshir"),
    PersonModel(userName: "aziz"),
  ];

  static List<PersonModel> following = [
    PersonModel(userName: "john", image: Assets.imagesGlobeHemisphereEast),
    PersonModel(userName: "alice"),
    PersonModel(userName: "bob"),
    PersonModel(userName: "charlie"),
  ];

  const FollowsView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: MediaQuery.sizeOf(context).width < SizeConfig.tablet
            ? AppBar(
                backgroundColor: Colors.white,
                title: Row(
                  children: [
                    SvgPicture.asset(Assets.imagesAvatar13),
                    const SizedBox(width: 20),
                    Text(username),
                  ],
                ),
                bottom: TabBar(
                  indicatorColor: AppColors.primary,
                  labelColor: AppColors.primary,
                  tabs: [
                    Tab(
                      child: Row(
                        children: [
                          const Text("77"),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            AppLocalizations.of(context)!.followers,
                          ),
                        ],
                      ),
                    ),
                    Tab(
                      child: Row(children: [
                        const Text("85"),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          AppLocalizations.of(context)!.following,
                        )
                      ]),
                    ),
                  ],
                ),
              )
            : null,
        body: AdaptiveLayout(
          mobileLayout: (context) => TabBarView(children: [
            FollowsBody(users: followers),
            FollowsBody(users: following)
          ]),
          tabletLayout: (context) => const SizedBox(),
          desktopLayout: (context) => const SizedBox(),
        ),
      ),
    );
  }
}
