import 'package:dartz/dartz.dart';
import 'package:yabalash_mobile_app/core/errors/faliures.dart';
import 'package:yabalash_mobile_app/features/orders/domain/entities/order.dart'
    as entites;
import 'package:yabalash_mobile_app/features/orders/domain/entities/order_request.dart';

abstract class OrderRepository {
  Future<Either<Failure, entites.Order>> createOrder(
      {required OrderRequest orderRequest});

  Future<Either<Failure, List<entites.Order>>> getPastOrders({int? page});
}
