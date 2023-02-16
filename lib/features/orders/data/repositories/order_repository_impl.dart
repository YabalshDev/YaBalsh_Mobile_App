import 'package:yabalash_mobile_app/core/errors/exceptions.dart';
import 'package:yabalash_mobile_app/features/orders/data/datasources/order_remote_datasource.dart';
import 'package:yabalash_mobile_app/features/orders/domain/entities/order.dart'
    as entities;
import 'package:yabalash_mobile_app/features/orders/domain/entities/order_request.dart';
import 'package:yabalash_mobile_app/core/errors/faliures.dart';
import 'package:dartz/dartz.dart';
import 'package:yabalash_mobile_app/features/orders/domain/repositories/order_repository.dart';

class OrderRepositoryImpl implements OrderRepository {
  final OrderRemoteDataSource orderRemoteDataSource;

  OrderRepositoryImpl({required this.orderRemoteDataSource});
  @override
  Future<Either<Failure, entities.Order>> createOrder(
      {required OrderRequest orderRequest}) async {
    try {
      final response =
          await orderRemoteDataSource.createOrder(orderRequest: orderRequest);
      return Right(response);
    } on ServerException catch (err) {
      return Left(ServerFailure(message: err.errorModel.message!));
    }
  }

  @override
  Future<Either<Failure, List<entities.Order>>> getPastOrders(
      {int? page}) async {
    try {
      final response = await orderRemoteDataSource.getOrders(page: page);
      return Right(response);
    } on ServerException catch (err) {
      return Left(ServerFailure(message: err.errorModel.message!));
    }
  }
}
