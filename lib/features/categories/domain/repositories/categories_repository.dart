import 'package:dartz/dartz.dart';
import 'package:yabalash_mobile_app/core/errors/faliures.dart';
import 'package:yabalash_mobile_app/features/categories/domain/entities/sub_category.dart';

abstract class CategoriesRepository {
  Future<Either<Failure, List<SubCategory>>> getSubCategories(
      {required int mainCategoryId});
}
