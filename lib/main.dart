import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:sketch/core/classes/cashe_helper.dart';
import 'package:sketch/core/di/di.dart';
import 'package:sketch/core/payment/stripe_widget.dart';
import 'package:sketch/core/utils/app_router.dart';
import 'package:sketch/features/auth/presentation/manager/cubit/auth_cubit.dart';
import 'package:sketch/features/language/cubit/language_cubit.dart';
import 'package:sketch/features/language/cubit/language_states.dart';
import 'package:sketch/features/onboarding/cubit/onboarding_cubit.dart';
import 'package:sketch/features/profile/features/Profile/data/cubit/profile_cubit.dart';
import 'package:sketch/features/root_navigation_screens/data/cubit/root_page_cubit.dart';
import 'package:sketch/firebase_options.dart';
import 'package:sketch/translations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  Stripe.publishableKey = StripeManager.publishableKey;
  // print("Stripe publishable key: ${Stripe.publishableKey}");
  //
  await Stripe.instance.applySettings();
  try {
    // await Firebase.initializeApp();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    print("Firebase connected successfully!");
  } catch (e) {
    print("Firebase initialization error: $e");
  }
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
        BlocProvider(create: (context) => getIt<LanguageCubit>()),
        BlocProvider(create: (context) => getIt<OnBoardingCubit>()),
        BlocProvider(create: (context) => getIt<ProfileCubit>()),
      ],
      child: ScreenUtilInit(
        designSize: const Size(429, 932),
        minTextAdapt: true,
        useInheritedMediaQuery: true,
        splitScreenMode: false,
        child: OverlaySupport.global(
          child: BlocBuilder<LanguageCubit, LanguageState>(
            builder: (context, state) {
              return MaterialApp.router(
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
              );
            },
          ),
        ),
      ),
    );
  }
}
