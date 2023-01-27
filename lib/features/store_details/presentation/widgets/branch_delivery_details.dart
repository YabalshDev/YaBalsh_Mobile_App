import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_layouts.dart';
import '../../../../core/theme/light/app_colors_light.dart';
import '../../../../core/widgets/custom_network_image.dart';
import '../blocs/cubit/store_details_cubit.dart';

class BranchDeliveryDetails extends StatelessWidget {
  const BranchDeliveryDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StoreDetailsCubit, StoreDetailsState>(
      builder: (context, state) {
        return Row(
          children: [
            Expanded(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'رسوم التوصيل',
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        fontWeight: FontWeight.w700,
                        color: AppColorsLight.darkPurpleColor,
                        fontSize: 12.sp),
                  ),
                  smallVerticalSpace,
                  Text(
                    '${double.parse(state.store!.location!.deliveryFees!).ceil()} جنيه',
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        fontWeight: FontWeight.w700,
                        color: AppColorsLight.kDisabledButtonTextColor,
                        fontSize: 12.sp),
                  )
                ],
              ),
            ),
            Container(
              height: 40.h,
              width: 1.w,
              color: AppColorsLight.kDisabledButtonTextColor.withOpacity(0.6),
            ),
            Expanded(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'وقت التوصيل',
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        fontWeight: FontWeight.w700,
                        color: AppColorsLight.darkPurpleColor,
                        fontSize: 12.sp),
                  ),
                  smallVerticalSpace,
                  Text(
                    '${state.store!.location!.deliveryTime} دقيقة',
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        fontWeight: FontWeight.w700,
                        color: AppColorsLight.kDisabledButtonTextColor,
                        fontSize: 12.sp),
                  )
                ],
              ),
            ),
            Container(
              height: 40.h,
              width: 1.w,
              color: AppColorsLight.kDisabledButtonTextColor.withOpacity(0.6),
            ),
            Expanded(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'توصيل بواسطة',
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        fontWeight: FontWeight.w700,
                        color: AppColorsLight.darkPurpleColor,
                        fontSize: 12.sp),
                  ),
                  smallVerticalSpace,
                  SizedBox(
                    width: 65.w,
                    height: 16.h,
                    child: AppImage(
                      path: state.store!.cardImagePath,
                    ),
                  )
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
