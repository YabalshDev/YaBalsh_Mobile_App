import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:yabalash_mobile_app/core/widgets/custom_animated_widget.dart';
import 'package:yabalash_mobile_app/core/widgets/custom_shimmer.dart';
import 'package:yabalash_mobile_app/core/widgets/empty_indicator.dart';
import 'package:yabalash_mobile_app/features/reciepies/presentation/blocs/cubit/brands_cubit.dart';

import '../../../../core/constants/app_layouts.dart';
import '../../../../core/utils/enums/request_state.dart';
import '../../../../core/widgets/sub_heading.dart';
import 'reciepie_card.dart';

class CreatorRecipiesSection extends StatelessWidget {
  const CreatorRecipiesSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BrandsCubit, BrandsState>(
      builder: (context, state) {
        switch (state.recipiesRequestState) {
          case RequestState.idle:
            return const SizedBox();

          case RequestState.loading:
            return const BrandsRecipiesLoading();
          case RequestState.loaded:
            return state.recipies!.isEmpty
                ? SizedBox(
                    height: Get.height * 0.6,
                    child: const Center(
                      child: EmptyIndicator(title: "لا يوجد وصفات"),
                    ),
                  )
                : BrandRecipiesLoaded(
                    state: state,
                  );

          case RequestState.error:
            return SizedBox(
              height: Get.height * 0.5,
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

class BrandsRecipiesLoading extends StatelessWidget {
  const BrandsRecipiesLoading({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 6,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return CustomShimmer(
          height: 80.h,
          width: Get.width,
        );
      },
    );
  }
}

class BrandRecipiesLoaded extends StatelessWidget {
  final BrandsState state;
  const BrandRecipiesLoaded({
    Key? key,
    required this.state,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomAnimatedWidget(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SubHeading(text: 'جميع الوصفات'),
          smallVerticalSpace,
          ListView.builder(
            itemCount: state.recipies!.length,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return RecipieCard(
                recipie: state.recipies![index],
              );
            },
          )
        ],
      ),
    );
  }
}
