import 'package:flutter/material.dart';
import 'package:sketch/features/Profile/Presentation/Widgets/build_top_page.dart';
import 'package:sketch/features/Profile/Presentation/Widgets/custom_tab_bar.dart';
import 'package:sketch/features/Profile/Presentation/Widgets/first_section_content.dart';
import 'package:sketch/features/Profile/Presentation/Widgets/project_view.dart';
// Import your ProjectsView

class ProfileBody extends StatelessWidget {
  const ProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      // Allow for full-page scrolling
      child: Column(
        children: [
          const BuildTopPage(),
          const TheFirstSection(),
          const Divider(), // Dividing line before tabs
          const CustomTabBar(),

          // Directly include the ProjectsView here
          ProjectsView(),

          // This will now be part of the single scrollable area
        ],
      ),
    );
  }
}
