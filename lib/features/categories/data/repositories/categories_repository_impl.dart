import 'package:yabalash_mobile_app/features/categories/domain/entities/sub_category.dart';
import 'package:yabalash_mobile_app/core/errors/faliures.dart';
import 'package:dartz/dartz.dart';
import 'package:yabalash_mobile_app/features/categories/domain/repositories/categories_repository.dart';

class CategoriesRepositoryImpl implements CategoriesRepository {
  @override
  Future<Either<Failure, List<SubCategory>>> getSubCategories(
      {required int mainCategoryId}) {
    throw UnimplementedError();
  }
}
