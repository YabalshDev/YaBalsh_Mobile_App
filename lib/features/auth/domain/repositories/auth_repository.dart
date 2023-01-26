import 'package:dartz/dartz.dart';
import 'package:yabalash_mobile_app/core/errors/faliures.dart';
import 'package:yabalash_mobile_app/features/auth/data/models/login_data_model.dart';
import 'package:yabalash_mobile_app/features/auth/data/models/login_request_model.dart';
import 'package:yabalash_mobile_app/features/auth/data/models/register_request_model.dart';
import 'package:yabalash_mobile_app/features/auth/domain/entities/customer.dart';

abstract class AuthRepository {
  Future<Either<Failure, LoginDataModel>> login(
      {required LoginRequestModel loginRequest});

  Future<Either<Failure, Customer>> registerCustomer(
      {required RegisterRequestModel registerRequest});

  Future<Either<Failure, Customer>> getCurrentCustomer();

  Future<Either<Failure, bool>> checkUserRegistered(
      {required String phoneNumber});

  bool checkUserLoggedIn();
  void saveUserToken({required String token});

  Future<Either<Failure, bool>> registerDevice(
      {required String deviceId, required String token});
}
