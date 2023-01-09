part of 'recipies_cubit.dart';

class RecipiesState extends Equatable {
  final RequestState? creatorsRequestState;
  final List<Creator>? creators;
  final String? errorMessage;
  const RecipiesState(
      {this.creatorsRequestState = RequestState.loading,
      this.creators = const [],
      this.errorMessage = ''});

  RecipiesState copyWith(
          {RequestState? creatorsRequestState,
          List<Creator>? creators,
          String? errorMessage}) =>
      RecipiesState(
          creators: creators ?? this.creators,
          creatorsRequestState:
              creatorsRequestState ?? this.creatorsRequestState,
          errorMessage: errorMessage ?? this.errorMessage);

  @override
  List<Object> get props => [creatorsRequestState!, creators!, errorMessage!];
}
