import 'package:equatable/equatable.dart';
import 'package:yabalash_mobile_app/core/errors/faliures.dart';
import 'package:dartz/dartz.dart';
import 'package:yabalash_mobile_app/core/usecases/use_cases.dart';
import 'package:yabalash_mobile_app/features/addresses/domain/entities/address_request.dart';
import 'package:yabalash_mobile_app/features/addresses/domain/repositories/address_repository.dart';

import '../entities/address.dart';

class EditAddressUseCase implements UseCase<Address, EditAddressParams> {
  final AddressRepository addressRepository;

  EditAddressUseCase({required this.addressRepository});
  @override
  Future<Either<Failure, Address>> call(EditAddressParams params) =>
      addressRepository.editAddress(
        id: params.id,
        addressRequest: params.addressRequest,
      );
}

class EditAddressParams extends Equatable {
  final int id;
  final AddressRequest addressRequest;

  const EditAddressParams({required this.id, required this.addressRequest});
  @override
  List<Object?> get props => [id, addressRequest];
}
