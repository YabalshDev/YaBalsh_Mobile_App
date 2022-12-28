import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:yabalash_mobile_app/core/constants/app_layouts.dart';
import 'package:yabalash_mobile_app/core/widgets/empty_indicator.dart';
import 'package:yabalash_mobile_app/core/widgets/sub_heading.dart';
import 'package:yabalash_mobile_app/features/orders/presentation/blocs/cubit/past_orders_cubit.dart';
import 'package:yabalash_mobile_app/features/orders/presentation/widgets/past_order_card.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../core/utils/enums/request_state.dart';
import '../../../../core/widgets/custom_header.dart';

class PastOrdersBody extends StatelessWidget {
  const PastOrdersBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: kDefaultPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomHeader(
                isWithNotification: true,
                iconPath: AppAssets.closeIcon,
                onIconTap: () => Get.back(),
                title: 'طلباتي',
              ),
              mediumVerticalSpace,
              BlocBuilder<PastOrdersCubit, PastOrdersState>(
                builder: (context, state) {
                  switch (state.ordersRequestState) {
                    case RequestState.idle:
                      return const SizedBox();

                    case RequestState.loading:
                      return SizedBox(
                        height: Get.height * 0.65,
                        child: const Center(
                          child: CircularProgressIndicator.adaptive(),
                        ),
                      );

                    case RequestState.loaded:
                      return state.completedOrders!.isEmpty &&
                              state.pendingOrders!.isEmpty
                          ? const EmptyIndicator(title: 'لا يوجد طلبات سابقة')
                          : state.pendingOrders!.isEmpty
                              ? const SizedBox()
                              : Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SubHeading(text: 'قيد التنفيذ'),
                                    ListView.builder(
                                      shrinkWrap: true,
                                      padding: kDefaultPadding,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      itemCount: state.pendingOrders!.length,
                                      itemBuilder: (context, index) {
                                        final pendingOrder =
                                            state.pendingOrders![index];

                                        return PastOrderCard(
                                            order: pendingOrder);
                                      },
                                    )
                                  ],
                                );
                    case RequestState.error:
                      return EmptyIndicator(title: state.errorMessage!);

                    default:
                      return const SizedBox();
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
