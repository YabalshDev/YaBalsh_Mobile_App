import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:get/get.dart';
import 'package:yabalash_mobile_app/core/usecases/use_cases.dart';

import 'package:yabalash_mobile_app/core/utils/enums/request_state.dart';
import 'package:yabalash_mobile_app/core/widgets/custom_dialog.dart';
import 'package:yabalash_mobile_app/features/cart/domain/usecases/add_cart_item_usecase.dart';
import 'package:yabalash_mobile_app/features/cart/domain/usecases/clear_cart_usecase.dart';
import 'package:yabalash_mobile_app/features/cart/domain/usecases/decrement_quantity_usecase.dart';
import 'package:yabalash_mobile_app/features/cart/domain/usecases/delete_cartItem.dart';
import 'package:yabalash_mobile_app/features/cart/domain/usecases/fetch_cart_items_usecase.dart';
import 'package:yabalash_mobile_app/features/cart/domain/usecases/get_store_usecase.dart';
import 'package:yabalash_mobile_app/features/cart/domain/usecases/increment_quantity.dart';

import '../../../../home/domain/entities/product.dart';
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

  void changeCurrentCartStep(int value) {
    emit(state.copyWith(cartStepIndex: value));
  }

  bool checkIfItemisInCart(Product product) {
    bool isExist = false;
    CartItem? cartItem = state.cartItems!.firstWhere(
      (element) => element.product!.id == product.id,
      orElse: () => const CartItem(),
    );

    if (cartItem.product != null) {
      isExist = true;
    }

    return isExist;
  }

  void fetchCartItems() {
    final response = fetchCartItemsUseCase(NoParams());
    response.fold((failure) {
      emit(state.copyWith(errorMessage: failure.message));
    }, (cartItems) {
      emit(state.copyWith(cartItems: cartItems));
    });
  }

  void addItemToCart(Product product) {
    final isProductExist = checkIfItemisInCart(product);
    CartItem? cartItem;
    if (isProductExist) {
      cartItem = state.cartItems!
          .firstWhere((element) => element.product!.id == product.id);
      cartItem.copyWith(quantity: cartItem.quantity! + 1);
    } else {
      cartItem = CartItem(product: product, quantity: 1);
    }

    final response = addCartItemUseCase(QuantityParams(cartItem: cartItem));

    response.fold((failure) {
      emit(state.copyWith(errorMessage: failure.message));
    }, (success) {
      emit(state.copyWith(
          cartItems: List.from(state.cartItems!)..add(cartItem!)));
      yaBalashCustomDialog(
        isWithEmoji: false,
        buttonTitle: 'حسنا',
        mainContent: 'تمت اضافة المنتج الى السلة',
        title: 'ملاحظة',
        onConfirm: () => Get.back(),
      );
    });
  }

  void deleteItemFromCart(Product product) {
    final cartItem = state.cartItems!
        .firstWhere((element) => element.product!.id == product.id);

    final response = deleteCartItemUseCase(QuantityParams(cartItem: cartItem));

    response.fold((failure) {
      yaBalashCustomDialog(
        isWithEmoji: false,
        buttonTitle: 'حسنا',
        mainContent: failure.message,
        title: 'خطأ',
        onConfirm: () => Get
          ..back()
          ..back(),
      );
      emit(state.copyWith(errorMessage: failure.message));
      emit(state.copyWith(errorMessage: ''));
    },
        (success) => emit(state.copyWith(
            cartItems: List.from(state.cartItems!)..remove(cartItem))));
  }
}
