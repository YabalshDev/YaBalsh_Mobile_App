import 'package:dartz/dartz.dart';
import 'package:yabalash_mobile_app/core/errors/faliures.dart';
import 'package:yabalash_mobile_app/features/orders/domain/entities/order_request.dart';

abstract class OrderRepository {
  Future<Either<Failure, Order>> createOrder(
      {required OrderRequest orderRequest});

  Future<Either<Failure, List<Order>>> getPastOrders();
}
