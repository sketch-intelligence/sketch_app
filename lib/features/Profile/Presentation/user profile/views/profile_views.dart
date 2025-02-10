import 'package:flutter/material.dart';
import 'package:sketch/core/boilerplate/get_model/widgets/get_model.dart';
import 'package:sketch/core/utils/adaptive_layout.dart';
import 'package:sketch/core/utils/size_config.dart';
import 'package:sketch/features/Profile/Presentation/user%20profile/Widgets/profile_body.dart';
import 'package:sketch/features/Profile/data/models/profile_model/profile_model.dart';
import 'package:sketch/features/Profile/data/models/profile_user_model.dart';
import 'package:sketch/features/Profile/data/repository/profile_repository.dart';
import 'package:sketch/features/Profile/data/use_case/get_profile_use_case.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key, required this.uid});
  final int uid;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: GetModel<ProfileModel>(
          useCaseCallBack: () {
            return GetProfileUseCase(
              repository: ProfileRepository(),
            ).call(
              params: GetProfileParams(userId: uid),
            );
          },
          modelBuilder: (model) {
            return SafeArea(
                child: Scaffold(
              backgroundColor: Colors.white,
              appBar: MediaQuery.sizeOf(context).width < SizeConfig.tablet
                  ? AppBar(
                      backgroundColor: Colors.white,
                      title: Text(
                        model.name ?? '', // Dynamic profile name
                      ),
                      centerTitle: true,
                    )
                  : null,
              body: AdaptiveLayout(
                mobileLayout: (context) => ProfileBody(
                  profileModel: model,
                ),
                tabletLayout: (context) => const SizedBox(),
                desktopLayout: (context) => const SizedBox(),
              ),
            ));
          },
        ));
  }
}
