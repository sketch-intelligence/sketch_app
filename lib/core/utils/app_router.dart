import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sketch/features/auth/presentation/views/login_view.dart';
import 'package:sketch/features/auth/presentation/views/register_view.dart';
import 'package:sketch/features/design/presentation/views/generate_design_page.dart';
import 'package:sketch/features/home/data/models/post_model.dart';
import 'package:sketch/features/home/presentation/views/widgets/post_details_view.dart';
import 'package:sketch/features/notification/presentation/views/notification_view.dart';
import 'package:sketch/features/root_navigation_screens/screens/root_screen.dart';

abstract class AppRouter {
  static const kLoginView = '/';
  static const kRegisterView = '/registerView';
  static const kHomeView = '/homeView';
  static const kPostDetailsView = '/postDetailsView';
  static const kNotificationView = '/notificationView';
  static const kDesignView = '/designView';

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: kLoginView,
        builder: (context, state) => const LoginView(),
      ),
      GoRoute(
        path: kRegisterView,
        builder: (context, state) => const RegisterView(),
      ),
      GoRoute(
        path: kHomeView,
        builder: (context, state) => const RootScreen(),
      ),
      GoRoute(
        path: kPostDetailsView,
        builder: (BuildContext context, GoRouterState state) {
          final post = state.extra as PostModel;
          return PostDetailsView(
            post: post,
          );
        },
      ),
      GoRoute(
        path: kNotificationView,
        builder: (context, state) => const NotificationView(),
      ),
      GoRoute(
        path: kDesignView,
        builder: (context, state) => const GenerateDesignPage(),
      ),
    ],
  );
}
