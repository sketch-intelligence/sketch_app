import 'package:flutter/material.dart';
import 'package:sketch/features/Profile/Presentation/Widgets/custom_tab_bar.dart';
import 'package:sketch/features/Profile/Presentation/Widgets/first_section_content.dart';
import 'package:sketch/features/Profile/Presentation/Widgets/project_view.dart';
import 'package:sketch/features/my%20profile/presentation/widgets/build_top_page.dart';
// Import your ProjectsView

class ProfileBody extends StatelessWidget {
  const ProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      // Allow for full-page scrolling
      child: Column(
        children: [
          BuildTopPage(),
          TheFirstSection(),
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
