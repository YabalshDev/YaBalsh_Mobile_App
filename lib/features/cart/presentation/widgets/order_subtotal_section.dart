import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_layouts.dart';
import '../../../../core/theme/light/app_colors_light.dart';
import '../blocs/cubit/order_summary_cubit.dart';

class OrderSubTotalSection extends StatelessWidget {
  const OrderSubTotalSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: kDefaultPadding,
      child: Row(
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
                      '${BlocProvider.of<OrderSummaryCubit>(context).supermarket.price} جنيه',
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall
                          ?.copyWith(color: Colors.black, fontSize: 12.sp)),
                ],
              ),
              mediumVerticalSpace,
              Text(
                'وفرت ${BlocProvider.of<OrderSummaryCubit>(context).supermarket.saving!.toStringAsFixed(0)} جنيه ',
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
                      '${BlocProvider.of<OrderSummaryCubit>(context).supermarket.store!.locations![0].deliveryTime ?? 30} جنيه',
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
                  ((BlocProvider.of<OrderSummaryCubit>(context)
                              .supermarket
                              .price)! +
                          30)
                      .toStringAsFixed(2),
                  style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                        color: AppColorsLight.kAppPrimaryColorLight,
                      )),
            ],
          )
        ],
      ),
    );
  }
}
