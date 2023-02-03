part of 'other_branches_cubit.dart';

class OtherBranchesState extends Equatable {
  final RequestState? otherBranchesRequestState;
  final List<StoreSearch>? otherBranches;
  final String? errorMessage;
  final StoreSearch? currentStore;
  const OtherBranchesState(
      {this.otherBranchesRequestState = RequestState.loading,
      this.otherBranches = const [],
      this.currentStore = const StoreSearch(),
      this.errorMessage = ''});

  OtherBranchesState copyWith(
          {RequestState? otherBranchesRequestState,
          List<StoreSearch>? otherBranches,
          StoreSearch? currentStore,
          String? errorMessage}) =>
      OtherBranchesState(
          errorMessage: errorMessage ?? this.errorMessage,
          otherBranches: otherBranches ?? this.otherBranches,
          currentStore: currentStore ?? this.currentStore,
          otherBranchesRequestState:
              otherBranchesRequestState ?? this.otherBranchesRequestState);

  @override
  List<Object> get props => [
        otherBranches!,
        otherBranchesRequestState!,
        errorMessage!,
        currentStore!
      ];
}
