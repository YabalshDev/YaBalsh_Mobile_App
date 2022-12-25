import 'package:hive/hive.dart';
import 'package:yabalash_mobile_app/core/constants/app_strings.dart';
import 'package:yabalash_mobile_app/core/errors/exceptions.dart';

import '../../domain/entities/shopping_list.dart';

abstract class ShoppingListLocalDataSource {
  Future<List<ShoppingList>> getAllShoppingList();
  void renameShoppingList(
      {required ShoppingList renamedShoppingList, String? key});
  void addShoppingList({required ShoppingList shoppingList});
}

class ShoppingListLocalDataSourceImpl implements ShoppingListLocalDataSource {
  @override
  void addShoppingList({required ShoppingList shoppingList}) =>
      _setShoppingListInLocalDataSource(shoppingList: shoppingList);

  @override
  Future<List<ShoppingList>> getAllShoppingList() async {
    try {
      if (!Hive.isBoxOpen(AppStrings.shoppingListKey)) {
        await Hive.openBox<ShoppingList>(AppStrings.shoppingListKey);
      }
      final box = Hive.box<ShoppingList>(AppStrings.shoppingListKey);
      return box.values.toList();
    } catch (err) {
      throw CacheException();
    }
  }

  @override
  void renameShoppingList(
      {required ShoppingList renamedShoppingList, String? key}) async {
    try {
      if (!Hive.isBoxOpen(AppStrings.shoppingListKey)) {
        await Hive.openBox<ShoppingList>(AppStrings.shoppingListKey);
      }
      final box = Hive.box<ShoppingList>(AppStrings.shoppingListKey);
      box.delete(key);
      box.put(renamedShoppingList.name, renamedShoppingList);
    } catch (err) {
      throw CacheException();
    }
  }

  void _setShoppingListInLocalDataSource(
      {required ShoppingList shoppingList, String? key}) async {
    try {
      if (!Hive.isBoxOpen(AppStrings.shoppingListKey)) {
        await Hive.openBox<ShoppingList>(AppStrings.shoppingListKey);
      }
      final box = Hive.box<ShoppingList>(AppStrings.shoppingListKey);
      box.put(key ?? shoppingList.name, shoppingList);
    } catch (err) {
      throw CacheException();
    }
  }
}
