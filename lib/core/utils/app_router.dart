import 'package:go_router/go_router.dart';
import 'package:sketch/features/auth/presentation/views/login_view.dart';
import 'package:sketch/features/auth/presentation/views/register_view.dart';

abstract class AppRouter {
  static const kLoginView = '/';
  static const kRegisterView = '/registerView';

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: kLoginView,
        builder: (context, state) => const LoginView(),
      ),
      GoRoute(
        path: kRegisterView,
        builder: (context, state) => const RegisterView(),
      )
    ],
  );
}
