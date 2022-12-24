import 'package:yabalash_mobile_app/core/errors/faliures.dart';
import 'package:dartz/dartz.dart';
import 'package:yabalash_mobile_app/core/usecases/use_cases.dart';
import 'package:yabalash_mobile_app/features/shopping_lists/domain/entities/shopping_list.dart';
import 'package:yabalash_mobile_app/features/shopping_lists/domain/repositories/shopping_list_repository.dart';

class GetAllShoppingListsUseCase
    implements UseCase<List<ShoppingList>, NoParams> {
  final ShoppingListRepository shoppingListRepository;

  GetAllShoppingListsUseCase({required this.shoppingListRepository});
  @override
  Future<Either<Failure, List<ShoppingList>>> call(NoParams params) =>
      shoppingListRepository.getAllShoppingList();
}
