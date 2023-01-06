import 'package:flutter/material.dart';

import '../../domain/entities/order.dart';
import '../widgets/order_success_body.dart';

class OrderSuccessView extends StatelessWidget {
  final Order order;
  final bool isFromOrderDetails;
  const OrderSuccessView(
      {super.key, required this.order, required this.isFromOrderDetails});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: OrderSuccessBody(
      order: order,
      isFromOrderDetails: isFromOrderDetails,
    ));
  }
}
