import 'package:flutter/material.dart';
import 'package:sketch/features/user_proposed_project/data/model/user_proposed_project_model.dart';
import 'package:sketch/features/user_proposed_project/presentation/views/widgets/user_proposed_project_details_body.dart';

class UserProposedProjectDetailsView extends StatelessWidget {
  const UserProposedProjectDetailsView({super.key, required this.project});
  final UserProposedProjectModel project;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: UserProposedProjectDetailsBody(project: project),
    ));
  }
}
