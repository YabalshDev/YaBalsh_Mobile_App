import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:yabalash_mobile_app/core/usecases/use_cases.dart';

import 'package:yabalash_mobile_app/core/utils/enums/request_state.dart';
import 'package:yabalash_mobile_app/features/cart/domain/usecases/add_cart_item_usecase.dart';
import 'package:yabalash_mobile_app/features/cart/domain/usecases/clear_cart_usecase.dart';
import 'package:yabalash_mobile_app/features/cart/domain/usecases/decrement_quantity_usecase.dart';
import 'package:yabalash_mobile_app/features/cart/domain/usecases/delete_cartItem.dart';
import 'package:yabalash_mobile_app/features/cart/domain/usecases/fetch_cart_items_usecase.dart';
import 'package:yabalash_mobile_app/features/cart/domain/usecases/get_store_usecase.dart';
import 'package:yabalash_mobile_app/features/cart/domain/usecases/increment_quantity.dart';

import '../../../../home/domain/entities/store.dart';
import '../../../domain/entities/cart_item.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  final GetStoreUseCase getStoreUseCase;
  final FetchCartItemsUseCase fetchCartItemsUseCase;
  final IncrementQuantityUseCase incrementQuantityUseCase;
  final DecrementQuantityUseCase decrementQuantityUseCase;
  final AddCartItemUseCase addCartItemUseCase;
  final DeleteCartItemUseCase deleteCartItemUseCase;
  final ClearCartUseCase clearCartUseCase;
  CartCubit(
      {required this.getStoreUseCase,
      required this.fetchCartItemsUseCase,
      required this.incrementQuantityUseCase,
      required this.decrementQuantityUseCase,
      required this.addCartItemUseCase,
      required this.deleteCartItemUseCase,
      required this.clearCartUseCase})
      : super(const CartState());

  void fetchCartItems() {
    final response = fetchCartItemsUseCase(NoParams());
    response.fold((failure) {
      emit(state.copyWith(errorMessage: failure.message));
    }, (cartItems) {
      emit(state.copyWith(cartItems: cartItems));
    });
  }
}
