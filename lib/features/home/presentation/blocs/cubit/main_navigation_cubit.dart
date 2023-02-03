import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

part 'main_navigation_state.dart';

class MainNavigationCubit extends Cubit<MainNavigationState> {
  MainNavigationCubit()
      : super(MainNavigationPageIndex(
            pageIndex: 0, pageController: PageController()));

  int _currentPageIndex = 0;
  int get currentPageIndex => _currentPageIndex;

  void setPageIndex(int value) {
    _currentPageIndex = value;
    emit((state as MainNavigationPageIndex).copyWith(pageIndex: value));
  }

  void setPageController(PageController pageController) {
    emit((state as MainNavigationPageIndex)
        .copyWith(pageController: pageController));
  }

  void changePage(int index) {
    setPageIndex(index);
    (state as MainNavigationPageIndex).pageController.jumpToPage(
          index,
        );
  }
}
