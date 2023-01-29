import 'package:equatable/equatable.dart';
import 'package:yabalash_mobile_app/core/errors/faliures.dart';
import 'package:dartz/dartz.dart';
import 'package:yabalash_mobile_app/core/usecases/use_cases.dart';
import 'package:yabalash_mobile_app/features/product_details/domain/entites/product_relevant.dart';
import 'package:yabalash_mobile_app/features/product_details/domain/repositories/product_details_repository.dart';

class GetProductRelevantsUseCase
    implements UseCase<ProductRelevant, GetProductRelevantsParams> {
  final ProductDetailsRepository productDetailsRepository;

  GetProductRelevantsUseCase({required this.productDetailsRepository});

  @override
  Future<Either<Failure, ProductRelevant>> call(
          GetProductRelevantsParams params) =>
      productDetailsRepository.getProductRelevants(
        productId: params.productId,
      );
}

class GetProductRelevantsParams extends Equatable {
  final int productId;

  const GetProductRelevantsParams({required this.productId});

  @override
  List<Object?> get props => [productId];
}
