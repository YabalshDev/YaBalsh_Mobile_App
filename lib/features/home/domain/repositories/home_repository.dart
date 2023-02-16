import 'package:dartz/dartz.dart';
import 'package:yabalash_mobile_app/core/errors/faliures.dart';
import 'package:yabalash_mobile_app/features/categories/domain/entities/category.dart';
import 'package:yabalash_mobile_app/features/home/domain/entities/home_section.dart';
import 'package:yabalash_mobile_app/features/home/domain/entities/product.dart';
import 'package:yabalash_mobile_app/features/home/domain/entities/store.dart';

import '../entities/banner.dart';

abstract class HomeRepository {
  Future<Either<Failure, List<Banner>>> getBanners();
  Future<Either<Failure, List<Store>>> getNearStores();
  Future<Either<Failure, List<Category>>> getMainCategories();
  Future<Either<Failure, List<HomeSection>>> getHomeSections();
  Future<Either<Failure, List<Product>>> getSectionProducts(
      {required int sectionId, int? page});

  Future<Either<Failure, Product>> getProductByBarCode(
      {required String barCode});
}
