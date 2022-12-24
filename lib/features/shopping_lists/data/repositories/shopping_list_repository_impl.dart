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
      return const Left(CacheFailure(message: 'خطأ في اضافة القائمة'));
    }
  }

  @override
  Future<Either<Failure, List<ShoppingList>>> getAllShoppingList() async {
    try {
      final response = await shoppingListLocalDataSource.getAllShoppingList();
      return Right(response);
    } on CacheException {
      return const Left(CacheFailure(message: 'خطأ في جلب القوائم'));
    }
  }

  @override
  Either<Failure, void> renameShoppingList(
      {required ShoppingList renamedShoppingList}) {
    try {
      final response = shoppingListLocalDataSource.addShoppingList(
          shoppingList: renamedShoppingList);
      return Right(response);
    } on CacheException {
      return const Left(CacheFailure(message: 'خطأ في تسمية القائمة'));
    }
  }
}
