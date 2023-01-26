import 'package:equatable/equatable.dart';
import 'package:yabalash_mobile_app/core/errors/faliures.dart';
import 'package:dartz/dartz.dart';
import 'package:yabalash_mobile_app/core/usecases/use_cases.dart';
import 'package:yabalash_mobile_app/features/auth/domain/repositories/auth_repository.dart';

class RegisterDeviceUseCase implements UseCase<bool, RegisterDeviceParams> {
  final AuthRepository authRepository;

  const RegisterDeviceUseCase({required this.authRepository});
  @override
  Future<Either<Failure, bool>> call(RegisterDeviceParams params) =>
      authRepository.registerDevice(
          deviceId: params.deviceId, token: params.token);
}

class RegisterDeviceParams extends Equatable {
  final String deviceId;
  final String token;

  const RegisterDeviceParams({required this.deviceId, required this.token});
  @override
  List<Object?> get props => [deviceId, token];
}
