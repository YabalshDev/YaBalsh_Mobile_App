import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_layouts.dart';
import '../../../../core/theme/light/app_colors_light.dart';
import '../../../../core/widgets/custom_card.dart';
import '../blocs/cubit/store_details_cubit.dart';

class BranchStoreDetails extends StatelessWidget {
  const BranchStoreDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StoreDetailsCubit, StoreDetailsState>(
      builder: (context, state) {
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomCard(
              isAssetImage: false,
              imagePath: state.store!.logoImagePath,
              fit: BoxFit.fill,
            ),
            smallHorizontalSpace,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  state.store!.name!,
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontWeight: FontWeight.w600,
                      color: AppColorsLight.kAppPrimaryColorLight),
                ),
                smallVerticalSpace,
                Row(
                  children: [
                    Icon(
                      Icons.star,
                      color: AppColorsLight.warningColor,
                      size: 23.h,
                    ),
                    smallHorizontalSpace,
                    Text(
                      '4.3 ( +100 تقييم )',
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: AppColorsLight.darkPurpleColor,
                          fontSize: 12.sp),
                    )
                  ],
                )
              ],
            )
          ],
        );
      },
    );
  }
}
