import 'package:flutter/material.dart';

import '../../../../core/constants/app_layouts.dart';
import '../../domain/entities/order.dart';

class OrderSuccessBody extends StatelessWidget {
  final Order order;
  const OrderSuccessBody({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: kDefaultPadding,
          child: Column(
            children: const [],
          ),
        ),
      ),
    );
  }
}
