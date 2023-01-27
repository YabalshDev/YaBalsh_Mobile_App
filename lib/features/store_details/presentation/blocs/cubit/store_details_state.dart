part of 'store_details_cubit.dart';

class StoreDetailsState extends Equatable {
  final StoreSearch? store;
  const StoreDetailsState({this.store = const StoreSearch()});

  @override
  List<Object> get props => [store!];
}
