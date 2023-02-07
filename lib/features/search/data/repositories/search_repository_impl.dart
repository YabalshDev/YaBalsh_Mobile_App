import 'package:yabalash_mobile_app/core/errors/exceptions.dart';
import 'package:yabalash_mobile_app/core/utils/extensions/list_limit_extension.dart';
import 'package:yabalash_mobile_app/core/utils/filter_priced_products.dart';
import 'package:yabalash_mobile_app/features/search/data/datasources/search_local_datasource.dart';
import 'package:yabalash_mobile_app/features/search/data/datasources/search_remote_datasource.dart';
import 'package:yabalash_mobile_app/features/search/domain/entities/store_search.dart';
import 'package:yabalash_mobile_app/features/home/domain/entities/product.dart';
import 'package:yabalash_mobile_app/core/errors/faliures.dart';
import 'package:dartz/dartz.dart';
import 'package:yabalash_mobile_app/features/search/domain/repositories/search_repository.dart';

class SearchRepositoryImpl implements SearchRepository {
  final SearchRemoteDataSource searchRemoteDataSource;
  final SearchLocalDataSource searchLocalDataSource;

  SearchRepositoryImpl(
      {required this.searchRemoteDataSource,
      required this.searchLocalDataSource});
  @override
  Future<List<String>> getSearchHistory() async {
    try {
      final response = await searchLocalDataSource.getSearchHistory();

      return response.limit(5);
    } on CacheException {
      return [];
    }
  }

  @override
  Future<Either<Failure, List<Product>>> productSearch(
      {required String searchName}) async {
    try {
      final response =
          await searchRemoteDataSource.productSearch(searchName: searchName);
      final pricedProducts =
          filterPricedProducts((response.data as List<Product>));

      return Right(pricedProducts);
    } on ServerException catch (err) {
      return Left(ServerFailure(message: err.errorModel.message!));
    }
  }

  @override
  Either<Failure, void> saveSearch({required String searchName}) {
    try {
      final response = searchLocalDataSource.saveSearch(searchName: searchName);
      return Right(response);
    } on CacheException {
      return const Left(
          CacheFailure(message: 'مشكلة في التخزين المحلي للبياتات'));
    }
  }

  @override
  Future<Either<Failure, List<StoreSearch>>> storeSearch(
      {required String searchName}) async {
    try {
      final response =
          await searchRemoteDataSource.storeSearch(searchName: searchName);
      return Right(response.data as List<StoreSearch>);
    } on ServerException catch (err) {
      return Left(ServerFailure(message: err.errorModel.message!));
    }
  }

  @override
  Future<Either<Failure, List<Product>>> mainCategoriesProductsSearch(
      {required int mainCategoryId}) async {
    try {
      final response = await searchRemoteDataSource.mainCategoriesSearch(
          mainCategoryId: mainCategoryId);

      return Right(filterPricedProducts(response.data as List<Product>));
    } on ServerException catch (err) {
      return Left(ServerFailure(message: err.errorModel.message!));
    }
  }

  @override
  Future<Either<Failure, List<Product>>> subCategoriesProductsSearch(
      {required int subCategoryId}) async {
    try {
      final response = await searchRemoteDataSource.subCategoriesSearch(
          subCategoryId: subCategoryId);
      return Right(filterPricedProducts(response.data as List<Product>));
    } on ServerException catch (err) {
      return Left(ServerFailure(message: err.errorModel.message!));
    }
  }
}
