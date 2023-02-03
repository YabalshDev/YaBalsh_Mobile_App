import 'package:yabalash_mobile_app/core/errors/faliures.dart';
import 'package:dartz/dartz.dart';
import 'package:yabalash_mobile_app/core/usecases/use_cases.dart';
import 'package:yabalash_mobile_app/features/reciepies/domain/repositories/recipies_repository.dart';

import '../entities/recipie.dart';

class GetAllRecpiesUseCase implements UseCase<List<Recipie>, NoParams> {
  final RecipiesRepository recipiesRepository;

  GetAllRecpiesUseCase({required this.recipiesRepository});
  @override
  Future<Either<Failure, List<Recipie>>> call(NoParams params) =>
      recipiesRepository.getAllRecipies();
}
