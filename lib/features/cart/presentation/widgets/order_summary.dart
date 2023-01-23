import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:yabalash_mobile_app/core/constants/app_layouts.dart';
import 'package:yabalash_mobile_app/core/widgets/empty_indicator.dart';
import 'package:yabalash_mobile_app/core/widgets/sub_heading.dart';

import '../../../../core/utils/enums/request_state.dart';
import '../blocs/cubit/order_summary_cubit.dart';
import 'order_details_widget.dart';
import 'order_subtotal_section.dart';
import 'promo_section.dart';
import 'super_market_details_card.dart';
import 'user_address_card.dart';

final _promoFormKey = GlobalKey<FormBuilderState>();

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
                  PromoSection(formKey: _promoFormKey),
                  mediumVerticalSpace,
                  Divider(
                    color: Colors.grey.shade300,
                    thickness: 1,
                  ),
                  mediumHorizontalSpace,
                  const SubHeading(text: 'تفاصيل الحساب'),
                  const OrderSubTotalSection(
                    isFromOrderDetails: false,
                  )
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
