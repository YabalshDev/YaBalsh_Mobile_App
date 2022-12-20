part of 'super_markets_cubit.dart';

class SuperMarketsState extends Equatable {
  final RequestState? storeRequestState;
  final List<SuperMarketCardModel>? superMarkets;
  final int? selectedSupermarketIndex;
  const SuperMarketsState(
      {this.storeRequestState = RequestState.loading,
      this.superMarkets = const [],
      this.selectedSupermarketIndex = -1});

  SuperMarketsState copyWith({
    RequestState? storeRequestState,
    List<SuperMarketCardModel>? superMarkets,
    int? selectedSupermarketIndex,
  }) {
    return SuperMarketsState(
        selectedSupermarketIndex:
            selectedSupermarketIndex ?? this.selectedSupermarketIndex,
        storeRequestState: storeRequestState ?? this.storeRequestState,
        superMarkets: superMarkets ?? this.superMarkets);
  }

  @override
  List<Object> get props =>
      [storeRequestState!, superMarkets!, selectedSupermarketIndex!];
}
