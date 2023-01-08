import 'package:dartz/dartz.dart';
import 'package:yabalash_mobile_app/features/reciepies/domain/entities/creator.dart';
import 'package:yabalash_mobile_app/features/reciepies/domain/entities/recipie.dart';

import '../../../../core/errors/faliures.dart';

abstract class RecipiesRepository {
  Future<Either<Failure, List<Creator>>> getAllCreators();
  Future<Either<Failure, List<Recipie>>> getAllRecipies();
  Future<Either<Failure, Recipie>> getRecipieById({required String id});
}
