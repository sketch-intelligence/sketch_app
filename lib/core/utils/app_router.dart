import 'package:go_router/go_router.dart';
import 'package:sketch/features/auth/presentation/views/login_view.dart';
import 'package:sketch/features/auth/presentation/views/register_view.dart';
import 'package:sketch/features/home/presentation/views/home_view.dart';

abstract class AppRouter {
  static const kLoginView = '/';
  static const kRegisterView = '/registerView';
  static const kHomeView = '/homeView';

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
        builder: (context, state) => const HomeView(),
      )
    ],
  );
}
