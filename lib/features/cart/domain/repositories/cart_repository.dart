import 'package:dartz/dartz.dart';
import 'package:yabalash_mobile_app/features/cart/domain/entities/cart_item.dart';
import 'package:yabalash_mobile_app/features/home/domain/entities/store.dart';

import '../../../../core/errors/faliures.dart';

abstract class CartRepository {
  Future<Either<Failure, Store>> getStoreById({required int id});
  Either<Failure, List<CartItem>> fetchCartItems();
  Either<Failure, void> addItemToCart({required CartItem cartItem});
  Either<Failure, void> deleteCartItem({required CartItem cartItem});
  Either<Failure, void> clearCart();
  Either<Failure, void> incrementQuantity(
      {required CartItem cartItem, int? quantity});

  Either<Failure, void> decrementQuantity(
      {required CartItem cartItem, int? quantity});
}
