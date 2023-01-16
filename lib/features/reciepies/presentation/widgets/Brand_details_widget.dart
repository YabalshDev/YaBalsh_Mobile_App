import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:yabalash_mobile_app/core/widgets/empty_indicator.dart';

import '../../../../core/constants/app_layouts.dart';
import '../../../../core/theme/light/app_colors_light.dart';
import '../../../../core/utils/enums/request_state.dart';
import '../../../../core/widgets/custom_card.dart';
import '../../../../core/widgets/custom_shimmer.dart';
import '../blocs/cubit/recipie_details_cubit.dart';

class BrandDetailsWidget extends StatelessWidget {
  const BrandDetailsWidget({
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
            return const RecipieDetailsLoading();

          case RequestState.loaded:
            return RecipieDetailsLoaded(
              state: state,
            );

          case RequestState.error:
            return SizedBox(
              height: Get.height * 0.6,
              child: Center(
                child: EmptyIndicator(title: state.errorMessage!),
              ),
            );

          default:
            return const SizedBox();
        }
      },
    );
  }
}

class RecipieDetailsLoaded extends StatelessWidget {
  final RecipieDetailsState state;
  const RecipieDetailsLoaded({
    Key? key,
    required this.state,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: kDefaultPadding,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: CustomCard(
              withBorder: false,
              isAssetImage: true,
              imagePath: state.recipie!.brand!.imagePath,
            ),
          ),
          smallHorizontalSpace,
          Expanded(
            flex: 5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(state.recipie!.title!,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: AppColorsLight.kAppPrimaryColorLight,
                        fontWeight: FontWeight.w600,
                        fontSize: 14.sp)),
                mediumVerticalSpace,
                Text(state.recipie!.subTitle!,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: AppColorsLight.kAppPrimaryColorLight
                              .withOpacity(0.6),
                        )),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class RecipieDetailsLoading extends StatelessWidget {
  const RecipieDetailsLoading({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomShimmer(
          height: 75.h,
          width: 75.w,
        ),
        mediumHorizontalSpace,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomShimmer(
              height: 15.h,
              width: 75.w,
            ),
            smallVerticalSpace,
            CustomShimmer(
              height: 15.h,
              width: 75.w,
            ),
          ],
        )
      ],
    );
  }
}
