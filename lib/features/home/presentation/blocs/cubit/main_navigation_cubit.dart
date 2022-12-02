import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'main_navigation_state.dart';

class MainNavigationCubit extends Cubit<MainNavigationState> {
  MainNavigationCubit() : super(const MainNavigationPageIndex(pageIndex: 0));

  int _currentPageIndex = 0;
  int get currentPageIndex => _currentPageIndex;

  void setPageIndex(int value) {
    _currentPageIndex = value;
    emit(MainNavigationPageIndex(pageIndex: value));
  }
}
