import 'package:flutter/material.dart';
import 'package:sketch/core/utils/adaptive_layout.dart';
import 'package:sketch/core/utils/size_config.dart';
import 'package:sketch/features/my_profile/presentation/widgets/my_profile_body.dart';




class MyProfilePage extends StatelessWidget {
  const MyProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar:MediaQuery.sizeOf(context).width < SizeConfig.tablet?
         AppBar(
          backgroundColor: Colors.white,
          title: Text("My Profile",),
          centerTitle: true,
        ):null,
        body: AdaptiveLayout(
        mobileLayout: (context) => const MyyProfileBody(),
        tabletLayout: (context) => const SizedBox(),
        desktopLayout: (context) => const SizedBox(),
      ),
      ),
    );
  }
}

