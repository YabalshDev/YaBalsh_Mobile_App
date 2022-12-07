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
}
