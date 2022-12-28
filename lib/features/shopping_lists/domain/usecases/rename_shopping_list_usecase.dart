import 'package:equatable/equatable.dart';
import 'package:yabalash_mobile_app/core/errors/faliures.dart';
import 'package:dartz/dartz.dart';
import 'package:yabalash_mobile_app/core/usecases/use_cases.dart';
import 'package:yabalash_mobile_app/features/shopping_lists/domain/repositories/shopping_list_repository.dart';

import '../entities/shopping_list.dart';

class RenameShoppingListUseCase
    implements SynchornousUseCase<void, RenameShoppingListParams> {
  final ShoppingListRepository shoppingListRepository;

  RenameShoppingListUseCase({required this.shoppingListRepository});
  @override
  Either<Failure, void> call(RenameShoppingListParams params) =>
      shoppingListRepository.renameShoppingList(
          renamedShoppingList: params.shoppingList, key: params.key);
}

class RenameShoppingListParams extends Equatable {
  final ShoppingList shoppingList;
  final String? key;

  const RenameShoppingListParams({required this.shoppingList, this.key = ''});

  @override
  List<Object?> get props => [shoppingList];
}
