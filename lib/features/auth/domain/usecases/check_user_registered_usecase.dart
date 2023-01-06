import 'package:equatable/equatable.dart';
import 'package:yabalash_mobile_app/core/errors/faliures.dart';
import 'package:dartz/dartz.dart';
import 'package:yabalash_mobile_app/core/usecases/use_cases.dart';
import 'package:yabalash_mobile_app/features/auth/domain/repositories/auth_repository.dart';

class CheckUserRegisteredUseCase
    implements UseCase<bool, CheckUserRegisteredParams> {
  final AuthRepository authRepository;

  CheckUserRegisteredUseCase({required this.authRepository});
  @override
  Future<Either<Failure, bool>> call(CheckUserRegisteredParams params) =>
      authRepository.checkUserRegistered(phoneNumber: params.phoneNumber);
}

class CheckUserRegisteredParams extends Equatable {
  final String phoneNumber;

  const CheckUserRegisteredParams({required this.phoneNumber});
  @override
  List<Object?> get props => [phoneNumber];
}
