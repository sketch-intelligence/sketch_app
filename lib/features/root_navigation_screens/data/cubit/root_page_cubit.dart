import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sketch/features/root_navigation_screens/data/cubit/root_page_state.dart';

class RootPageCubit extends Cubit<RootPageStates> {
  int rootIndex = 0;
  int homeIndex = 0;
  String? keywordsFarm;
  CarouselSliderController carouselController = CarouselSliderController();
  RootPageCubit() : super(RootPageInitialState());

  void changePageIndex(int pageIndex) {
    rootIndex = pageIndex;
    emit(ChangeIndexState());
  }

  void changeHomePageIndex(int pageIndex) {
    homeIndex = pageIndex;
    emit(ChangeIndexState());
  }
}
