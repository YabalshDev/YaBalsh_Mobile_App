import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yabalash_mobile_app/core/widgets/custom_shimmer.dart';
import 'package:yabalash_mobile_app/features/orders/presentation/blocs/cubit/order_success_cubit.dart';

import '../../../../core/constants/app_layouts.dart';
import '../../../../core/depedencies.dart';
import '../../../../core/theme/light/app_colors_light.dart';
import '../../../../core/utils/enums/request_state.dart';
import '../../../orders/domain/entities/order.dart';
import '../blocs/cubit/cart_cubit.dart';

class OrderSubTotalSection extends StatelessWidget {
  final Order? order;
  final bool isFromOrderDetails;
  const OrderSubTotalSection(
      {super.key, this.order, required this.isFromOrderDetails});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text('الحساب',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Colors.grey.shade400, fontSize: 12.sp)),
                smallHorizontalSpace,
                Text(
                    '${order != null ? order?.subTotal : getIt<CartCubit>().state.supermarket!.price!.toStringAsFixed(2)} جنيه',
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall
                        ?.copyWith(color: Colors.black, fontSize: 12.sp)),
              ],
            ),
            mediumVerticalSpace,
            order != null && isFromOrderDetails
                ? BlocBuilder<OrderSuccessCubit, OrderSuccessState>(
                    builder: (context, state) {
                      switch (state.savingRequestState) {
                        case RequestState.idle:
                          return const SizedBox();
                        case RequestState.loading:
                          return CustomShimmer(
                            width: 40.w,
                            height: 10.h,
                          );
                        case RequestState.loaded:
                          return Text(
                            'وفرت ${state.saving!.toStringAsFixed(0)} جنيه ',
                            style:
                                Theme.of(context).textTheme.bodySmall?.copyWith(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.green.shade500,
                                    ),
                          );
                        case RequestState.error:
                          return const SizedBox();
                        default:
                          return const SizedBox();
                      }
                    },
                  )
                : Text(
                    'وفرت ${getIt<CartCubit>().state.supermarket!.saving!.toStringAsFixed(0)} جنيه ',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                          color: Colors.green.shade500,
                        ),
                  ),
            mediumVerticalSpace,
            Row(
              children: [
                Text('التوصيل',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Colors.grey.shade400, fontSize: 12.sp)),
                smallHorizontalSpace,
                Text(
                    '${order != null ? 30 : getIt<CartCubit>().state.supermarket!.store!.locations![0].deliveryTime ?? 30} جنيه',
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall
                        ?.copyWith(color: Colors.black, fontSize: 12.sp)),
              ],
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('الاجمالي',
                style: Theme.of(context)
                    .textTheme
                    .bodySmall
                    ?.copyWith(color: Colors.grey.shade400, fontSize: 12.sp)),
            smallVerticalSpace,
            Text(
                ((order != null
                            ? order!.subTotal
                            : getIt<CartCubit>().state.supermarket!.price)! +
                        40)
                    .toStringAsFixed(2),
                style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                      color: AppColorsLight.kAppPrimaryColorLight,
                    )),
          ],
        )
      ],
    );
  }
}
