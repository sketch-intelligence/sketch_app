import 'package:flutter/material.dart';
import 'package:sketch/core/constant/app_images_icons/app_assets.dart';
import 'package:sketch/features/Profile/Presentation/user%20profile/Widgets/build_top_page.dart';
import 'package:sketch/features/Profile/Presentation/user%20profile/Widgets/custom_tab_bar.dart';
import 'package:sketch/features/Profile/Presentation/user%20profile/Widgets/profile_body_content.dart';
import 'package:sketch/features/Profile/data/models/profile_model/profile_model.dart';
import 'package:sketch/features/Profile/data/models/profile_user_model.dart';
import 'package:sketch/features/Profile/data/models/project_model.dart';
import 'package:sketch/features/follows/presentation/views/follows_view.dart';
import 'package:sketch/features/home/data/models/person_model/person_model.dart';
import 'package:sketch/features/home/data/models/person_model/profile_image.dart';

class ProfileBody extends StatefulWidget {
  ProfileBody({super.key, required this.profileModel});
  ProfileModel profileModel;
  @override
  _ProfileBodyState createState() => _ProfileBodyState();
}

class _ProfileBodyState extends State<ProfileBody>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _selectedIndex = 0;

  final List<ProjectModel> projects = [
    ProjectModel(
      id: "1",
      title: "project1",
      description: "this is the first project",
      imageUrl: Assets.imagesAvatar13,
    ),
    ProjectModel(
      id: "2",
      title: "project2",
      description: "this is the second project",
      imageUrl: Assets.imagesAvatar13,
    ),
  ];

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
          builder: (context) => const FollowsView(),
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
          // Pass the 'person' to BuildTopPage dynamically
          BuildTopPage(
            person: widget.profileModel,
          ),
          ProfileBodyContent(
              profile: widget.profileModel), // Pass person to the content
          const Divider(),
          CustomTabBar(tabController: _tabController),
          const Column(
            children: [
              //get user posts
              // if (_selectedIndex == 0) ...[
              //   ListView.builder(
              //     physics: const NeverScrollableScrollPhysics(),
              //     shrinkWrap: true,
              //     itemCount: HomeViewBody.posts.length,
              //     itemBuilder: (context, index) {
              //       return PostListViewItem(
              //         postModel: HomeViewBody.posts[index],
              //       );
              //     },
              //   ),
              // ] else if (_selectedIndex == 1) ...[
              //   ListView.builder(
              //     physics:
              //         const NeverScrollableScrollPhysics(), // Disable scrolling for internal ListView
              //     shrinkWrap: true,
              //     itemCount: projects.length,
              //     itemBuilder: (context, index) {
              //       return ProjectCard(project: projects[index]);
              //     },
              //   ),
              // ],
            ],
          ),
          const SizedBox(height: 20), // Add some space after the projects
        ],
      ),
    );
  }
}
