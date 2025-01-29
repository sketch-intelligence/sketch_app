import 'package:flutter/material.dart';
import 'package:sketch/core/constant/app_images_icons/app_assets.dart';
import 'package:sketch/features/Profile/Presentation/user%20profile/Widgets/build_top_page.dart';
import 'package:sketch/features/Profile/Presentation/user%20profile/Widgets/custom_tab_bar.dart';
import 'package:sketch/features/Profile/Presentation/user%20profile/Widgets/profile_body_content.dart';
import 'package:sketch/features/Profile/Presentation/user%20profile/Widgets/project_card.dart';
import 'package:sketch/features/Profile/data/models/profile_user_model.dart';
import 'package:sketch/features/Profile/data/models/project_model.dart';
import 'package:sketch/features/home/data/models/person_model.dart';
import 'package:sketch/features/home/presentation/views/widgets/mobile_home_view_body.dart';
import 'package:sketch/features/home/presentation/views/widgets/post_list_view_item.dart';
import 'package:sketch/features/follows/presentation/views/follows_view.dart'; // Import the FollowsView

class ProfileBody extends StatefulWidget {
  ProfileBody({super.key});

  @override
  _ProfileBodyState createState() => _ProfileBodyState();
}

class _ProfileBodyState extends State<ProfileBody>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _selectedIndex = 0; // Track the selected tab

  final List<ProjectModel> projects = [
    ProjectModel(
      id: "1",
      title: "project1",
      description: "this is the first project",
      imageUrl: Assets.imagesAvatar13,
    ),
    ProjectModel(
      id: "1",
      title: "project1",
      description: "this is the first project",
      imageUrl: Assets.imagesAvatar13,
    ),
    ProjectModel(
      id: "1",
      title: "project1",
      description: "this is the first project",
      imageUrl: Assets.imagesAvatar13,
    ),
  ];
  ProfileModel visitoe = ProfileModel(
      person: PersonModel(userName: "Beshir"),
      bio: "Coding and Watching Movies",
      isConnected: false,
      followersCount: 20,
      followingCount: 2);
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(() {
      setState(() {
        _selectedIndex = _tabController.index;
      });
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _onTabTapped(int index) {
    if (index == 2) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => FollowsView(),
        ),
      );
    } else {
      _tabController.animateTo(index);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          BuildTopPage(),
          ProfileBodyContent(
            profile: visitoe,
          ),
          Divider(),
          CustomTabBar(tabController: _tabController),
          // Main scrollable content
          Column(
            children: [
              // Display content based on the selected tab
              if (_selectedIndex == 0) ...[
                // Posts
                ListView.builder(
                  physics:
                      NeverScrollableScrollPhysics(), // Disable scrolling for internal ListView
                  shrinkWrap: true,
                  itemCount: HomeViewBody.posts.length,
                  itemBuilder: (context, index) {
                    return PostListViewItem(
                        postModel: HomeViewBody.posts[index]);
                  },
                ),
              ] else if (_selectedIndex == 1) ...[
                // Projects
                ListView.builder(
                  physics:
                      NeverScrollableScrollPhysics(), // Disable scrolling for internal ListView
                  shrinkWrap: true,
                  itemCount: projects.length,
                  itemBuilder: (context, index) {
                    return ProjectCard(project: projects[index]);
                  },
                ),
              ],
            ],
          ),
          SizedBox(height: 20), // Add some space after the projects
        ],
      ),
    );
  }
}
