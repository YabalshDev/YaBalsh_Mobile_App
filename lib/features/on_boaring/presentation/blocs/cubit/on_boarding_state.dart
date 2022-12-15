part of 'on_boarding_cubit.dart';

@immutable
abstract class OnBoardingState {}

class OnBoardingInitial extends OnBoardingState {}

class PageIndex extends OnBoardingState {
  final int index;

  PageIndex({required this.index});
}
