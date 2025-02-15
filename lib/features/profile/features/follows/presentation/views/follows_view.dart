import 'package:flutter/material.dart';
import 'package:sketch/constants.dart';
import 'package:sketch/core/constant/app_colors/app_colors.dart';
import 'package:sketch/features/profile/data/models/profile_model/follower.dart';
import 'package:sketch/features/profile/data/models/profile_model/following.dart';
import 'package:sketch/features/profile/features/follows/presentation/widgets/FollowsBody.dart';
import 'package:sketch/translations.dart';

class FollowsView extends StatefulWidget {
  FollowsView(
      {super.key,
      required this.username,
      required this.followers,
      required this.following});
  final String? username;

  List<Follower> followers;

  List<Following> following;

  @override
  _FollowsViewState createState() => _FollowsViewState();
}

class _FollowsViewState extends State<FollowsView> {
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
                radius: 26,
                foregroundImage: const NetworkImage(dummyProfileImage),
                backgroundColor: Colors.grey,
                child: ClipOval(
                  child: Image.network(
                    dummyProfileImage,
                    fit: BoxFit.cover,
                    width: 100,
                    height: 100,
                  ),
                ),
              ),
              const SizedBox(width: 20),
              Text(widget.username ?? ''),
            ],
          ),
          bottom: TabBar(
            indicatorColor: AppColors.primary,
            labelColor: AppColors.primary,
            tabs: [
              Tab(
                child: Row(
                  children: [
                    Text("${widget.followers.length}"), // Dynamic count
                    const SizedBox(width: 5),
                    Text(AppLocalizations.of(context)!.followers),
                  ],
                ),
              ),
              Tab(
                child: Row(
                  children: [
                    Text("${widget.following.length}"), // Dynamic count
                    const SizedBox(width: 5),
                    Text(AppLocalizations.of(context)!.following),
                  ],
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            FollowsBody(users: widget.followers),
            FollowsBody(users: widget.following),
          ],
        ),
      ),
    );
  }
}
