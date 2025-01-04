import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sketch/core/constant/app_colors/app_colors.dart';
import 'package:sketch/core/constant/app_images_icons/app_assets.dart';
import 'package:sketch/core/constant/text_styles/font_size.dart';
import 'package:sketch/core/ui/widgets/custom_button.dart';
import 'package:sketch/core/utils/adaptive_layout.dart';
import 'package:sketch/core/utils/app_styles.dart';
import 'package:sketch/core/utils/size_config.dart';
import 'package:sketch/core/widgets/custom_search_text_field.dart';
import 'package:sketch/features/follows/presentation/widgets/FollowsBody.dart';
import 'package:sketch/features/home/presentation/data/models/person_model.dart';

class FollowsView extends StatelessWidget {
  final String username = "Katie Lee";

  final List<PersonModel> followers = [
    PersonModel(userName: "omar", image: Assets.imagesGlobeHemisphereEast),
    PersonModel(userName: "maher", image: Assets.imagesGlobeHemisphereEast),
    PersonModel(userName: "beshir"),
    PersonModel(userName: "aziz"),
  ];

  final List<PersonModel> following = [
    PersonModel(userName: "john", image: Assets.imagesGlobeHemisphereEast),
    PersonModel(userName: "alice"),
    PersonModel(userName: "bob"),
    PersonModel(userName: "charlie"),
  ];

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
                    SizedBox(width: 20),
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
                          Text("77"),
                          SizedBox(
                            width: 5,
                          ),
                          Text("followers"),
                        ],
                      ),
                    ),
                    Tab(
                      child: Row(children: [
                        Text("85"),
                        SizedBox(
                          width: 5,
                        ),
                        Text("Following")
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
