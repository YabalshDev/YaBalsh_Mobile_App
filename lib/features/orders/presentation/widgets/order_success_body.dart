import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:yabalash_mobile_app/core/constants/app_assets.dart';
import 'package:yabalash_mobile_app/core/theme/light/app_colors_light.dart';
import 'package:yabalash_mobile_app/core/utils/date_time_utils.dart';
import 'package:yabalash_mobile_app/core/widgets/custom_svg_icon.dart';
import 'package:yabalash_mobile_app/features/cart/presentation/blocs/cubit/cart_cubit.dart';
import 'package:yabalash_mobile_app/features/cart/presentation/widgets/order_subtotal_section.dart';
import 'package:yabalash_mobile_app/features/cart/presentation/widgets/super_market_details_card.dart';

import '../../../../core/constants/app_layouts.dart';
import '../../../../core/depedencies.dart';
import '../../../../core/routes/app_routes.dart';
import '../../../../core/widgets/sub_heading.dart';
import '../../../cart/presentation/widgets/order_details_widget.dart';
import '../../domain/entities/order.dart';
import '../blocs/cubit/order_success_cubit.dart';
import 'delivery_details_section.dart';
import 'payment_section.dart';
import 'status_card.dart';

class OrderSuccessBody extends StatelessWidget {
  final Order order;
  final bool isFromOrderDetails;
  const OrderSuccessBody(
      {super.key, required this.order, required this.isFromOrderDetails});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: kDefaultPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              mediumVerticalSpace,
              InkWell(
                onTap: () {
                  if (isFromOrderDetails) {
                    Get.back();
                  } else {
                    getIt<CartCubit>().resetCart();
                    Get.offAllNamed(RouteHelper.getMainNavigationRoute(),
                        arguments: 0);
                  }
                },
                child: const CustomSvgIcon(
                  iconPath: AppAssets.closeIcon,
                  color: AppColorsLight.kAppPrimaryColorLight,
                ),
              ),
              mediumVerticalSpace,
              Text(
                'رقم الطلب #86988378${order.id}',
                style: Theme.of(context)
                    .textTheme
                    .bodySmall
                    ?.copyWith(color: Colors.grey.shade500),
              ),
              mediumVerticalSpace,
              StatusCard(
                status: order.status ?? '',
              ),
              largeVerticalSpace,
              Text(
                'وقت الوصول المتوقع',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontSize: 13.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.w400),
              ),
              Text(
                isFromOrderDetails
                    ? formatDateToArabicIndex(formatDateToPmAmFormat(
                        order.orderDate!.add(const Duration(minutes: 30))))
                    : generateExpectedTime(order.orderDate!, 30),
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontSize: 17.sp,
                      color: AppColorsLight.kAppPrimaryColorLight,
                    ),
              ),
              mediumVerticalSpace,
              SupermarketDetailsCard(
                  store: order.store!, isFromOrderSuccess: true),
              largeVerticalSpace,
              DeliveryDetailsSection(address: order.address!),
              smallVerticalSpace,
              const PaymentSection(),
              smallVerticalSpace,
              Row(
                children: [
                  const SubHeading(text: 'الاصناف'),
                  smallHorizontalSpace,
                  mediumHorizontalSpace,
                  Text(
                    '${order.products!.length} اصناف',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontSize: 13.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.w400),
                  ),
                  const Spacer(),
                  BlocBuilder<OrderSuccessCubit, OrderSuccessState>(
                    builder: (context, state) {
                      return InkWell(
                        onTap: () {
                          if (state.viewDetails!) {
                            BlocProvider.of<OrderSuccessCubit>(context)
                                .changeViewDetails(false);
                          } else {
                            BlocProvider.of<OrderSuccessCubit>(context)
                                .changeViewDetails(true);
                          }
                        },
                        child: Icon(
                          !state.viewDetails!
                              ? Icons.keyboard_arrow_down
                              : Icons.keyboard_arrow_up,
                          color: AppColorsLight.kAppPrimaryColorLight
                              .withOpacity(0.6),
                        ),
                      );
                    },
                  )
                ],
              ),
              BlocBuilder<OrderSuccessCubit, OrderSuccessState>(
                builder: (context, state) {
                  if (!state.viewDetails!) {
                    return const SizedBox();
                  } else {
                    return FadeIn(
                        duration: const Duration(milliseconds: 600),
                        child: OrderDetailsSection(
                          orderProducts: order.products!,
                        ));
                  }
                },
              ),
              mediumVerticalSpace,
              const SubHeading(text: 'تفاصيل الحساب'),
              largeVerticalSpace,
              OrderSubTotalSection(
                order: order,
                isFromOrderDetails: isFromOrderDetails,
              )
            ],
          ),
        ),
      ),
    );
  }
}
