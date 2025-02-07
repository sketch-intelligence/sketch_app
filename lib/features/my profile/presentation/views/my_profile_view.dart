import 'package:flutter/material.dart';
import 'package:sketch/core/utils/adaptive_layout.dart';
import 'package:sketch/core/utils/size_config.dart';
import 'package:sketch/features/Profile/Presentation/user%20profile/Widgets/profile_body.dart';
import 'package:sketch/features/Profile/data/models/profile_user_model.dart';
import 'package:sketch/features/home/data/models/person_model.dart';
import 'package:sketch/features/my%20profile/presentation/widgets/my_profile_body.dart';

class MyProfilePage extends StatelessWidget {
  MyProfilePage({super.key});

  // Create an instance of ProfileModel

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: MediaQuery.sizeOf(context).width < SizeConfig.tablet
            ? AppBar(
                backgroundColor: Colors.white,
                title: Text("My Profile"), // Use username here
                centerTitle: true,
              )
            : null,
        body: AdaptiveLayout(
          mobileLayout: (context) => MyProfileBody(),
          tabletLayout: (context) => const SizedBox(),
          desktopLayout: (context) => const SizedBox(),
        ),
      ),
    );
  }
}
