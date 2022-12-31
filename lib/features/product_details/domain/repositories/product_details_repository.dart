import 'package:dartz/dartz.dart';
import 'package:yabalash_mobile_app/features/home/domain/entities/product.dart';

import '../../../../core/errors/faliures.dart';

abstract class ProductDetailsRepository {
  Future<Either<Failure, Product>> getProductDetails(
      {required int productId, required bool withNearStores});
}
