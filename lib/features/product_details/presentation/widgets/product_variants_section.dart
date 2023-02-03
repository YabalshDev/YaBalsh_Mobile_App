import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../core/constants/app_layouts.dart';
import '../../../../core/utils/enums/request_state.dart';
import '../../../../core/widgets/custom_shimmer.dart';
import '../../../../core/widgets/empty_indicator.dart';
import '../../../../core/widgets/sub_heading.dart';
import '../blocs/cubit/product_details_cubit.dart';
import 'variant_card.dart';

class ProductVariantsSection extends StatelessWidget {
  const ProductVariantsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductDetailsCubit, ProductDetailsState>(
      buildWhen: (previous, current) =>
          previous.productVariationRequestState !=
          current.productVariationRequestState,
      builder: (context, state) {
        switch (state.productVariationRequestState) {
          case RequestState.idle:
            return const SizedBox();
          case RequestState.loading:
            return SizedBox(
                height: 80.h,
                child: ListView.builder(
                  padding: EdgeInsets.only(right: 15.w),
                  scrollDirection: Axis.horizontal,
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return CustomShimmer(
                      width: 145.w,
                      height: 45.h,
                    );
                  },
                ));

          case RequestState.loaded:
            return state.productVaraiations!.isEmpty
                ? const SizedBox()
                : Padding(
                    padding: EdgeInsets.only(right: 15.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SubHeading(text: 'احجام اخرى للمنتج'),
                        mediumVerticalSpace,
                        SizedBox(
                          height: 63.5.h,
                          child: ListView.builder(
                            padding: EdgeInsets.zero,
                            scrollDirection: Axis.horizontal,
                            itemCount: state.productVaraiations!.length,
                            itemBuilder: (context, index) {
                              final variant = state.productVaraiations![index];
                              return VariantCard(
                                variant: variant,
                                index: index,
                              );
                            },
                          ),
                        ),
                        mediumVerticalSpace
                      ],
                    ),
                  );
          case RequestState.error:
            return SizedBox(
              height: Get.height * 0.6,
              child: const Center(
                child: EmptyIndicator(title: 'مشكلة في جلب المنتج '),
              ),
            );

          default:
            return const SizedBox();
        }
      },
    );
  }
}
