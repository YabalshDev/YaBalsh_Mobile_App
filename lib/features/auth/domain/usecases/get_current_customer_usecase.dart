import 'package:yabalash_mobile_app/core/errors/faliures.dart';
import 'package:dartz/dartz.dart';
import 'package:yabalash_mobile_app/core/usecases/use_cases.dart';
import 'package:yabalash_mobile_app/features/auth/domain/entities/customer.dart';
import 'package:yabalash_mobile_app/features/auth/domain/repositories/auth_repository.dart';

class GetCurrentCustomerUseCase implements UseCase<Customer, NoParams> {
  final AuthRepository authRepository;

  GetCurrentCustomerUseCase({required this.authRepository});
  @override
  Future<Either<Failure, Customer>> call(NoParams params) =>
      authRepository.getCurrentCustomer();
}
