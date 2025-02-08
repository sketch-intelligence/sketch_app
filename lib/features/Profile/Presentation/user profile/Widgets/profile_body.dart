import 'package:flutter/material.dart';
import 'package:sketch/core/constant/app_images_icons/app_assets.dart';
import 'package:sketch/features/Profile/Presentation/user%20profile/Widgets/build_top_page.dart';
import 'package:sketch/features/Profile/Presentation/user%20profile/Widgets/custom_tab_bar.dart';
import 'package:sketch/features/Profile/Presentation/user%20profile/Widgets/profile_body_content.dart';
import 'package:sketch/features/Profile/Presentation/user%20profile/Widgets/project_card.dart';
import 'package:sketch/features/Profile/data/models/profile_user_model.dart';
import 'package:sketch/features/Profile/data/models/project_model.dart';
import 'package:sketch/features/follows/presentation/views/follows_view.dart';
import 'package:sketch/features/home/data/models/person_model.dart';
import 'package:sketch/features/home/presentation/views/widgets/mobile_home_view_body.dart';
import 'package:sketch/features/home/presentation/views/widgets/post_list_view_item.dart';

class ProfileBody extends StatefulWidget {
  ProfileBody({
    super.key,
  });

  @override
  _ProfileBodyState createState() => _ProfileBodyState();
}

class _ProfileBodyState extends State<ProfileBody>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _selectedIndex = 0;
  final ProfileModel omar = ProfileModel(
      person: PersonModel(userName: "omar", image: Assets.imagesAvatar13),
      bio: "hello"); // Accepting PersonModel here

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
          // Pass the 'person' to BuildTopPage dynamically
          BuildTopPage(
            person: omar,
          ),
          ProfileBodyContent(profile: omar), // Pass person to the content
          Divider(),
          CustomTabBar(tabController: _tabController),
          Column(
            children: [
              if (_selectedIndex == 0) ...[
                ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: HomeViewBody.posts.length,
                  itemBuilder: (context, index) {
                    return PostListViewItem(
                      postModel: HomeViewBody.posts[index],
                    );
                  },
                ),
              ] else if (_selectedIndex == 1) ...[
                ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: projects.length,
                  itemBuilder: (context, index) {
                    return ProjectCard(project: projects[index]);
                  },
                ),
              ],
            ],
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
