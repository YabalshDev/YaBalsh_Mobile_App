import 'package:yabalash_mobile_app/core/errors/faliures.dart';
import 'package:dartz/dartz.dart';
import 'package:yabalash_mobile_app/core/usecases/use_cases.dart';
import 'package:yabalash_mobile_app/features/reciepies/domain/repositories/recipies_repository.dart';

import '../entities/recipie.dart';
import 'get_all_brands_usecase.dart';

class GetAllRecpiesUseCase
    implements UseCase<List<Recipie>, GetAllBrandsParams> {
  final RecipiesRepository recipiesRepository;

  GetAllRecpiesUseCase({required this.recipiesRepository});
  @override
  Future<Either<Failure, List<Recipie>>> call(GetAllBrandsParams params) =>
      recipiesRepository.getAllRecipies(page: params.page);
}
