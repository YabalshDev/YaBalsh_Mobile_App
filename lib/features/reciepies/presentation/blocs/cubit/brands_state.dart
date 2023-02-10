part of 'brands_cubit.dart';

class BrandsState extends Equatable {
  final RequestState? recipiesRequestState;
  final List<Recipie>? recipies;
  final String? errorMessage;
  final bool? paginationLoading;

  const BrandsState(
      {this.recipiesRequestState = RequestState.loading,
      this.recipies = const [],
      this.paginationLoading = false,
      this.errorMessage = ''});

  BrandsState copyWith(
          {RequestState? recipiesRequestState,
          List<Recipie>? recipies,
          bool? paginationLoading,
          String? errorMessage}) =>
      BrandsState(
          paginationLoading: paginationLoading ?? this.paginationLoading,
          recipies: recipies ?? this.recipies,
          recipiesRequestState:
              recipiesRequestState ?? this.recipiesRequestState,
          errorMessage: errorMessage ?? this.errorMessage);

  @override
  List<Object> get props =>
      [recipiesRequestState!, recipies!, errorMessage!, paginationLoading!];
}
