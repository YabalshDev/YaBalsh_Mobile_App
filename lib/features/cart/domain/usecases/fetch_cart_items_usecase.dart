import 'package:yabalash_mobile_app/core/errors/faliures.dart';
import 'package:dartz/dartz.dart';
import 'package:yabalash_mobile_app/core/usecases/use_cases.dart';
import 'package:yabalash_mobile_app/features/cart/domain/entities/cart_item.dart';
import 'package:yabalash_mobile_app/features/cart/domain/repositories/cart_repository.dart';

class FetchCartItemsUseCase
    implements SynchornousUseCase<List<CartItem>, NoParams> {
  final CartRepository cartRepository;

  FetchCartItemsUseCase({required this.cartRepository});
  @override
  Either<Failure, List<CartItem>> call(NoParams params) =>
      cartRepository.fetchCartItems();
}
