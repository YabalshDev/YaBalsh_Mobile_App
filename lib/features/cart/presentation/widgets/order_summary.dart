import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yabalash_mobile_app/features/cart/domain/entities/supermarket_card_model.dart';

class OrderSummary extends StatelessWidget {
  final SuperMarketCardModel superMarketCardModel;
  const OrderSummary({super.key, required this.superMarketCardModel});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'إختار السوبر ماركت',
            style: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(fontWeight: FontWeight.w700, fontSize: 17.sp),
          ),
        ],
      ),
    );
  }
}
