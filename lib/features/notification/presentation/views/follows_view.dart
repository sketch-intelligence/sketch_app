import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sketch/core/constant/app_images_icons/app_assets.dart';
import 'package:sketch/features/home/data/models/person_model.dart';

class UserProfilePage extends StatelessWidget {
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

  const UserProfilePage({super.key});

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
              const CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://upload.wikimedia.org/wikipedia/commons/thumb/3/31/Mark_Zuckerberg_at_the_37th_G8_Summit_in_Deauville_018_v1.jpg/800px-Mark_Zuckerberg_at_the_37th_G8_Summit_in_Deauville_018_v1.jpg"),
              ),
              const SizedBox(width: 20),
              Text(username),
            ],
          ),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Followers'),
              Tab(text: 'Following'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            UserList(users: followers),
            UserList(users: following),
          ],
        ),
      ),
    );
  }
}

class UserList extends StatelessWidget {
  final List<PersonModel> users;

  const UserList({super.key, required this.users});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          const TextField(
            decoration: InputDecoration(
              labelText: 'Search',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: SvgPicture.asset(Assets.imagesAvatar23),
                  title: Text(users[index].userName),
                  trailing: const FollowingButton(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class FollowingButton extends StatelessWidget {
  const FollowingButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: TextButton(
        onPressed: () {
          print("Button pressed");
        },
        child: const Text(
          'Following',
          style: TextStyle(
            fontSize: 14,
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
