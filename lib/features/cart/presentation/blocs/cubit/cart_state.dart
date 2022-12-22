part of 'cart_cubit.dart';

class CartState extends Equatable {
  final List<CartItem>? cartItems;
  final String? errorMessage;
  final RequestState? storeRequestState;
  final List<Store>? superMarkets;
  final int? cartStepIndex;
  final SuperMarketCardModel? supermarket;
  final Address? userAddress;
  final OrderRequest? orderRequest;
  const CartState(
      {this.cartItems = const [],
      this.supermarket = const SuperMarketCardModel(),
      this.userAddress = const Address(),
      this.orderRequest = const OrderRequest(),
      this.errorMessage = '',
      this.cartStepIndex = 0,
      this.storeRequestState = RequestState.loading,
      this.superMarkets = const []});

  CartState copyWith(
      {List<CartItem>? cartItems,
      String? errorMessage,
      RequestState? storeRequestState,
      int? cartStepIndex,
      SuperMarketCardModel? supermarket,
      Address? userAddress,
      OrderRequest? orderRequest,
      List<Store>? superMarkets}) {
    return CartState(
        cartItems: cartItems ?? this.cartItems,
        supermarket: supermarket ?? this.supermarket,
        userAddress: userAddress ?? this.userAddress,
        errorMessage: errorMessage ?? this.errorMessage,
        storeRequestState: storeRequestState ?? this.storeRequestState,
        cartStepIndex: cartStepIndex ?? this.cartStepIndex,
        orderRequest: orderRequest ?? this.orderRequest,
        superMarkets: superMarkets ?? this.superMarkets);
  }

  @override
  List<Object> get props => [
        cartItems!,
        cartStepIndex!,
        storeRequestState!,
        cartItems!,
        errorMessage!,
        superMarkets!,
        supermarket!,
        userAddress!,
        orderRequest!
      ];
}
