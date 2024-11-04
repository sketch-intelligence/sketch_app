import 'package:flutter/material.dart';
import 'package:sketch/core/utils/adaptive_layout.dart';
import 'package:sketch/core/utils/size_config.dart';
import 'package:sketch/features/home/presentation/views/widgets/bottom_navigation_bar.dart';
import 'package:sketch/features/home/presentation/views/widgets/mobile_home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      backgroundColor: const Color(0xfff8f9fa),
      body: AdaptiveLayout(
        mobileLayout: (context) => const HomeViewBody(),
        tabletLayout: (context) => const SizedBox(),
        desktopLayout: (context) => const SizedBox(),
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(),
    );
  }
}
