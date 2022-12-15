import 'package:dartz/dartz.dart';
import 'package:yabalash_mobile_app/features/addresses/domain/entities/address.dart';
import 'package:yabalash_mobile_app/features/addresses/domain/entities/address_request.dart';

import '../../../../core/errors/faliures.dart';

abstract class AddressRepository {
  Future<Either<Failure, List<Address>>> getAllAddresses();
  Future<Either<Failure, Address>> addAddress(
      {required AddressRequest addressRequest});
  Future<Either<Failure, Address>> editAddress(
      {required int id, AddressRequest addressRequest});
  Future<Either<Failure, void>> deleteAddress({required int id});
}
