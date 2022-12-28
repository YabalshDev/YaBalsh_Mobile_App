import 'package:yabalash_mobile_app/core/errors/faliures.dart';
import 'package:dartz/dartz.dart';
import 'package:yabalash_mobile_app/core/usecases/use_cases.dart';
import 'package:yabalash_mobile_app/features/cart/domain/repositories/cart_repository.dart';

import 'increment_quantity.dart';

class AddCartItemUseCase implements SynchornousUseCase<void, QuantityParams> {
  final CartRepository cartRepository;

  AddCartItemUseCase({required this.cartRepository});
  @override
  Either<Failure, void> call(QuantityParams params) =>
      cartRepository.addItemToCart(cartItem: params.cartItem);
}
