import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:get/get.dart';
import 'package:yabalash_mobile_app/core/constants/app_layouts.dart';
import 'package:yabalash_mobile_app/core/widgets/error_indicator.dart';
import 'package:yabalash_mobile_app/core/widgets/sub_heading.dart';

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
            return const OrderSummaryLoaded();

          case RequestState.error:
            return SizedBox(
                height: Get.height * 0.6,
                child: const ErrorIndicator(
                    errorMessage: 'حصل مشكلة اثناء جلب العناوين'));

          default:
            return const SizedBox();
        }
      },
    );
  }
}

class OrderSummaryLoaded extends StatelessWidget {
  const OrderSummaryLoaded({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderSummaryCubit, OrderSummaryState>(
        builder: (context, state) {
      return KeyboardVisibilityBuilder(builder: (context, isVisible) {
        return SingleChildScrollView(
          reverse: isVisible,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SubHeading(text: 'مراجعة الطلب'),
              mediumVerticalSpace,
              SupermarketDetailsCard(
                superMarketCardModel:
                    BlocProvider.of<OrderSummaryCubit>(context).supermarket,
              ),
              mediumVerticalSpace,
              UserAddressCard(state: state),
              smallVerticalSpace,
              const SubHeading(text: 'تفاصيل الطلب'),
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
              const SubHeading(text: 'تفاصيل الحساب'),
              const OrderSubTotalSection(
                isFromOrderDetails: false,
              ),
              SizedBox(
                height: isVisible ? Get.height * 0.3 : 0,
              )
            ],
          ),
        );
      });
    });
  }
}
