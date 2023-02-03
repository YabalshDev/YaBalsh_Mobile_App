import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yabalash_mobile_app/core/widgets/custom_animated_widget.dart';
import 'package:yabalash_mobile_app/core/widgets/custom_shimmer.dart';
import 'package:yabalash_mobile_app/features/product_details/presentation/blocs/cubit/product_details_cubit.dart';

import '../../../../core/theme/light/app_colors_light.dart';
import '../../../../core/utils/enums/request_state.dart';

class ProductKewordCards extends StatelessWidget {
  const ProductKewordCards({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductDetailsCubit, ProductDetailsState>(
      builder: (context, state) {
        switch (state.productRequestState) {
          case RequestState.idle:
            return const SizedBox();
          case RequestState.loading:
            return const ProductKewordsSectionLoading();
          case RequestState.loaded:
            return state.productRelevants.isEmpty
                ? const SizedBox()
                : CustomAnimatedWidget(
                    child: SizedBox(
                        height: 50.h,
                        child: ListView.builder(
                          padding: EdgeInsets.only(right: 15.w),
                          scrollDirection: Axis.horizontal,
                          itemCount: state.productRelevants.length,
                          itemBuilder: (context, index) {
                            final keword = state.productRelevants[index];

                            return Card(
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 5.h, horizontal: 10.w),
                                child: Text(
                                  keword,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(
                                          color: AppColorsLight
                                              .kDisabledButtonTextColor),
                                ),
                              ),
                            );
                          },
                        )),
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

class ProductKewordsSectionLoading extends StatelessWidget {
  const ProductKewordsSectionLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 50.h,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 4,
          itemBuilder: (context, index) {
            return CustomShimmer(
              width: 60.w,
              height: 24.h,
            );
          },
        ));
  }
}
