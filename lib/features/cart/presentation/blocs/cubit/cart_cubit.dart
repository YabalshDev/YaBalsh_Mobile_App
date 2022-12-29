import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:get/get.dart';
import 'package:yabalash_mobile_app/core/usecases/use_cases.dart';

import 'package:yabalash_mobile_app/core/utils/enums/request_state.dart';
import 'package:yabalash_mobile_app/core/widgets/custom_dialog.dart';
import 'package:yabalash_mobile_app/features/addresses/domain/entities/address.dart';
import 'package:yabalash_mobile_app/features/cart/domain/entities/supermarket_card_model.dart';
import 'package:yabalash_mobile_app/features/cart/domain/usecases/add_cart_item_usecase.dart';
import 'package:yabalash_mobile_app/features/cart/domain/usecases/clear_cart_usecase.dart';
import 'package:yabalash_mobile_app/features/cart/domain/usecases/decrement_quantity_usecase.dart';
import 'package:yabalash_mobile_app/features/cart/domain/usecases/delete_cartItem.dart';
import 'package:yabalash_mobile_app/features/cart/domain/usecases/fetch_cart_items_usecase.dart';
import 'package:yabalash_mobile_app/features/cart/domain/usecases/increment_quantity.dart';
import 'package:yabalash_mobile_app/features/shopping_lists/domain/entities/shopping_list.dart';
import 'package:yabalash_mobile_app/features/shopping_lists/domain/usecases/add_shopping_list_usecase.dart';

import '../../../../home/domain/entities/product.dart';
import '../../../../home/domain/entities/store.dart';
import '../../../../orders/domain/entities/order_request.dart';
import '../../../domain/entities/cart_item.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  final FetchCartItemsUseCase fetchCartItemsUseCase;
  final IncrementQuantityUseCase incrementQuantityUseCase;
  final DecrementQuantityUseCase decrementQuantityUseCase;
  final AddCartItemUseCase addCartItemUseCase;
  final DeleteCartItemUseCase deleteCartItemUseCase;
  final ClearCartUseCase clearCartUseCase;
  final AddShoppingListUseCase addShoppingListUseCase;
  CartCubit(
      {required this.fetchCartItemsUseCase,
      required this.addShoppingListUseCase,
      required this.incrementQuantityUseCase,
      required this.decrementQuantityUseCase,
      required this.addCartItemUseCase,
      required this.deleteCartItemUseCase,
      required this.clearCartUseCase})
      : super(const CartState());

  List<CartItem> _cart = [];
  List<CartItem> get cart => _cart;

  void resetCart() {
    emit(const CartState());
  }

  void addShoppingList({required String shoppingListName}) {
    final ShoppingList shoppingList =
        ShoppingList(name: shoppingListName, products: state.cartItems);

    final response = addShoppingListUseCase(ShoppingListParams(shoppingList));

    response.fold(
        (failure) => yaBalashCustomDialog(
              isWithEmoji: false,
              buttonTitle: 'حسنا',
              mainContent: failure.message,
              title: 'خطأ',
              onConfirm: () => Get.back(),
            ),
        (success) => yaBalashCustomDialog(
              isWithEmoji: false,
              buttonTitle: 'حسنا',
              mainContent: 'تمت اضافة قائمة التسوق',
              title: 'ملاحظة',
              onConfirm: () => Get.back(),
            ));
  }

  void clearCart() {
    bool isSuccess = false;
    final response = clearCartUseCase(NoParams());
    response.fold(
        (failure) => yaBalashCustomDialog(
              isWithEmoji: false,
              buttonTitle: 'حسنا',
              mainContent: failure.message,
              title: 'خطأ',
              onConfirm: () => Get
                ..back()
                ..back(),
            ),
        (r) => isSuccess = true);

    if (isSuccess) {
      emit(state.copyWith(cartItems: []));
      // Get.back();
    }
    // if (!getIt<CartCubit>().isClosed) {
    //   // yaBalashCustomDialog(
    //   //   isWithEmoji: false,
    //   //   buttonTitle: 'حسنا',
    //   //   mainContent: 'هل انت متاكد من ازالة السلة؟',
    //   //   title: 'ملاحظة',
    //   //   onConfirm: () {
    //   //     final response = clearCartUseCase(NoParams());
    //   //     response.fold(
    //   //         (failure) => yaBalashCustomDialog(
    //   //               isWithEmoji: false,
    //   //               buttonTitle: 'حسنا',
    //   //               mainContent: failure.message,
    //   //               title: 'خطأ',
    //   //               onConfirm: () => Get
    //   //                 ..back()
    //   //                 ..back(),
    //   //             ),
    //   //         (r) => );
    //   //     Get.back();
    //   //   },
    //   // );
    // }
  }

  void changeCurrentCartStep(int value) {
    emit(state.copyWith(cartStepIndex: value));
  }

  void changeSupermarketSelected(SuperMarketCardModel value) {
    emit(state.copyWith(supermarket: value));
  }

  void changeSelectedUserAddress(Address value) {
    emit(state.copyWith(userAddress: value));
  }

  void handleDeleteDialogOnClose() {
    emit(state.copyWith(errorMessage: 'error'));
    emit(state.copyWith(errorMessage: ''));
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
      _cart = cartItems;
      emit(state.copyWith(cartItems: _cart));
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
      _cart = List.from(state.cartItems!)..add(cartItem!);
      emit(state.copyWith(cartItems: _cart));
      yaBalashCustomDialog(
        isWithEmoji: false,
        buttonTitle: 'حسنا',
        mainContent:
            !isProductExist ? 'تمت اضافة المنتج الى السلة' : 'تمت تحديث الكمية',
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
    }, (success) {
      _cart = List.from(state.cartItems!)..remove(cartItem);
      emit(state.copyWith(cartItems: _cart));
      Get.back();
    });
  }

  void incrementQuantity(Product product) {
    List<CartItem> updatedList = List.from(state.cartItems!);
    CartItem cartItem = state.cartItems!
        .firstWhere((element) => element.product!.id == product.id);

    final index = state.cartItems!.indexOf(cartItem);

    updatedList[index] = cartItem.copyWith(quantity: cartItem.quantity! + 1);

    final response =
        incrementQuantityUseCase(QuantityParams(cartItem: cartItem));
    response.fold((l) {}, (r) {
      _cart = List.from(updatedList);
      emit(state.copyWith(cartItems: updatedList));
    });
  }

  void decrementQuantity(Product product) {
    List<CartItem> updatedList = List.from(state.cartItems!);
    CartItem cartItem = state.cartItems!
        .firstWhere((element) => element.product!.id == product.id);

    final index = state.cartItems!.indexOf(cartItem);

    updatedList[index] = cartItem.copyWith(quantity: cartItem.quantity! - 1);

    final response =
        incrementQuantityUseCase(QuantityParams(cartItem: cartItem));
    response.fold((l) {}, (r) {
      _cart = List.from(updatedList);
      emit(state.copyWith(cartItems: updatedList));
    });
  }

  @override
  Future<void> close() {
    print('cart closed');
    return super.close();
  }
}
