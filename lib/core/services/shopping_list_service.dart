import 'package:hive/hive.dart';
import 'package:yabalash_mobile_app/core/constants/app_strings.dart';
import 'package:yabalash_mobile_app/features/shopping_lists/domain/entities/shopping_list.dart';

abstract class ShoppingListService {
  void clearShoppingList();
}

class ShoppingListServiceImpl implements ShoppingListService {
  @override
  void clearShoppingList() async {
    if (!Hive.isBoxOpen(AppStrings.shoppingListKey)) {
      await Hive.openBox<ShoppingList>(AppStrings.shoppingListKey);
    }

    final box = Hive.box<ShoppingList>(AppStrings.shoppingListKey);

    box.clear();
  }
}
