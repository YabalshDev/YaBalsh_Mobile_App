import 'package:equatable/equatable.dart';
import 'package:yabalash_mobile_app/core/errors/faliures.dart';
import 'package:dartz/dartz.dart';
import 'package:yabalash_mobile_app/core/usecases/use_cases.dart';
import 'package:yabalash_mobile_app/features/auth/data/models/login_data_model.dart';
import 'package:yabalash_mobile_app/features/auth/data/models/login_request_model.dart';
import 'package:yabalash_mobile_app/features/auth/domain/repositories/auth_repository.dart';

class LoginUseCase implements UseCase<LoginDataModel, LoginParams> {
  final AuthRepository authRepository;

  LoginUseCase({required this.authRepository});
  @override
  Future<Either<Failure, LoginDataModel>> call(LoginParams params) =>
      authRepository.login(loginRequest: params.loginRequest);
}

class LoginParams extends Equatable {
  final LoginRequestModel loginRequest;

  const LoginParams({required this.loginRequest});
  @override
  List<Object?> get props => [loginRequest];
}
