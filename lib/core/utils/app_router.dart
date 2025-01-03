import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sketch/features/auth/presentation/views/login_view.dart';
import 'package:sketch/features/auth/presentation/views/register_view.dart';
import 'package:sketch/features/design/presentation/views/generate_design_page.dart';
import 'package:sketch/features/home/data/models/post_model.dart';
import 'package:sketch/features/home/presentation/views/home_view.dart';
import 'package:sketch/features/home/presentation/views/widgets/post_details_view.dart';
import 'package:sketch/features/notification/presentation/views/notification_view.dart';
import 'package:sketch/features/root_navigation_screens/screens/root_screen.dart';
import 'package:sketch/features/user_proposed_project/data/model/user_proposed_project_model.dart';
import 'package:sketch/features/user_proposed_project/presentation/views/user_proposed_project_details_view.dart';

abstract class AppRouter {
  static const kLoginView = '/';
  static const kRegisterView = '/registerView';
  static const kHomeView = '/homeView';
  static const kRootView = '/rootView';
  static const kPostDetailsView = '/postDetailsView';
  static const kNotificationView = '/notificationView';
  static const kDesignView = '/designView';
  static const kUserProposedProjectDetails = '/userProposedProjectDetails';

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
        path: kRootView,
        builder: (context, state) => const RootScreen(),
      ),
      GoRoute(
        path: kHomeView,
        builder: (context, state) => const HomeView(),
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
      GoRoute(
        path: kUserProposedProjectDetails,
        builder: (BuildContext context, GoRouterState state) {
          final project = state.extra as UserProposedProjectModel;
          return UserProposedProjectDetailsView(
            project: project,
          );
        },
      ),
    ],
  );
}
