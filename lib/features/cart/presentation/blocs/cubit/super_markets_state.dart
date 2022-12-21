part of 'super_markets_cubit.dart';

class SuperMarketsState extends Equatable {
  final RequestState? storeRequestState;
  final List<SuperMarketCardModel>? availableSupermarkets;
  final List<SuperMarketCardModel>? unAvailableSupermarkets;
  final int? selectedSupermarketIndex;
  const SuperMarketsState(
      {this.storeRequestState = RequestState.loading,
      this.availableSupermarkets = const [],
      this.unAvailableSupermarkets = const [],
      this.selectedSupermarketIndex = -1});

  SuperMarketsState copyWith(
      {RequestState? storeRequestState,
      List<SuperMarketCardModel>? availableSupermarkets,
      int? selectedSupermarketIndex,
      List<SuperMarketCardModel>? unAvailableSupermarkets}) {
    return SuperMarketsState(
        selectedSupermarketIndex:
            selectedSupermarketIndex ?? this.selectedSupermarketIndex,
        storeRequestState: storeRequestState ?? this.storeRequestState,
        availableSupermarkets:
            availableSupermarkets ?? this.availableSupermarkets,
        unAvailableSupermarkets:
            unAvailableSupermarkets ?? this.unAvailableSupermarkets);
  }

  @override
  List<Object> get props => [
        storeRequestState!,
        availableSupermarkets!,
        selectedSupermarketIndex!,
        unAvailableSupermarkets!
      ];
}
