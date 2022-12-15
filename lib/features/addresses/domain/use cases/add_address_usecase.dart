import 'package:equatable/equatable.dart';
import 'package:yabalash_mobile_app/core/errors/faliures.dart';
import 'package:dartz/dartz.dart';
import 'package:yabalash_mobile_app/core/usecases/use_cases.dart';
import 'package:yabalash_mobile_app/features/addresses/domain/entities/address_request.dart';
import 'package:yabalash_mobile_app/features/addresses/domain/repositories/address_repository.dart';

import '../entities/address.dart';

class AddAddressUseCase implements UseCase<Address, AddAddressParams> {
  final AddressRepository addressRepository;

  AddAddressUseCase({required this.addressRepository});
  @override
  Future<Either<Failure, Address>> call(AddAddressParams params) =>
      addressRepository.addAddress(
        addressRequest: params.addressRequest,
      );
}

class AddAddressParams extends Equatable {
  final AddressRequest addressRequest;

  const AddAddressParams({required this.addressRequest});
  @override
  List<Object?> get props => [addressRequest];
}
