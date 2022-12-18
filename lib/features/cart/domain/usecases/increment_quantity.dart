import 'package:equatable/equatable.dart';
import 'package:yabalash_mobile_app/core/errors/faliures.dart';
import 'package:dartz/dartz.dart';
import 'package:yabalash_mobile_app/core/usecases/use_cases.dart';
import 'package:yabalash_mobile_app/features/cart/domain/entities/cart_item.dart';
import 'package:yabalash_mobile_app/features/cart/domain/repositories/cart_repository.dart';

class IncrementQuantityUseCase
    implements SynchornousUseCase<void, QuantityParams> {
  final CartRepository cartRepository;

  IncrementQuantityUseCase({required this.cartRepository});
  @override
  Either<Failure, void> call(QuantityParams params) =>
      cartRepository.incrementQuantity(cartItem: params.cartItem);
}

class QuantityParams extends Equatable {
  final CartItem cartItem;

  const QuantityParams({required this.cartItem});

  @override
  List<Object?> get props => [cartItem];
}
