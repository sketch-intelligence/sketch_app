import 'package:flutter/material.dart';
import 'package:sketch/core/constant/app_images_icons/app_assets.dart';
import 'package:sketch/features/Profile/Presentation/user%20profile/Widgets/build_top_page.dart';
import 'package:sketch/features/Profile/Presentation/user%20profile/Widgets/custom_tab_bar.dart';
import 'package:sketch/features/Profile/Presentation/user%20profile/Widgets/project_card.dart';
import 'package:sketch/features/Profile/data/models/profile_user_model.dart';
import 'package:sketch/features/Profile/data/models/project_model.dart';
import 'package:sketch/features/follows/presentation/views/follows_view.dart';
import 'package:sketch/features/home/data/models/person_model.dart';
import 'package:sketch/features/my%20profile/presentation/widgets/my_profile_body_content.dart';

class MyProfileBody extends StatefulWidget {
  const MyProfileBody({super.key});

  @override
  _MyProfileBodyState createState() => _MyProfileBodyState();
}

class _MyProfileBodyState extends State<MyProfileBody>
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
      id: "3",
      title: "project2",
      description: "this is the first project",
      imageUrl: Assets.imagesAvatar13,
    ),
    ProjectModel(
      id: "2",
      title: "project1",
      description: "this is the first project",
      imageUrl: Assets.imagesAvatar13,
    ),
  ];

  ProfileModel visitor = ProfileModel(
    person: PersonModel(userName: "omar"),
    bio: "Coding and Watching Movies",
    isConnected: false,
    followersCount: 20,
    followingCount: 2,
  );

  final GlobalKey _addButtonKey = GlobalKey();

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

  void _showAddOptions(BuildContext context) async {
    final RenderBox renderBox =
        _addButtonKey.currentContext!.findRenderObject() as RenderBox;
    final Offset buttonPosition = renderBox.localToGlobal(Offset.zero);
    final double buttonWidth = renderBox.size.width;
    final double buttonHeight = renderBox.size.height;

    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    await showMenu(
      context: context,
      position: RelativeRect.fromLTRB(
        buttonPosition.dx,
        buttonPosition.dy + buttonHeight,
        screenWidth - buttonPosition.dx - buttonWidth,
        0,
      ),
      items: [
        PopupMenuItem(
          padding: EdgeInsets.zero,
          child: Container(
            width: screenWidth * 0.5,
            height: screenHeight * 0.1,
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                    print("Add Post");
                  },
                  child: const Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                    child: Row(
                      children: [
                        Icon(Icons.post_add, color: Colors.black),
                        SizedBox(width: 8),
                        Text("Post", style: TextStyle(color: Colors.black)),
                      ],
                    ),
                  ),
                ),
                const Divider(height: 1, color: Colors.grey),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                    print("Add Project");
                  },
                  child: const Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                    child: Row(
                      children: [
                        Icon(Icons.business, color: Colors.black),
                        SizedBox(width: 8),
                        Text("Project", style: TextStyle(color: Colors.black)),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
      elevation: 8.0,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const BuildTopPage(),
          MyProfileBodyContent(profile: visitor),
          const Divider(),
          CustomTabBar(tabController: _tabController),
          Column(
            children: [
              if (_selectedIndex == 0) ...[
                // ListView.builder(
                //   physics: const NeverScrollableScrollPhysics(),
                //   shrinkWrap: true,
                //   itemCount: HomeViewBody.posts.length,
                //   itemBuilder: (context, index) {
                //     return PostListViewItem(
                //       postModel: HomeViewBody.posts[index],
                //     );
                //   },
                // ),
              ] else if (_selectedIndex == 1) ...[
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: projects.length,
                  itemBuilder: (context, index) {
                    return ProjectCard(project: projects[index]);
                  },
                ),
              ],
            ],
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
