import 'package:flutter/material.dart';
import 'package:sketch/core/utils/adaptive_layout.dart';
import 'package:sketch/features/auth/presentation/views/widgets/mobile_login_view_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AdaptiveLayout(
        mobileLayout: (context) => const MobileLoginViewBody(),
        tabletLayout: (context) => const SizedBox(),
        desktopLayout: (context) => const SizedBox(),
      ),
    );
  }
}
