import 'package:go_router/go_router.dart';
import 'package:sketch/features/auth/presentation/views/login_view.dart';

abstract class AppRouter {
  static const kLoginPage = '/';
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: kLoginPage,
        builder: (context, state) => const LoginView(),
      )
    ],
  );
}
