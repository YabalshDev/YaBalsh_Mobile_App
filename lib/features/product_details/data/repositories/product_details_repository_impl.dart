import 'package:yabalash_mobile_app/core/errors/exceptions.dart';
import 'package:yabalash_mobile_app/features/home/domain/entities/product.dart';
import 'package:yabalash_mobile_app/core/errors/faliures.dart';
import 'package:dartz/dartz.dart';
import 'package:yabalash_mobile_app/features/product_details/data/datasources/product_details_remotedatasource.dart';
import 'package:yabalash_mobile_app/features/product_details/domain/entites/product_relevant.dart';
import 'package:yabalash_mobile_app/features/product_details/domain/repositories/product_details_repository.dart';

class ProductDetailsRepositoryImpl implements ProductDetailsRepository {
  final ProductDetailsRemoteDataSource productDetailsRemoteDataSource;

  ProductDetailsRepositoryImpl({required this.productDetailsRemoteDataSource});
  @override
  Future<Either<Failure, Product>> getProductDetails(
      {required int productId, required bool withNearStores}) async {
    try {
      final result = await productDetailsRemoteDataSource.getProductById(
          id: productId, withNearStores: withNearStores);
      return Right(result.data as Product);
    } on ServerException {
      return const Left(ServerFailure(message: 'خطا اثناء جلب المنتج'));
    }
  }

  @override
  Future<Either<Failure, ProductRelevant>> getProductRelevants(
      {required int productId}) async {
    try {
      final result = await productDetailsRemoteDataSource.getProductRelevants(
        id: productId,
      );
      return Right(result.data as ProductRelevant);
    } on ServerException {
      return const Left(ServerFailure(message: 'خطا اثناء جلب مرتبطات المنتج'));
    }
  }
}
