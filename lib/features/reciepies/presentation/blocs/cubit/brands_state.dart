part of 'brands_cubit.dart';

class BrandsState extends Equatable {
  final RequestState? recipiesRequestState;
  final List<Recipie>? recipies;
  final String? errorMessage;
  const BrandsState(
      {this.recipiesRequestState = RequestState.loading,
      this.recipies = const [],
      this.errorMessage = ''});

  BrandsState copyWith(
          {RequestState? recipiesRequestState,
          List<Recipie>? recipies,
          String? errorMessage}) =>
      BrandsState(
          recipies: recipies ?? this.recipies,
          recipiesRequestState:
              recipiesRequestState ?? this.recipiesRequestState,
          errorMessage: errorMessage ?? this.errorMessage);

  @override
  List<Object> get props => [recipiesRequestState!, recipies!, errorMessage!];
}

class BrandsInitial extends BrandsState {}
