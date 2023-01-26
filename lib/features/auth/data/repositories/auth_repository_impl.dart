import 'package:yabalash_mobile_app/core/errors/exceptions.dart';
import 'package:yabalash_mobile_app/features/auth/data/datasources/auth_local_datasource.dart';
import 'package:yabalash_mobile_app/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:yabalash_mobile_app/features/auth/data/models/login_data_model.dart';
import 'package:yabalash_mobile_app/features/auth/domain/entities/customer.dart';
import 'package:yabalash_mobile_app/features/auth/data/models/register_request_model.dart';
import 'package:yabalash_mobile_app/features/auth/data/models/login_request_model.dart';
import 'package:yabalash_mobile_app/core/errors/faliures.dart';
import 'package:dartz/dartz.dart';
import 'package:yabalash_mobile_app/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthLocalDataSource authLocalDataSource;
  final AuthRemoteDataSource authRemoteDataSource;

  AuthRepositoryImpl(
      {required this.authLocalDataSource, required this.authRemoteDataSource});
  @override
  Future<Either<Failure, LoginDataModel>> login(
      {required LoginRequestModel loginRequest}) async {
    try {
      final result =
          await authRemoteDataSource.loginUser(loginRequest: loginRequest);
      return Right(result.data);
    } on ServerException catch (err) {
      return Left(ServerFailure(message: err.errorModel.message!));
    }
  }

  @override
  Future<Either<Failure, Customer>> registerCustomer(
      {required RegisterRequestModel registerRequest}) async {
    try {
      final result = await authRemoteDataSource.registerUser(
          requestModel: registerRequest);
      return Right(result.data as Customer);
    } on ServerException catch (err) {
      return Left(ServerFailure(message: err.errorModel.message!));
    }
  }

  @override
  bool checkUserLoggedIn() {
    return authLocalDataSource.checkUserLoggedIn();
  }

  @override
  void saveUserToken({required String token}) {
    authLocalDataSource.setUserToken(token: token);
  }

  @override
  Future<Either<Failure, Customer>> getCurrentCustomer() async {
    try {
      final result = await authRemoteDataSource.getCurrentCustomer();
      return Right(result.data as Customer);
    } on ServerException catch (err) {
      return Left(ServerFailure(message: err.errorModel.message!));
    }
  }

  @override
  Future<Either<Failure, bool>> checkUserRegistered(
      {required String phoneNumber}) async {
    try {
      final result = await authRemoteDataSource.checkUserRegistered(
          phoneNumber: phoneNumber);
      return Right(result.data as bool);
    } on ServerException {
      return const Left(
          ServerFailure(message: 'خطا اثناء التحقق من رقم الهاتف'));
    }
  }

  @override
  Future<Either<Failure, bool>> registerDevice(
      {required String deviceId, required String token}) async {
    try {
      final result = await authRemoteDataSource.registerDevice(
          deviceId: deviceId, token: token);
      return Right(result);
    } on ServerException {
      return const Left(ServerFailure(message: 'خطا اثناء تسجيل الجهاز'));
    }
  }
}
