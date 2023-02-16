import 'package:dartz/dartz.dart';
import 'package:yabalash_mobile_app/features/reciepies/domain/entities/brand.dart';
import 'package:yabalash_mobile_app/features/reciepies/domain/entities/recipie.dart';

import '../../../../core/errors/faliures.dart';

abstract class RecipiesRepository {
  Future<Either<Failure, List<Brand>>> getBrands({int? page});
  Future<Either<Failure, List<Recipie>>> getAllRecipies({int? page});
  Future<Either<Failure, List<Recipie>>> getBrandRecipies(
      {required int brandId, int? page});
  Future<Either<Failure, Recipie>> getRecipieById({required int id});
}
