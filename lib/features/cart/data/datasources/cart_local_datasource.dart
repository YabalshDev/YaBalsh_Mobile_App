import 'package:hive/hive.dart';

import '../../../../core/constants/app_strings.dart';
import '../../../../core/errors/exceptions.dart';
import '../../domain/entities/cart_item.dart';

abstract class CartLocalDataSource {
  List<CartItem> fetchCartItems();
  void addItemToCart({required CartItem cartItem});
  void deleteCartItem({required CartItem cartItem});
  void clearCart();
  void incrementQuantity({required CartItem cartItem, int? quantity});

  void decrementQuantity({required CartItem cartItem, int? quantity});
}

class CartLocalDataSourceImpl implements CartLocalDataSource {
  @override
  void addItemToCart({required CartItem cartItem}) =>
      _setCartLocalStorage(cartItem: cartItem);

  @override
  void clearCart() async {
    try {
      if (!Hive.isBoxOpen(AppStrings.cartKey)) {
        await Hive.openBox<CartItem>(AppStrings.cartKey);
      }
      final box = Hive.box<CartItem>(AppStrings.cartKey);
      box.clear();
      box.close();
    } catch (err) {
      throw CacheException();
    }
  }

  @override
  void decrementQuantity({required CartItem cartItem, int? quantity}) =>
      _setCartLocalStorage(cartItem: cartItem);

  @override
  void deleteCartItem({required CartItem cartItem}) async {
    try {
      if (!Hive.isBoxOpen(AppStrings.cartKey)) {
        await Hive.openBox<CartItem>(AppStrings.cartKey);
      }
      final box = Hive.box<CartItem>(AppStrings.cartKey);
      box.delete(cartItem.product!.id);
      box.close();
    } catch (err) {
      throw CacheException();
    }
  }

  @override
  List<CartItem> fetchCartItems() {
    try {
      if (!Hive.isBoxOpen(AppStrings.cartKey)) {
        Hive.openBox<CartItem>(AppStrings.cartKey);
      }
      final box = Hive.box<CartItem>(AppStrings.cartKey);
      return box.values.toList();
    } catch (err) {
      throw CacheException();
    }
  }

  @override
  void incrementQuantity({required CartItem cartItem, int? quantity}) =>
      _setCartLocalStorage(cartItem: cartItem);

  void _setCartLocalStorage({required CartItem cartItem}) async {
    try {
      if (!Hive.isBoxOpen(AppStrings.cartKey)) {
        await Hive.openBox<CartItem>(AppStrings.cartKey);
      }
      final box = Hive.box<CartItem>(AppStrings.cartKey);
      box.put(cartItem.product!.id, cartItem);
      box.close();
    } catch (err) {
      throw CacheException();
    }
  }
}
