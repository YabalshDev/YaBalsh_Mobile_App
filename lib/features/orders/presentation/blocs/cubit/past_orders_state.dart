part of 'past_orders_cubit.dart';

class PastOrdersState extends Equatable {
  final List<Order>? pendingOrders;
  final List<Order>? completedOrders;
  final RequestState? ordersRequestState;
  final String? errorMessage;
  const PastOrdersState(
      {this.pendingOrders = const [],
      this.completedOrders = const [],
      this.ordersRequestState = RequestState.loading,
      this.errorMessage = ''});

  PastOrdersState copyWith(
          {List<Order>? pendingOrders,
          List<Order>? completedOrders,
          RequestState? ordersRequestState,
          String? errorMessage}) =>
      PastOrdersState(
          completedOrders: completedOrders ?? this.completedOrders,
          errorMessage: errorMessage ?? this.errorMessage,
          ordersRequestState: ordersRequestState ?? this.ordersRequestState,
          pendingOrders: pendingOrders ?? this.pendingOrders);

  @override
  List<Object> get props =>
      [pendingOrders!, completedOrders!, ordersRequestState!, errorMessage!];
}
