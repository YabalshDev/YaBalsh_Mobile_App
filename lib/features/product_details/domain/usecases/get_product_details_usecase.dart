import 'package:equatable/equatable.dart';
import 'package:yabalash_mobile_app/core/errors/faliures.dart';
import 'package:dartz/dartz.dart';
import 'package:yabalash_mobile_app/core/usecases/use_cases.dart';
import 'package:yabalash_mobile_app/features/home/domain/entities/product.dart';
import 'package:yabalash_mobile_app/features/product_details/domain/repositories/product_details_repository.dart';

class GetProductDetailsUseCase
    implements UseCase<Product, GetProductDetailsParams> {
  final ProductDetailsRepository productDetailsRepository;

  GetProductDetailsUseCase({required this.productDetailsRepository});

  @override
  Future<Either<Failure, Product>> call(GetProductDetailsParams params) =>
      productDetailsRepository.getProductDetails(
          productId: params.productId, withNearStores: params.withNearStores);
}

class GetProductDetailsParams extends Equatable {
  final int productId;
  final bool withNearStores;

  const GetProductDetailsParams(
      {required this.withNearStores, required this.productId});

  @override
  List<Object?> get props => [productId];
}
