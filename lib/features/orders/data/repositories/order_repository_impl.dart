import 'package:yabalash_mobile_app/core/errors/exceptions.dart';
import 'package:yabalash_mobile_app/features/orders/data/datasources/order_remote_datasource.dart';
import 'package:yabalash_mobile_app/features/orders/domain/entities/order_request.dart';
import 'package:yabalash_mobile_app/core/errors/faliures.dart';
import 'package:dartz/dartz.dart';
import 'package:yabalash_mobile_app/features/orders/domain/repositories/order_repository.dart';

class OrderRepositoryImpl implements OrderRepository {
  final OrderRemoteDataSource orderRemoteDataSource;

  OrderRepositoryImpl({required this.orderRemoteDataSource});
  @override
  Future<Either<Failure, Order>> createOrder(
      {required OrderRequest orderRequest}) async {
    try {
      final response =
          await orderRemoteDataSource.createOrder(orderRequest: orderRequest);
      return Right(response as Order);
    } on ServerException catch (err) {
      return Left(ServerFailure(message: err.errorModel.message!));
    }
  }

  @override
  Future<Either<Failure, List<Order>>> getPastOrders() async {
    try {
      final response = await orderRemoteDataSource.getOrders();
      return Right(response as List<Order>);
    } on ServerException catch (err) {
      return Left(ServerFailure(message: err.errorModel.message!));
    }
  }
}
