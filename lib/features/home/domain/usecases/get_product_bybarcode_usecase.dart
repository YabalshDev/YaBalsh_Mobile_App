import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:yabalash_mobile_app/features/home/domain/entities/product.dart';

import '../../../../core/errors/faliures.dart';
import '../../../../core/usecases/use_cases.dart';
import '../repositories/home_repository.dart';

class GetProductByBarCodeUseCase
    implements UseCase<Product, GetProductByBarcodeParams> {
  final HomeRepository homeRepository;

  GetProductByBarCodeUseCase({required this.homeRepository});
  @override
  Future<Either<Failure, Product>> call(GetProductByBarcodeParams params) =>
      homeRepository.getProductByBarCode(barCode: params.barCode);
}

class GetProductByBarcodeParams extends Equatable {
  final String barCode;

  const GetProductByBarcodeParams({required this.barCode});
  @override
  List<Object?> get props => [barCode];
}
