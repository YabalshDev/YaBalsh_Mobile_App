import 'package:dartz/dartz.dart';
import 'package:yabalash_mobile_app/features/home/domain/entities/product.dart';
import 'package:yabalash_mobile_app/features/product_details/domain/entites/product_relevant.dart';

import '../../../../core/errors/faliures.dart';

abstract class ProductDetailsRepository {
  Future<Either<Failure, Product>> getProductDetails(
      {required int productId, required bool withNearStores});

  Future<Either<Failure, ProductRelevant>> getProductRelevants(
      {required int productId});
}
