import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yabalash_mobile_app/core/widgets/custom_shimmer.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../core/constants/app_layouts.dart';
import '../../../../core/theme/light/app_colors_light.dart';
import '../../../../core/utils/enums/request_state.dart';
import '../../../../core/widgets/custom_svg_icon.dart';
import '../blocs/cubit/recipie_details_cubit.dart';

class RecipieDetailsSection extends StatelessWidget {
  const RecipieDetailsSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RecipieDetailsCubit, RecipieDetailsState>(
      builder: (context, state) {
        switch (state.recipieRequestState) {
          case RequestState.idle:
            return const SizedBox();

          case RequestState.loading:
            return const RecipieDurationLoading();

          case RequestState.loaded:
            return RecipieDurationLoaded(
              state: state,
            );

          case RequestState.error:
            return const SizedBox();

          default:
            return const SizedBox();
        }
      },
    );
  }
}

class RecipieDurationLoaded extends StatelessWidget {
  final RecipieDetailsState state;
  const RecipieDurationLoaded({
    Key? key,
    required this.state,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Spacer(),
        Column(
          children: [
            Container(
                padding: kSecondaryPadding,
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: Colors.grey.shade300),
                child: CustomSvgIcon(
                  height: 25.h,
                  width: 25.w,
                  iconPath: AppAssets.clockIcon,
                  color: AppColorsLight.kAppPrimaryColorLight,
                )),
            smallVerticalSpace,
            Text(
              '${state.recipie!.duration} دقيقة',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: AppColorsLight.kAppPrimaryColorLight,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w600),
            )
          ],
        ),
        mediumHorizontalSpace,
        Column(
          children: [
            Container(
                padding: kSecondaryPadding,
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: Colors.grey.shade300),
                child: CustomSvgIcon(
                  height: 25.h,
                  width: 25.w,
                  iconPath: AppAssets.recipieIcon,
                  color: AppColorsLight.kAppPrimaryColorLight,
                )),
            smallVerticalSpace,
            Text('${state.recipie!.products!.length} منتجات',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: AppColorsLight.kAppPrimaryColorLight,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w600))
          ],
        ),
        const Spacer()
      ],
    );
  }
}

class RecipieDurationLoading extends StatelessWidget {
  const RecipieDurationLoading({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Spacer(),
        Column(
          children: [
            CustomShimmer(
              height: 65.h,
              width: 65.w,
            ),
            smallVerticalSpace,
            CustomShimmer(
              height: 10.h,
              width: 65.w,
            ),
          ],
        ),
        mediumHorizontalSpace,
        Column(
          children: [
            CustomShimmer(
              height: 65.h,
              width: 65.w,
            ),
            smallVerticalSpace,
            CustomShimmer(
              height: 10.h,
              width: 65.w,
            ),
          ],
        ),
        const Spacer()
      ],
    );
  }
}
