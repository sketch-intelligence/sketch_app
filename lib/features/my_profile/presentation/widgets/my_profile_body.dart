import 'package:flutter/material.dart';
import 'package:sketch/features/Profile/Presentation/Widgets/build_top_page.dart';
import 'package:sketch/features/Profile/Presentation/Widgets/custom_tab_bar.dart';
import 'package:sketch/features/Profile/Presentation/Widgets/project_view.dart';
import 'package:sketch/features/my_profile/presentation/widgets/first.dart';
// Import your ProjectsView

class MyyProfileBody extends StatelessWidget {
  const MyyProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView( // Allow for full-page scrolling
      child: Column(
        children: [
          BuildTopPage(),
          MyProfileFirstSection(),
          Divider(), // Dividing line before tabs
          CustomTabBar(),

          // Directly include the ProjectsView here
          ProjectsView(), 
          
          
          // This will now be part of the single scrollable area
        ],
      ),
    );
  }
}