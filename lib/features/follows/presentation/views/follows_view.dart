import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sketch/core/constant/app_colors/app_colors.dart';
import 'package:sketch/core/constant/app_images_icons/app_assets.dart';
import 'package:sketch/features/follows/data/models/follows_model.dart';
import 'package:sketch/features/follows/presentation/widgets/FollowsBody.dart';
import 'package:sketch/features/home/data/models/person_model.dart';
import 'package:sketch/features/home/data/models/person_model/person_model.dart';

class FollowsView extends StatefulWidget {
  const FollowsView({super.key});

  @override
  _FollowsViewState createState() => _FollowsViewState();
}

class _FollowsViewState extends State<FollowsView> {
  String username = "Katie Lee";

  List<FollowModel> followers = [
    FollowModel(person: PersonModel(name: "omar")),
    FollowModel(person: PersonModel(name: "beshir")),
    FollowModel(person: PersonModel(name: "Aziz")),
    FollowModel(person: PersonModel(name: "Quotish")),
    FollowModel(person: PersonModel(name: "Maher")),
    FollowModel(person: PersonModel(name: "Bashar")),
  ];

  List<FollowModel> following = [
    FollowModel(person: PersonModel(name: "omar")),
    FollowModel(person: PersonModel(name: "beshir")),
    FollowModel(person: PersonModel(name: "Aziz")),
    FollowModel(person: PersonModel(name: "Quotish")),
    FollowModel(person: PersonModel(name: "Maher")),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
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
                    Text("${followers.length}"), // Dynamic count
                    const SizedBox(width: 5),
                    const Text("Followers"),
                  ],
                ),
              ),
              Tab(
                child: Row(
                  children: [
                    Text("${following.length}"), // Dynamic count
                    const SizedBox(width: 5),
                    const Text("Following"),
                  ],
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            FollowsBody(users: followers),
            FollowsBody(users: following),
          ],
        ),
      ),
    );
  }
}
