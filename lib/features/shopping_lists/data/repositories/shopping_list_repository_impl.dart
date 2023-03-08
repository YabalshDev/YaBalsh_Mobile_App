import 'package:yabalash_mobile_app/core/errors/exceptions.dart';
import 'package:yabalash_mobile_app/features/shopping_lists/data/datasources/shopping_list_local_datasource.dart';
import 'package:yabalash_mobile_app/features/shopping_lists/domain/entities/shopping_list.dart';
import 'package:yabalash_mobile_app/core/errors/faliures.dart';
import 'package:dartz/dartz.dart';
import 'package:yabalash_mobile_app/features/shopping_lists/domain/repositories/shopping_list_repository.dart';

class ShoppingListRepositoryImpl implements ShoppingListRepository {
  final ShoppingListLocalDataSource shoppingListLocalDataSource;

  ShoppingListRepositoryImpl({required this.shoppingListLocalDataSource});
  @override
  Either<Failure, void> addShoppingList({required ShoppingList shoppingList}) {
    try {
      final response = shoppingListLocalDataSource.addShoppingList(
          shoppingList: shoppingList);
      return Right(response);
    } on CacheException {
      return const Left(
          CacheFailure(message: 'مشكلة اثناء حفظ القائمة .. حاول مرة اخرى'));
    }
  }

  @override
  Future<Either<Failure, List<ShoppingList>>> getAllShoppingList() async {
    try {
      final response = await shoppingListLocalDataSource.getAllShoppingList();
      return Right(response);
    } on CacheException {
      return const Left(
          CacheFailure(message: 'مشكلة اثناء جلب القوائم ..حاول مرة اخرى'));
    }
  }

  @override
  Either<Failure, void> renameShoppingList(
      {required ShoppingList renamedShoppingList, String? key}) {
    try {
      final response = shoppingListLocalDataSource.renameShoppingList(
          renamedShoppingList: renamedShoppingList, key: key);
      return Right(response);
    } on CacheException {
      return const Left(CacheFailure(
          message: 'مشكلة اثناء اعادة تسمية القائمة ..حاول مرة اخرى'));
    }
  }

  @override
  Either<Failure, void> removeShoppingList({required String key}) {
    try {
      final response = shoppingListLocalDataSource.removeShoppingList(key: key);
      return Right(response);
    } on CacheException {
      return const Left(
          CacheFailure(message: 'مشكلة اثناء حذف القائمة ..حاول مرة اخرى'));
    }
  }
}
