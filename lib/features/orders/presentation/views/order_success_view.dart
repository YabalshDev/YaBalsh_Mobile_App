import 'package:flutter/material.dart';
import 'package:yabalash_mobile_app/features/orders/domain/entities/order.dart';
import 'package:yabalash_mobile_app/features/orders/presentation/widgets/order_success_body.dart';

class OrderSuccessView extends StatelessWidget {
  final Order order;
  const OrderSuccessView({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: OrderSuccessBody(
      order: order,
    ));
  }
}
