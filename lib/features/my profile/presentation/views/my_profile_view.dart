import 'package:flutter/material.dart';
import 'package:sketch/core/boilerplate/get_model/widgets/get_model.dart';
import 'package:sketch/core/utils/adaptive_layout.dart';
import 'package:sketch/core/utils/size_config.dart';
import 'package:sketch/features/Profile/data/models/profile_model/profile_model.dart';
import 'package:sketch/features/Profile/data/repository/profile_repository.dart';
import 'package:sketch/features/Profile/data/use_case/get_profile_use_case.dart';
import 'package:sketch/features/my%20profile/presentation/widgets/my_profile_body.dart';
import 'package:sketch/translations.dart';

class MyProfilePage extends StatelessWidget {
  MyProfilePage({super.key, required this.userId});
  int userId;
  // Create an instance of ProfileModel

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: GetModel<ProfileModel>(
          useCaseCallBack: () {
            return GetProfileUseCase(
              repository: ProfileRepository(),
            ).call(
              params: GetProfileParams(userId: userId),
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
                        AppLocalizations.of(context)!
                            .myProfile, // Dynamic profile name
                      ),
                      centerTitle: true,
                    )
                  : null,
              body: AdaptiveLayout(
                mobileLayout: (context) => MyProfileBody(
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
