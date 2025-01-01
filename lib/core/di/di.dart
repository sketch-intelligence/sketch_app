import 'package:get_it/get_it.dart';
import 'package:sketch/features/root_navigation_screens/data/cubit/root_page_cubit.dart';

final getIt = GetIt.instance;

void setUp() {
  //blocs
  getIt.registerLazySingleton(() => RootPageCubit());
}
