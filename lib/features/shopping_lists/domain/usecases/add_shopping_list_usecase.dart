import 'package:equatable/equatable.dart';
import 'package:yabalash_mobile_app/core/errors/faliures.dart';
import 'package:dartz/dartz.dart';
import 'package:yabalash_mobile_app/core/usecases/use_cases.dart';
import 'package:yabalash_mobile_app/features/shopping_lists/domain/entities/shopping_list.dart';
import 'package:yabalash_mobile_app/features/shopping_lists/domain/repositories/shopping_list_repository.dart';

class AddShoppingListUseCase
    implements SynchornousUseCase<void, ShoppingListParams> {
  final ShoppingListRepository shoppingListRepository;

  AddShoppingListUseCase({required this.shoppingListRepository});
  @override
  Either<Failure, void> call(ShoppingListParams params) =>
      shoppingListRepository.addShoppingList(shoppingList: params.shoppingList);
}

class ShoppingListParams extends Equatable {
  final ShoppingList shoppingList;

  const ShoppingListParams(this.shoppingList);

  @override
  List<Object?> get props => [shoppingList];
}
