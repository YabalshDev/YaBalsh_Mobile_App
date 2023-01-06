import 'package:flutter/material.dart';
import 'package:yabalash_mobile_app/features/orders/domain/entities/order.dart';
import 'package:yabalash_mobile_app/features/orders/presentation/widgets/order_success_body.dart';

class OrderDetailsView extends StatelessWidget {
  final Order order;
  final bool isFromOrderDetails;

  const OrderDetailsView(
      {super.key, required this.order, required this.isFromOrderDetails});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: OrderSuccessBody(
      isFromOrderDetails: isFromOrderDetails,
      order: order,
    ));
  }
}
