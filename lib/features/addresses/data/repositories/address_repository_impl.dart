import 'package:yabalash_mobile_app/core/errors/exceptions.dart';
import 'package:yabalash_mobile_app/features/addresses/data/datasources/address_remote_datasource.dart';
import 'package:yabalash_mobile_app/features/addresses/data/models/address_request_model.dart';
import 'package:yabalash_mobile_app/features/addresses/domain/entities/address_request.dart';
import 'package:yabalash_mobile_app/features/addresses/domain/entities/address.dart';
import 'package:yabalash_mobile_app/core/errors/faliures.dart';
import 'package:dartz/dartz.dart';
import 'package:yabalash_mobile_app/features/addresses/domain/repositories/address_repository.dart';

class AddressRepositoryImpl implements AddressRepository {
  final AddressRemoteDatasource addressRemoteDatasource;

  AddressRepositoryImpl({required this.addressRemoteDatasource});
  @override
  Future<Either<Failure, Address>> addAddress(
      {required AddressRequest addressRequest}) async {
    try {
      final AddressRequestModel addressBody = AddressRequestModel(
          addressLine: addressRequest.addressLine,
          apartmentNo: addressRequest.apartmentNo,
          buildingNo: addressRequest.buildingNo,
          floorNo: addressRequest.floorNo);
      final response =
          await addressRemoteDatasource.addAddress(addressRequest: addressBody);
      return Right(response);
    } on ServerException catch (err) {
      return Left(ServerFailure(message: err.errorModel.message!));
    }
  }

  @override
  Future<Either<Failure, void>> deleteAddress({required int id}) async {
    try {
      final response = await addressRemoteDatasource.deleteAddress(id: id);
      return Right(response);
    } on ServerException catch (err) {
      return Left(ServerFailure(message: err.errorModel.message!));
    }
  }

  @override
  Future<Either<Failure, Address>> editAddress(
      {required int id, required AddressRequest addressRequest}) async {
    try {
      final AddressRequestModel addressBody = AddressRequestModel(
          addressLine: addressRequest.addressLine,
          apartmentNo: addressRequest.apartmentNo,
          buildingNo: addressRequest.buildingNo,
          floorNo: addressRequest.floorNo);
      final response = await addressRemoteDatasource.editAddress(
          addressRequest: addressBody, id: id);
      return Right(response);
    } on ServerException catch (err) {
      return Left(ServerFailure(message: err.errorModel.message!));
    }
  }

  @override
  Future<Either<Failure, List<Address>>> getAllAddresses() async {
    try {
      final response = await addressRemoteDatasource.getAllAddresses();
      return Right(response);
    } on ServerException catch (err) {
      return Left(ServerFailure(message: err.errorModel.message!));
    }
  }
}
