import 'package:yabalash_mobile_app/core/errors/exceptions.dart';
import 'package:yabalash_mobile_app/features/cart/data/datasources/cart_local_datasource.dart';
import 'package:yabalash_mobile_app/features/cart/data/datasources/cart_remote_datasource.dart';
import 'package:yabalash_mobile_app/features/cart/domain/entities/cart_item.dart';
import 'package:yabalash_mobile_app/core/errors/faliures.dart';
import 'package:dartz/dartz.dart';
import 'package:yabalash_mobile_app/features/cart/domain/repositories/cart_repository.dart';
import 'package:yabalash_mobile_app/features/home/domain/entities/store.dart';

class CartRepositoryImpl implements CartRepository {
  final CartLocalDataSource cartLocalDataSource;
  final CartRemoteDataSource cartRemoteDataSource;

  CartRepositoryImpl(
      {required this.cartLocalDataSource, required this.cartRemoteDataSource});
  @override
  Either<Failure, void> addItemToCart({required CartItem cartItem}) {
    try {
      final response = cartLocalDataSource.addItemToCart(cartItem: cartItem);
      return Right(response);
    } on CacheException {
      return _handleCartException('مشكلة اثناء اضافة المنتج الى السلة');
    }
  }

  @override
  Either<Failure, void> clearCart() {
    try {
      final response = cartLocalDataSource.clearCart();
      return Right(response);
    } on CacheException {
      return _handleCartException('مشكلة اثناء ازالة السلة');
    }
  }

  @override
  Either<Failure, void> decrementQuantity(
      {required CartItem cartItem, int? quantity}) {
    try {
      final response =
          cartLocalDataSource.decrementQuantity(cartItem: cartItem);
      return Right(response);
    } on CacheException {
      return _handleCartException('مشكلة اثناء تقليل الكمية في السلة');
    }
  }

  @override
  Either<Failure, void> deleteCartItem({required CartItem cartItem}) {
    try {
      final response = cartLocalDataSource.deleteCartItem(cartItem: cartItem);
      return Right(response);
    } on CacheException {
      return _handleCartException('مشكلة اثناء ازالة السلة');
    }
  }

  @override
  Either<Failure, List<CartItem>> fetchCartItems() {
    try {
      final response = cartLocalDataSource.fetchCartItems();
      return Right(response);
    } on CacheException {
      return const Left(CacheFailure(message: 'مشكلة اثناء ازالة السلة'));
    }
  }

  @override
  Future<Either<Failure, Store>> getStoreById({required int id}) async {
    try {
      final response = await cartRemoteDataSource.getStoreById(id: id);
      return Right(response);
    } on ServerException catch (err) {
      return Left(ServerFailure(message: err.errorModel.message!));
    }
  }

  @override
  Either<Failure, void> incrementQuantity(
      {required CartItem cartItem, int? quantity}) {
    try {
      final response =
          cartLocalDataSource.incrementQuantity(cartItem: cartItem);
      return Right(response);
    } on CacheException {
      return _handleCartException('مشكلة اثناء تزويد الكمية في السلة');
    }
  }

  Left<Failure, dynamic> _handleCartException(String message) {
    return Left(CacheFailure(message: message));
  }
}
