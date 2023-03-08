import 'package:equatable/equatable.dart';
import 'package:yabalash_mobile_app/core/errors/faliures.dart';
import 'package:dartz/dartz.dart';
import 'package:yabalash_mobile_app/core/usecases/use_cases.dart';
import 'package:yabalash_mobile_app/features/shopping_lists/domain/repositories/shopping_list_repository.dart';

class RemoveShoppingListUseCase
    implements SynchornousUseCase<void, RemoveShoppingListParams> {
  final ShoppingListRepository shoppingListRepository;

  RemoveShoppingListUseCase({required this.shoppingListRepository});
  @override
  Either<Failure, void> call(RemoveShoppingListParams params) =>
      shoppingListRepository.removeShoppingList(key: params.key);
}

class RemoveShoppingListParams extends Equatable {
  final String key;

  const RemoveShoppingListParams({required this.key});

  @override
  List<Object?> get props => [key];
}
