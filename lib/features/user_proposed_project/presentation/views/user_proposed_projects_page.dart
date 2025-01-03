import 'package:flutter/material.dart';
import 'package:sketch/features/user_proposed_project/presentation/views/widgets/user_proposed_projects_page_body.dart';

class UserProposedProjectsPage extends StatelessWidget {
  const UserProposedProjectsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: UserProposedProjectsPageBody(),
    );
  }
}
