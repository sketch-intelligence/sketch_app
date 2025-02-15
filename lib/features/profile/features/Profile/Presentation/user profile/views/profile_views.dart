import 'package:flutter/material.dart';
import 'package:sketch/core/boilerplate/get_model/widgets/get_model.dart';
import 'package:sketch/core/utils/adaptive_layout.dart';
import 'package:sketch/features/profile/features/Profile/Presentation/user%20profile/Widgets/profile_body.dart';
import 'package:sketch/features/profile/features/Profile/data/models/profile_model/profile_model.dart';
import 'package:sketch/features/profile/features/Profile/data/repository/profile_repository.dart';
import 'package:sketch/features/profile/features/Profile/data/use_case/get_profile_use_case.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key, required this.userId});
  int userId;
  // Create an instance of ProfileModel

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: GetModel<ProfileModel>(useCaseCallBack: () {
            return GetProfileUseCase(
              repository: ProfileRepository(),
            ).call(
              params: GetProfileParams(userId: userId),
            );
          }, modelBuilder: (model) {
            return AdaptiveLayout(
              mobileLayout: (context) => ProfileBody(
                profileModel: model,
              ),
              tabletLayout: (context) => const SizedBox(),
              desktopLayout: (context) => const SizedBox(),
            );
          }),
        ),
      ),
    );
  }
}
