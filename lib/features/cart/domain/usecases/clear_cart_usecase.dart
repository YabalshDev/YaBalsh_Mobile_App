import 'package:yabalash_mobile_app/core/errors/faliures.dart';
import 'package:dartz/dartz.dart';
import 'package:yabalash_mobile_app/core/usecases/use_cases.dart';
import 'package:yabalash_mobile_app/features/cart/domain/repositories/cart_repository.dart';

class ClearCartUseCase implements SynchornousUseCase<void, NoParams> {
  final CartRepository cartRepository;

  ClearCartUseCase({required this.cartRepository});
  @override
  Either<Failure, void> call(NoParams params) => cartRepository.clearCart();
}
