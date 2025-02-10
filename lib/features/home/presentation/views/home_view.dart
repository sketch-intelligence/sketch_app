import 'package:flutter/material.dart';
import 'package:sketch/core/utils/adaptive_layout.dart';
import 'package:sketch/features/home/presentation/views/widgets/mobile_home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: AdaptiveLayout(
          mobileLayout: (context) => const HomeViewBody(),
          tabletLayout: (context) => const SizedBox(),
          desktopLayout: (context) => const SizedBox(),
        ),
        // bottomNavigationBar: const CustomBottomNavigationBar(),
      ),
    );
  }
}
