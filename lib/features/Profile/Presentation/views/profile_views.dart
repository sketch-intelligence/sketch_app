import 'package:flutter/material.dart';

import 'package:sketch/core/utils/adaptive_layout.dart';

import 'package:sketch/core/utils/size_config.dart';

import 'package:sketch/features/Profile/Presentation/Widgets/profile_body.dart';



class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar:MediaQuery.sizeOf(context).width < SizeConfig.tablet?
         AppBar(
          backgroundColor: Colors.white,
          title: Text("Kattie Lee",),
          centerTitle: true,
        ):null,
        body: AdaptiveLayout(
        mobileLayout: (context) => const ProfileBody(),
        tabletLayout: (context) => const SizedBox(),
        desktopLayout: (context) => const SizedBox(),
      ),
      ),
    );
  }
}

