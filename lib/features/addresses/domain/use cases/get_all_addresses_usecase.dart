import 'package:yabalash_mobile_app/core/errors/faliures.dart';
import 'package:dartz/dartz.dart';
import 'package:yabalash_mobile_app/core/usecases/use_cases.dart';
import 'package:yabalash_mobile_app/features/addresses/domain/repositories/address_repository.dart';

import '../entities/address.dart';

class GetAllAddressUseCase implements UseCase<List<Address>, NoParams> {
  final AddressRepository addressRepository;

  GetAllAddressUseCase({required this.addressRepository});
  @override
  Future<Either<Failure, List<Address>>> call(NoParams params) =>
      addressRepository.getAllAddresses();
}
