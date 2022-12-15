import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'on_boarding_state.dart';

class OnBoardingCubit extends Cubit<OnBoardingState> {
  OnBoardingCubit() : super(PageIndex(index: 0));

  int _currentIndex = 0;
  int get currentIndex => _currentIndex;

  void setPageIndex(int index) {
    _currentIndex = index;
    emit(PageIndex(index: index));
  }
}
