import 'package:yabalash_mobile_app/core/errors/exceptions.dart';
import 'package:yabalash_mobile_app/features/home/data/datasources/home_mock_datasource.dart';
import 'package:yabalash_mobile_app/features/home/domain/entities/home_section.dart';
import 'package:yabalash_mobile_app/features/home/domain/entities/store.dart';
import 'package:yabalash_mobile_app/features/home/domain/entities/section.dart';
import 'package:yabalash_mobile_app/features/home/domain/entities/main_category.dart';
import 'package:yabalash_mobile_app/features/home/domain/entities/banner.dart';
import 'package:yabalash_mobile_app/core/errors/faliures.dart';
import 'package:dartz/dartz.dart';
import 'package:yabalash_mobile_app/features/home/domain/repositories/home_repository.dart';

import '../../domain/entities/product.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeDataSource homeDataSource;

  HomeRepositoryImpl({required this.homeDataSource});
  @override
  Future<Either<Failure, List<Banner>>> getBanners() async {
    try {
      final banners = await homeDataSource.getBanners();
      return Right(banners);
    } on ServerException {
      return const Left(
          ServerFailure(message: 'something went wrong with banners'));
    }
  }

  @override
  Future<Either<Failure, List<HomeSection>>> getHomeSections() async {
    try {
      List<HomeSection> homeSections = [];
      final sections =
          await homeDataSource.getSections(); // get all high priority sections

      for (Section section in sections) {
        List<Product> sectionProducts = await homeDataSource.getSectionProducts(
            sectionId: section.id!); // get products for each section
        homeSections
            .add(HomeSection(section: section, products: sectionProducts));
      }

      return Right(homeSections);
    } on ServerException {
      return const Left(
          ServerFailure(message: 'something went wrong with sections'));
    }
  }

  @override
  Future<Either<Failure, List<MainCategory>>> getLatestOffers() async {
    try {
      final offers = await homeDataSource.getLatestOffers();
      return Right(offers);
    } on ServerException {
      return const Left(
          ServerFailure(message: 'something went wrong with getting offers'));
    }
  }

  @override
  Future<Either<Failure, List<Store>>> getNearStores() async {
    try {
      final stores = await homeDataSource.getNearStores();
      return Right(stores);
    } on ServerException {
      return const Left(ServerFailure(
          message: 'something went wrong with getting near stores'));
    }
  }
}
