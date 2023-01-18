part of 'main_navigation_cubit.dart';

abstract class MainNavigationState extends Equatable {
  const MainNavigationState();

  @override
  List<Object> get props => [];
}

class MainNavigationInitial extends MainNavigationState {}

class MainNavigationPageIndex extends MainNavigationState {
  final int pageIndex;
  final PageController pageController;

  const MainNavigationPageIndex(
      {required this.pageIndex, required this.pageController});

  MainNavigationPageIndex copyWith(
          {int? pageIndex, PageController? pageController}) =>
      MainNavigationPageIndex(
          pageIndex: pageIndex ?? this.pageIndex,
          pageController: pageController ?? this.pageController);
  @override
  List<Object> get props => [pageIndex, pageController];
}
