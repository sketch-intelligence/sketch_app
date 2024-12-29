import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sketch/core/utils/app_assets.dart';
import 'package:sketch/features/home/presentation/data/models/person_model.dart';

class UserProfilePage extends StatelessWidget {
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
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Row(
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://upload.wikimedia.org/wikipedia/commons/thumb/3/31/Mark_Zuckerberg_at_the_37th_G8_Summit_in_Deauville_018_v1.jpg/800px-Mark_Zuckerberg_at_the_37th_G8_Summit_in_Deauville_018_v1.jpg"),
              ),
              SizedBox(width: 20),
              Text(username),
            ],
          ),
          bottom: TabBar(
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

  UserList({required this.users});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          TextField(
            decoration: InputDecoration(
              labelText: 'Search',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: SvgPicture.asset(Assets.imagesAvatar23),
                  title: Text(users[index].userName),
                  trailing: FollowingButton(),
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
        child: Text(
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