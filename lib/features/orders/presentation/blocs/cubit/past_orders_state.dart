part of 'past_orders_cubit.dart';

class PastOrdersState extends Equatable {
  final List<Order>? pendingOrders;
  final List<Order>? completedOrders;
  final RequestState? ordersRequestState;
  final String? errorMessage;
  final bool? paginationLoading;
  const PastOrdersState(
      {this.pendingOrders = const [],
      this.completedOrders = const [],
      this.paginationLoading = false,
      this.ordersRequestState = RequestState.loading,
      this.errorMessage = ''});

  PastOrdersState copyWith(
          {List<Order>? pendingOrders,
          List<Order>? completedOrders,
          RequestState? ordersRequestState,
          bool? paginationLoading,
          String? errorMessage}) =>
      PastOrdersState(
          paginationLoading: paginationLoading ?? this.paginationLoading,
          completedOrders: completedOrders ?? this.completedOrders,
          errorMessage: errorMessage ?? this.errorMessage,
          ordersRequestState: ordersRequestState ?? this.ordersRequestState,
          pendingOrders: pendingOrders ?? this.pendingOrders);

  @override
  List<Object> get props => [
        pendingOrders!,
        completedOrders!,
        ordersRequestState!,
        errorMessage!,
        paginationLoading!
      ];
}
