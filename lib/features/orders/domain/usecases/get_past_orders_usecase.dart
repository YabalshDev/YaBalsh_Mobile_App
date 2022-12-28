import 'package:yabalash_mobile_app/core/errors/faliures.dart';
import 'package:dartz/dartz.dart';
import 'package:yabalash_mobile_app/core/usecases/use_cases.dart';
import 'package:yabalash_mobile_app/features/orders/domain/entities/order.dart'
    as entities;
import 'package:yabalash_mobile_app/features/orders/domain/repositories/order_repository.dart';

class GetPastOrdersUseCase implements UseCase<List<entities.Order>, NoParams> {
  final OrderRepository orderRepository;

  GetPastOrdersUseCase({required this.orderRepository});
  @override
  Future<Either<Failure, List<entities.Order>>> call(NoParams params) =>
      orderRepository.getPastOrders();
}
