part of 'recipies_cubit.dart';

class RecipiesState extends Equatable {
  final RequestState? brandsRequestState;
  final List<Brand>? brands;
  final String? errorMessage;
  final RequestState? recipiesRequestState;
  final List<Recipie>? recipies;
  final String? recipiesErrorMessage;
  final bool? brandsPaginationLoading;
  final bool? recipiesPaginationLoading;
  const RecipiesState(
      {this.brandsRequestState = RequestState.loading,
      this.brandsPaginationLoading = false,
      this.recipiesPaginationLoading = false,
      this.brands = const [],
      this.errorMessage = '',
      this.recipiesRequestState = RequestState.loading,
      this.recipies = const [],
      this.recipiesErrorMessage = ''});

  RecipiesState copyWith(
          {RequestState? brandsRequestState,
          List<Brand>? brands,
          String? errorMessage,
          RequestState? recipiesRequestState,
          List<Recipie>? recipies,
          String? recipiesErrorMessage,
          bool? brandsPaginationLoading,
          bool? recipiesPaginationLoading}) =>
      RecipiesState(
          recipies: recipies ?? this.recipies,
          brandsPaginationLoading:
              brandsPaginationLoading ?? this.brandsPaginationLoading,
          recipiesPaginationLoading:
              recipiesPaginationLoading ?? this.recipiesPaginationLoading,
          recipiesErrorMessage:
              recipiesErrorMessage ?? this.recipiesErrorMessage,
          recipiesRequestState:
              recipiesRequestState ?? this.recipiesRequestState,
          brands: brands ?? this.brands,
          brandsRequestState: brandsRequestState ?? this.brandsRequestState,
          errorMessage: errorMessage ?? this.errorMessage);

  @override
  List<Object> get props => [
        brandsRequestState!,
        brands!,
        errorMessage!,
        recipies!,
        recipiesErrorMessage!,
        recipiesRequestState!,
        brandsPaginationLoading!,
        recipiesPaginationLoading!
      ];
}
