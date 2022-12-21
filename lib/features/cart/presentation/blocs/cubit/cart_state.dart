part of 'cart_cubit.dart';

class CartState extends Equatable {
  final List<CartItem>? cartItems;
  final String? errorMessage;
  final RequestState? storeRequestState;
  final List<Store>? superMarkets;
  final int? cartStepIndex;
  final bool? isSupermatketSelected;
  final bool? canConfirmOrder;
  const CartState(
      {this.cartItems = const [],
      this.canConfirmOrder = false,
      this.isSupermatketSelected = false,
      this.errorMessage = '',
      this.cartStepIndex = 0,
      this.storeRequestState = RequestState.loading,
      this.superMarkets = const []});

  CartState copyWith(
      {List<CartItem>? cartItems,
      String? errorMessage,
      RequestState? storeRequestState,
      int? cartStepIndex,
      bool? isSupermatketSelected,
      bool? canConfirmOrder,
      List<Store>? superMarkets}) {
    return CartState(
        cartItems: cartItems ?? this.cartItems,
        canConfirmOrder: canConfirmOrder ?? this.canConfirmOrder,
        isSupermatketSelected:
            isSupermatketSelected ?? this.isSupermatketSelected,
        errorMessage: errorMessage ?? this.errorMessage,
        storeRequestState: storeRequestState ?? this.storeRequestState,
        cartStepIndex: cartStepIndex ?? this.cartStepIndex,
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
        isSupermatketSelected!,
        canConfirmOrder!
      ];
}
