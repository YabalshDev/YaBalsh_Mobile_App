part of 'recipie_details_cubit.dart';

class RecipieDetailsState extends Equatable {
  final RequestState? recipieRequestState;
  final Recipie? recipie;
  final String? errorMessage;
  const RecipieDetailsState(
      {this.recipieRequestState = RequestState.loading,
      this.recipie = const Recipie(),
      this.errorMessage = ''});

  RecipieDetailsState copyWith(
          {RequestState? recipieRequestState,
          Recipie? recipie,
          String? errorMessage}) =>
      RecipieDetailsState(
          recipie: recipie ?? this.recipie,
          recipieRequestState: recipieRequestState ?? this.recipieRequestState,
          errorMessage: errorMessage ?? this.errorMessage);

  @override
  List<Object> get props => [recipieRequestState!, recipie!, errorMessage!];
}
