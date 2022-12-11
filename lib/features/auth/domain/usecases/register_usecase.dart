import 'package:equatable/equatable.dart';
import 'package:yabalash_mobile_app/core/errors/faliures.dart';
import 'package:dartz/dartz.dart';
import 'package:yabalash_mobile_app/core/usecases/use_cases.dart';
import 'package:yabalash_mobile_app/features/auth/data/models/register_request_model.dart';
import 'package:yabalash_mobile_app/features/auth/domain/entities/customer.dart';
import 'package:yabalash_mobile_app/features/auth/domain/repositories/auth_repository.dart';

class RegisterUseCase implements UseCase<Customer, RegisterParams> {
  final AuthRepository authRepository;

  RegisterUseCase({required this.authRepository});
  @override
  Future<Either<Failure, Customer>> call(RegisterParams params) =>
      authRepository.registerCustomer(registerRequest: params.registerReguest);
}

class RegisterParams extends Equatable {
  final RegisterRequestModel registerReguest;

  const RegisterParams({required this.registerReguest});
  @override
  List<Object?> get props => [registerReguest];
}
