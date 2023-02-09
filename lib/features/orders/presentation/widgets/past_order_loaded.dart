import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../../../core/constants/app_layouts.dart';
import '../../../../core/widgets/empty_indicator.dart';
import '../blocs/cubit/past_orders_cubit.dart';
import 'past_orders_section.dart';

class PastOrdersLoaded extends StatelessWidget {
  const PastOrdersLoaded({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PastOrdersCubit, PastOrdersState>(
      builder: (context, state) {
        return state.completedOrders!.isEmpty && state.pendingOrders!.isEmpty
            ? SizedBox(
                height: Get.height * 0.6,
                child: const Center(
                    child: EmptyIndicator(title: 'لا يوجد طلبات سابقة')))
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  state.pendingOrders!.isEmpty
                      ? const SizedBox()
                      : PastOrdersSection(
                          state: state,
                          sectionTitle: 'قيد التنفيذ',
                          orders: state.pendingOrders!),
                  mediumVerticalSpace,
                  state.completedOrders!.isEmpty
                      ? const SizedBox()
                      : PastOrdersSection(
                          state: state,
                          sectionTitle: 'طلبات تاجحة',
                          orders: state.completedOrders!)
                ],
              );
      },
    );
  }
}
