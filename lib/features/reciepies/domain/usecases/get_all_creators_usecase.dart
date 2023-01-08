import 'package:yabalash_mobile_app/core/errors/faliures.dart';
import 'package:dartz/dartz.dart';
import 'package:yabalash_mobile_app/core/usecases/use_cases.dart';
import 'package:yabalash_mobile_app/features/reciepies/domain/entities/creator.dart';
import 'package:yabalash_mobile_app/features/reciepies/domain/repositories/recipies_repository.dart';

class GetAllCreatorsUseCase implements UseCase<List<Creator>, NoParams> {
  final RecipiesRepository recipiesRepository;

  GetAllCreatorsUseCase({required this.recipiesRepository});
  @override
  Future<Either<Failure, List<Creator>>> call(NoParams params) =>
      recipiesRepository.getAllCreators();
}
