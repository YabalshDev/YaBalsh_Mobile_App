import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:yabalash_mobile_app/core/constants/app_layouts.dart';
import 'package:yabalash_mobile_app/core/widgets/empty_indicator.dart';
import 'package:yabalash_mobile_app/core/widgets/sub_heading.dart';
import 'package:yabalash_mobile_app/features/orders/presentation/blocs/cubit/past_orders_cubit.dart';
import 'package:yabalash_mobile_app/features/orders/presentation/widgets/past_order_card.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../core/utils/enums/request_state.dart';
import '../../../../core/widgets/custom_header.dart';
import '../../domain/entities/order.dart';

class PastOrdersBody extends StatelessWidget {
  const PastOrdersBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: kDefaultPadding,
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(
              child: CustomHeader(
                iconPath: AppAssets.closeIcon,
                onIconTap: () => Get.back(),
                title: 'طلباتي',
              ),
            ),
            SliverToBoxAdapter(child: mediumVerticalSpace),
            const SliverToBoxAdapter(child: PastOrdersList())
          ],
        ),
      ),
    );
  }
}

class PastOrdersList extends StatelessWidget {
  const PastOrdersList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PastOrdersCubit, PastOrdersState>(
      builder: (context, state) {
        switch (state.ordersRequestState) {
          case RequestState.idle:
            return const SizedBox();

          case RequestState.loading:
            return const PastOrdersLoading();

          case RequestState.loaded:
            return const PastOrdersLoaded();
          case RequestState.error:
            return SizedBox(
              height: Get.height * 0.6,
              child: Center(child: EmptyIndicator(title: state.errorMessage!)),
            );

          default:
            return const SizedBox();
        }
      },
    );
  }
}

class PastOrdersLoading extends StatelessWidget {
  const PastOrdersLoading({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height * 0.65,
      child: const Center(
        child: CircularProgressIndicator.adaptive(),
      ),
    );
  }
}

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
                          sectionTitle: 'قيد التنفيذ',
                          orders: state.pendingOrders!),
                  mediumVerticalSpace,
                  state.completedOrders!.isEmpty
                      ? const SizedBox()
                      : PastOrdersSection(
                          sectionTitle: 'طلبات تاجحة',
                          orders: state.completedOrders!)
                ],
              );
      },
    );
  }
}

class PastOrdersSection extends StatelessWidget {
  final String sectionTitle;
  final List<Order> orders;
  const PastOrdersSection({
    Key? key,
    required this.sectionTitle,
    required this.orders,
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
        )
      ],
    );
  }
}
