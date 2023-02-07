import 'package:yabalash_mobile_app/core/errors/exceptions.dart';
import 'package:yabalash_mobile_app/core/utils/extensions/list_limit_extension.dart';
import 'package:yabalash_mobile_app/core/utils/filter_priced_products.dart';
import 'package:yabalash_mobile_app/features/home/data/datasources/home_mock_datasource.dart';
import 'package:yabalash_mobile_app/features/home/domain/entities/home_section.dart';
import 'package:yabalash_mobile_app/features/home/domain/entities/store.dart';
import 'package:yabalash_mobile_app/features/home/domain/entities/section.dart';
import 'package:yabalash_mobile_app/features/home/domain/entities/banner.dart';
import 'package:yabalash_mobile_app/core/errors/faliures.dart';
import 'package:dartz/dartz.dart';
import 'package:yabalash_mobile_app/features/home/domain/repositories/home_repository.dart';

import '../../../categories/domain/entities/category.dart';
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
      return const Left(ServerFailure(message: 'خطا في جلب الملصقات'));
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
        List<Product> pricedSectionProducts =
            filterPricedProducts(sectionProducts);

        homeSections.add(HomeSection(
            section: section, products: pricedSectionProducts.limit(6)));
      }

      return Right(homeSections);
    } on ServerException {
      return const Left(ServerFailure(message: 'خطا في جلب الاقسام الرئيسية'));
    }
  }

  @override
  Future<Either<Failure, List<Store>>> getNearStores() async {
    try {
      final stores = await homeDataSource.getNearStores();
      return Right(stores);
    } on ServerException {
      return const Left(
          ServerFailure(message: 'خطا في جلب السوبرماركتس القريبة'));
    }
  }

  @override
  Future<Either<Failure, List<Category>>> getMainCategories() async {
    try {
      final categories = await homeDataSource.getAllMainCategories();
      return Right(categories);
    } on ServerException {
      return const Left(ServerFailure(message: 'خطا اثناء جلب الفئات'));
    }
  }

  @override
  Future<Either<Failure, List<Product>>> getSectionProducts(
      {required int sectionId}) async {
    try {
      final products =
          await homeDataSource.getSectionProducts(sectionId: sectionId);

      return Right(filterPricedProducts(products));
    } on ServerException {
      return const Left(ServerFailure(message: 'خطا اثناء جلب المنتجات'));
    }
  }

  @override
  Future<Either<Failure, Product>> getProductByBarCode(
      {required String barCode}) async {
    try {
      final product =
          await homeDataSource.getProductByBarcode(barCode: barCode);
      return Right(product);
    } on ServerException {
      return const Left(ServerFailure(message: 'المنتج غير متوفر'));
    }
  }
}
