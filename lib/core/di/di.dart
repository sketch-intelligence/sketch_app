import 'package:get_it/get_it.dart';
import 'package:sketch/features/auth/presentation/manager/cubit/auth_cubit.dart';
import 'package:sketch/features/language/cubit/language_cubit.dart';
import 'package:sketch/features/onboarding/cubit/onboarding_cubit.dart';
import 'package:sketch/features/profile/features/profile/data/cubit/profile_cubit.dart';
import 'package:sketch/features/root_navigation_screens/data/cubit/root_page_cubit.dart';

final getIt = GetIt.instance;

void setUp() {
  //blocs
  getIt.registerLazySingleton(() => RootPageCubit());
  getIt.registerLazySingleton(() => AuthCubit());
  getIt.registerLazySingleton(() => LanguageCubit());
  getIt.registerLazySingleton(() => OnBoardingCubit());
  getIt.registerLazySingleton(() => ProfileCubit());
}
