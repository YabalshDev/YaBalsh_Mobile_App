import 'package:equatable/equatable.dart';
import 'package:yabalash_mobile_app/core/errors/faliures.dart';
import 'package:dartz/dartz.dart';
import 'package:yabalash_mobile_app/core/usecases/use_cases.dart';
import 'package:yabalash_mobile_app/features/addresses/domain/repositories/address_repository.dart';

class DeleteAddressUseCase implements UseCase<void, DeleteAddressParams> {
  final AddressRepository addressRepository;

  DeleteAddressUseCase({required this.addressRepository});
  @override
  Future<Either<Failure, void>> call(DeleteAddressParams params) =>
      addressRepository.deleteAddress(
        id: params.id,
      );
}

class DeleteAddressParams extends Equatable {
  final int id;

  const DeleteAddressParams({
    required this.id,
  });
  @override
  List<Object?> get props => [
        id,
      ];
}
