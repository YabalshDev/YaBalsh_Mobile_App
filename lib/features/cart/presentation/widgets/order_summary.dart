import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:yabalash_mobile_app/core/constants/app_layouts.dart';
import 'package:yabalash_mobile_app/core/widgets/empty_indicator.dart';

import '../../../../core/utils/enums/request_state.dart';
import '../blocs/cubit/order_summary_cubit.dart';
import 'order_details_widget.dart';
import 'order_subtotal_section.dart';
import 'promo_section.dart';
import 'super_market_details_card.dart';
import 'user_address_card.dart';

class OrderSummary extends StatelessWidget {
  const OrderSummary({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderSummaryCubit, OrderSummaryState>(
      builder: (context, state) {
        switch (state.addressesRequestState) {
          case RequestState.idle:
            return const SizedBox();

          case RequestState.loading:
            return SizedBox(
              height: Get.height * 0.6,
              child: const Center(
                child: CircularProgressIndicator.adaptive(),
              ),
            );
          case RequestState.loaded:
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'مراجعة الطلب',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w700, fontSize: 17.sp),
                  ),
                  mediumVerticalSpace,
                  SupermarketDetailsCard(
                    superMarketCardModel:
                        BlocProvider.of<OrderSummaryCubit>(context).supermarket,
                  ),
                  mediumVerticalSpace,
                  UserAddressCard(state: state),
                  smallVerticalSpace,
                  Text(
                    'تفاصيل الطلب',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w700, fontSize: 17.sp),
                  ),
                  const OrderDetailsSection(),
                  mediumVerticalSpace,
                  Divider(
                    color: Colors.grey.shade300,
                    thickness: 1,
                  ),
                  mediumVerticalSpace,
                  const PromoSection(),
                  mediumVerticalSpace,
                  Divider(
                    color: Colors.grey.shade300,
                    thickness: 1,
                  ),
                  mediumHorizontalSpace,
                  Text(
                    'تفاصيل الحساب',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w700, fontSize: 17.sp),
                  ),
                  const OrderSubTotalSection()
                ],
              ),
            );

          case RequestState.error:
            return SizedBox(
                height: Get.height * 0.6,
                child: const EmptyIndicator(
                    title: 'حصل مشكلة اثناء جلب العناوين'));

          default:
            return const SizedBox();
        }
      },
    );
  }
}
