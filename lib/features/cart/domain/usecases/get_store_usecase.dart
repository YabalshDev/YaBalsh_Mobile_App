import 'package:equatable/equatable.dart';
import 'package:yabalash_mobile_app/core/errors/faliures.dart';
import 'package:dartz/dartz.dart';
import 'package:yabalash_mobile_app/core/usecases/use_cases.dart';
import 'package:yabalash_mobile_app/features/cart/domain/repositories/cart_repository.dart';

import '../../../home/domain/entities/store.dart';

class GetStoreUseCase implements UseCase<Store, GetStoreParams> {
  final CartRepository cartRepository;

  GetStoreUseCase({required this.cartRepository});
  @override
  Future<Either<Failure, Store>> call(GetStoreParams params) =>
      cartRepository.getStoreById(id: params.id);
}

class GetStoreParams extends Equatable {
  final int id;

  const GetStoreParams({required this.id});
  @override
  List<Object?> get props => [id];
}
