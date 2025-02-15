import 'package:flutter/material.dart';
import 'package:sketch/constants.dart';
import 'package:sketch/core/boilerplate/get_model/widgets/get_model.dart';
import 'package:sketch/features/home/data/models/post_model/post_model.dart';
import 'package:sketch/features/home/presentation/repository/home_repository.dart';
import 'package:sketch/features/home/presentation/views/widgets/post_list_view_item.dart';
import 'package:sketch/features/profile/features/follows/presentation/views/follows_view.dart';
import 'package:sketch/features/profile/features/my%20profile/presentation/widgets/my_profile_body_content.dart';
import 'package:sketch/features/profile/features/profile/Presentation/Widgets/build_top_page.dart';
import 'package:sketch/features/profile/features/profile/Presentation/Widgets/custom_tab_bar.dart';
import 'package:sketch/features/profile/features/profile/Presentation/Widgets/project_card.dart';
import 'package:sketch/features/profile/features/profile/data/models/portfolio_project_model/portfolio_project_model.dart';
import 'package:sketch/features/profile/features/profile/data/models/profile_model/profile_model.dart';
import 'package:sketch/features/profile/features/profile/data/repository/profile_repository.dart';
import 'package:sketch/features/profile/features/profile/data/use_case/get_arch_protfolio_projects_use_case.dart';
import 'package:sketch/features/profile/features/profile/data/use_case/get_user_posts_use_case.dart';
import 'package:sketch/features/profile/features/profile/data/use_case/get_user_projects_use_case.dart';
import 'package:sketch/features/project/user_proposed_project/data/model/user_proposed_project_model/user_proposed_project_model.dart';
import 'package:sketch/translations.dart';

//myyyy projfile
class MyProfileBody extends StatefulWidget {
  MyProfileBody({super.key, required this.profileModel});
  ProfileModel profileModel;
  @override
  _MyProfileBodyState createState() => _MyProfileBodyState();
}

class _MyProfileBodyState extends State<MyProfileBody>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _selectedIndex = 0;

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
          builder: (context) => FollowsView(
            username: widget.profileModel.name,
            followers: widget.profileModel.followers ?? [],
            following: widget.profileModel.following ?? [],
          ),
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
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 16.0),
                    child: Row(
                      children: [
                        const Icon(Icons.post_add, color: Colors.black),
                        const SizedBox(width: 8),
                        Text(AppLocalizations.of(context)!.post,
                            style: const TextStyle(color: Colors.black)),
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
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 16.0),
                    child: Row(
                      children: [
                        const Icon(Icons.business, color: Colors.black),
                        const SizedBox(width: 8),
                        Text(AppLocalizations.of(context)!.project,
                            style: const TextStyle(color: Colors.black)),
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
          BuildTopPage(
            person: widget.profileModel,
          ),
          MyProfileBodyContent(profile: widget.profileModel),
          const Divider(),
          CustomTabBar(
            tabController: _tabController,
            profileModel: widget.profileModel,
          ),
          Column(
            children: [
              if (_selectedIndex == 0) ...[
                GetModel<ListUserPostModelModel>(
                  useCaseCallBack: () {
                    return GetUserPostsUseCase(homeRepository: HomeRepository())
                        .call(
                            params: GetUserPostsParams(
                                id: widget.profileModel.id ?? 0));
                  },
                  withAnimation: true,
                  modelBuilder: (model) => ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: model.data?.length ?? 0,
                    itemBuilder: (context, index) {
                      return PostListViewItem(
                        postModel: model.data![index],
                      );
                    },
                  ),
                ),
              ] else if (_selectedIndex == 1) ...[
                isUser
                    ? GetModel<ListUserProposedProjectModel>(
                        useCaseCallBack: () {
                          return GetUserProjectsUseCase(
                                  homeRepository: HomeRepository())
                              .call(
                                  params: GetUserProjectsParams(
                                      id: widget.profileModel.id ?? 0));
                        },
                        withAnimation: true,
                        modelBuilder: (model) => ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: model.data?.length ?? 0,
                          itemBuilder: (context, index) {
                            return ProjectCard(
                              project: model.data![index],
                            );
                          },
                        ),
                      )
                    : GetModel<ListPortfolioProjectModel>(
                        useCaseCallBack: () {
                          return GetArchProtfolioProjectsUseCase(
                                  profileRepository: ProfileRepository())
                              .call(
                                  params: GetArchProtfolioProjectsParams(
                                      archId: widget.profileModel.id ?? 0));
                        },
                        withAnimation: true,
                        modelBuilder: (model) => ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: model.data?.length ?? 0,
                          itemBuilder: (context, index) {
                            return PortfolioProjectCard(
                              project: model.data![index],
                            );
                          },
                        ),
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
