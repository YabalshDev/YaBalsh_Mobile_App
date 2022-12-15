part of 'main_navigation_cubit.dart';

abstract class MainNavigationState extends Equatable {
  const MainNavigationState();

  @override
  List<Object> get props => [];
}

class MainNavigationInitial extends MainNavigationState {}

class MainNavigationPageIndex extends MainNavigationState {
  final int pageIndex;

  const MainNavigationPageIndex({required this.pageIndex});
  @override
  List<Object> get props => [pageIndex];
}
