import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/widgets/sub_heading.dart';
import '../../domain/entities/order.dart';
import '../blocs/cubit/past_orders_cubit.dart';
import 'past_order_card.dart';

class PastOrdersSection extends StatelessWidget {
  final String sectionTitle;
  final List<Order> orders;
  final PastOrdersState state;
  const PastOrdersSection({
    Key? key,
    required this.sectionTitle,
    required this.orders,
    required this.state,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SubHeading(text: sectionTitle),
        ListView.builder(
          padding: EdgeInsets.symmetric(horizontal: 6.w),
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: orders.length,
          itemBuilder: (context, index) {
            final order = orders[index];

            return PastOrderCard(order: order);
          },
        ),
        state.paginationLoading!
            ? const Center(
                child: CircularProgressIndicator.adaptive(),
              )
            : const SizedBox()
      ],
    );
  }
}
