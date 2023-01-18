import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:yabalash_mobile_app/core/widgets/custom_shimmer.dart';

import '../blocs/cubit/product_details_cubit.dart';
import 'price_comparison_card.dart';

class PriceComparisonSection extends StatelessWidget {
  const PriceComparisonSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductDetailsCubit, ProductDetailsState>(
      builder: (context, state) {
        return ListView.builder(
          key: UniqueKey(),
          physics: const NeverScrollableScrollPhysics(),
          itemCount: state.showMore! &&
                  state.product!.prices!.entries.toList().length > 5
              ? state.product!.prices!.entries.toList().sublist(0, 4).length
              : state.product!.prices!.entries.toList().length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            final priceModelEntry =
                state.product!.prices!.entries.toList()[index];
            return PriceComparisonCard(
                index: index,
                priceModel: priceModelEntry,
                pricesLength: state.showMore! &&
                        state.product!.prices!.entries.toList().length > 5
                    ? state.product!.prices!.entries
                        .toList()
                        .sublist(0, 4)
                        .length
                    : state.product!.prices!.entries.toList().length);
          },
        );
      },
    );
  }
}

class PriceComparisonSectionLoading extends StatelessWidget {
  const PriceComparisonSectionLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 3,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return CustomShimmer(
          height: 60.h,
          width: Get.width,
        );
      },
    );
  }
}
