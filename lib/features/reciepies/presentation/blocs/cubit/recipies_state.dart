part of 'recipies_cubit.dart';

class RecipiesState extends Equatable {
  final RequestState? brandsRequestState;
  final List<Brand>? brands;
  final String? errorMessage;
  const RecipiesState(
      {this.brandsRequestState = RequestState.loading,
      this.brands = const [],
      this.errorMessage = ''});

  RecipiesState copyWith(
          {RequestState? brandsRequestState,
          List<Brand>? brands,
          String? errorMessage}) =>
      RecipiesState(
          brands: brands ?? this.brands,
          brandsRequestState: brandsRequestState ?? this.brandsRequestState,
          errorMessage: errorMessage ?? this.errorMessage);

  @override
  List<Object> get props => [brandsRequestState!, brands!, errorMessage!];
}
