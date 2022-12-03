import 'package:dartz/dartz.dart';
import 'package:yabalash_mobile_app/core/errors/faliures.dart';
import 'package:yabalash_mobile_app/features/home/domain/entities/main_category.dart';
import 'package:yabalash_mobile_app/features/home/domain/entities/section.dart';
import 'package:yabalash_mobile_app/features/home/domain/entities/store.dart';

import '../entities/banner.dart';

abstract class HomeRepository {
  Future<Either<Failure, List<MainCategory>>> getLatestOffers();
  Future<Either<Failure, List<Banner>>> getBanners();
  Future<Either<Failure, List<Store>>> getNearStores();
  Future<Either<Failure, List<Section>>> getHomeSections(
      {required String keword});
}
