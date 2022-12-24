import 'package:dartz/dartz.dart';
import 'package:yabalash_mobile_app/features/shopping_lists/domain/entities/shopping_list.dart';

import '../../../../core/errors/faliures.dart';

abstract class ShoppingListRepository {
  Future<Either<Failure, List<ShoppingList>>> getAllShoppingList();
  Either<Failure, void> renameShoppingList(
      {required ShoppingList renamedShoppingList});
  Either<Failure, void> addShoppingList({required ShoppingList shoppingList});
}
