import 'package:equatable/equatable.dart';
import 'package:yabalash_mobile_app/core/errors/faliures.dart';
import 'package:dartz/dartz.dart';
import 'package:yabalash_mobile_app/core/usecases/use_cases.dart';
import 'package:yabalash_mobile_app/features/orders/domain/entities/order.dart'
    as entities;
import 'package:yabalash_mobile_app/features/orders/domain/entities/order_request.dart';
import 'package:yabalash_mobile_app/features/orders/domain/repositories/order_repository.dart';

class CreateOrderUseCase implements UseCase<entities.Order, CreateOrderParams> {
  final OrderRepository orderRepository;

  CreateOrderUseCase({required this.orderRepository});
  @override
  Future<Either<Failure, entities.Order>> call(CreateOrderParams params) =>
      orderRepository.createOrder(orderRequest: params.orderRequest);
}

class CreateOrderParams extends Equatable {
  final OrderRequest orderRequest;

  const CreateOrderParams({required this.orderRequest});

  @override
  List<Object?> get props => [orderRequest];
}
