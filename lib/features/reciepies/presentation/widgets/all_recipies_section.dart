import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:yabalash_mobile_app/core/constants/app_layouts.dart';
import 'package:yabalash_mobile_app/core/widgets/custom_shimmer.dart';
import 'package:yabalash_mobile_app/core/widgets/empty_indicator.dart';
import 'package:yabalash_mobile_app/core/widgets/sub_heading.dart';

import '../../../../core/utils/enums/request_state.dart';
import '../blocs/cubit/recipies_cubit.dart';
import 'reciepie_card.dart';

class AllRecipiesSection extends StatelessWidget {
  const AllRecipiesSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RecipiesCubit, RecipiesState>(
      buildWhen: (previous, current) =>
          previous.recipiesRequestState != current.recipiesRequestState,
      builder: (context, state) {
        switch (state.recipiesRequestState) {
          case RequestState.idle:
            return const SizedBox();

          case RequestState.loading:
            return const AllRecipiesLoading();

          case RequestState.loaded:
            return state.recipies!.isEmpty
                ? SizedBox(
                    height: Get.height * 0.6,
                    child: const Center(
                        child: EmptyIndicator(title: 'لا يوجد وصفات')))
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SubHeading(text: 'طبختك علي قد ايدك!'),
                      smallVerticalSpace,
                      Expanded(
                        child: ListView.builder(
                          itemCount: state.recipies!.length,
                          itemBuilder: (context, index) {
                            final recipie = state.recipies![index];
                            return RecipieCard(
                              recipie: recipie,
                            );
                          },
                        ),
                      ),
                    ],
                  );
          case RequestState.error:
            return SizedBox(
                height: Get.height * 0.6,
                child: Center(
                    child: EmptyIndicator(title: state.recipiesErrorMessage!)));
          default:
            return const SizedBox();
        }
      },
    );
  }
}

class AllRecipiesLoading extends StatelessWidget {
  const AllRecipiesLoading({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return Row(
          children: [
            CustomShimmer(
              width: 60.w,
              height: 60.h,
            ),
            mediumHorizontalSpace,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomShimmer(
                  width: Get.width * 0.5,
                  height: 20.h,
                ),
                smallVerticalSpace,
                CustomShimmer(
                  width: Get.width * 0.5,
                  height: 20.h,
                ),
              ],
            )
          ],
        );
      },
    );
  }
}
