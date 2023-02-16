import 'package:equatable/equatable.dart';
import 'package:yabalash_mobile_app/core/errors/faliures.dart';
import 'package:dartz/dartz.dart';
import 'package:yabalash_mobile_app/core/usecases/use_cases.dart';
import 'package:yabalash_mobile_app/features/reciepies/domain/entities/brand.dart';
import 'package:yabalash_mobile_app/features/reciepies/domain/repositories/recipies_repository.dart';

class GetAllBrandsUseCase implements UseCase<List<Brand>, GetAllBrandsParams> {
  final RecipiesRepository recipiesRepository;

  GetAllBrandsUseCase({required this.recipiesRepository});
  @override
  Future<Either<Failure, List<Brand>>> call(GetAllBrandsParams params) =>
      recipiesRepository.getBrands(page: params.page);
}

class GetAllBrandsParams extends Equatable {
  final int? page;

  const GetAllBrandsParams({this.page});

  @override
  List<Object?> get props => [page];
}
