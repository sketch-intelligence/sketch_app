import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:sketch/core/classes/cashe_helper.dart';
import 'package:sketch/core/di/di.dart';
import 'package:sketch/core/utils/app_router.dart';
import 'package:sketch/features/auth/presentation/manager/cubit/auth_cubit.dart';
import 'package:sketch/features/root_navigation_screens/data/cubit/root_page_cubit.dart';
import 'package:sketch/translations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  setUp();
  runApp(const Sketch());
}

class Sketch extends StatelessWidget {
  const Sketch({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt<RootPageCubit>()),
        BlocProvider(create: (context) => getIt<AuthCubit>()),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: AppRouter.router,
        locale: Locale(CacheHelper.lang),
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('en', ''),
          Locale('ar', ''),
        ],
        theme: ThemeData(
          iconTheme: const IconThemeData(color: Colors.white),
        ),
      ),
    );
  }
}
