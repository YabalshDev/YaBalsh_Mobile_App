import 'package:yabalash_mobile_app/core/errors/faliures.dart';
import 'package:dartz/dartz.dart';
import 'package:yabalash_mobile_app/core/usecases/use_cases.dart';
import 'package:yabalash_mobile_app/features/shopping_lists/domain/repositories/shopping_list_repository.dart';

import 'add_shopping_list_usecase.dart';

class RenameShoppingListUseCase
    implements SynchornousUseCase<void, ShoppingListParams> {
  final ShoppingListRepository shoppingListRepository;

  RenameShoppingListUseCase({required this.shoppingListRepository});
  @override
  Either<Failure, void> call(ShoppingListParams params) =>
      shoppingListRepository.renameShoppingList(
          renamedShoppingList: params.shoppingList);
}
