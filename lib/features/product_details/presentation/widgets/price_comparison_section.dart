import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:yabalash_mobile_app/core/constants/app_layouts.dart';
import 'package:yabalash_mobile_app/core/widgets/custom_shimmer.dart';
import 'package:yabalash_mobile_app/features/product_details/presentation/widgets/price_card_showmore.dart';

import '../blocs/cubit/product_details_cubit.dart';
import 'price_comparison_card.dart';

class PriceComparisonSection extends StatelessWidget {
  const PriceComparisonSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductDetailsCubit, ProductDetailsState>(
      // buildWhen: (previous, current) =>
      //     previous.withNearStores != current.withNearStores,
      builder: (context, state) {
        if (state.withNearStores! && state.nearStores!.isNotEmpty) {
          return Column(
            children: [
              SizedBox(
                height: (state.showMore! && state.nearStores!.length > 5
                        ? state.nearStores!.sublist(0, 5).length
                        : state.nearStores!.length) *
                    62.h,
                child: ListView.builder(
                  key: UniqueKey(),
                  physics: const NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.zero,
                  itemCount: state.showMore! && state.nearStores!.length > 5
                      ? state.nearStores!.sublist(0, 5).length
                      : state.nearStores!.length,
                  itemBuilder: (context, index) {
                    final store = state.nearStores![index];
                    final isAvailable =
                        state.product!.prices![store.name]!.isAvailable;
                    final price = state.product!.prices![store.name]!.price;
                    return PriceComparisonCard(
                      price: price!,
                      store: store,
                      isAvailable: isAvailable!,
                    );
                  },
                ),
              ),
              smallVerticalSpace,
              PriceCardShowMore(
                pricesLength: state.nearStores!.length,
              )
            ],
          );
        } else if (!state.withNearStores! && state.productStores!.isNotEmpty) {
          return Column(
            children: [
              Column(
                children: [
                  SizedBox(
                    height: (state.showMore! && state.productStores!.length > 5
                            ? state.productStores!.sublist(0, 5).length
                            : state.productStores!.length) *
                        62.h,
                    child: ListView.builder(
                      key: UniqueKey(),
                      padding: EdgeInsets.zero,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount:
                          state.showMore! && state.productStores!.length > 5
                              ? state.productStores!.sublist(0, 5).length
                              : state.productStores!.length,
                      itemBuilder: (context, index) {
                        final store = state.productStores![index];
                        final isAvailable =
                            state.product!.prices![store.name]!.isAvailable;
                        final price = state.product!.prices![store.name]!.price;
                        return PriceComparisonCard(
                          store: store,
                          isAvailable: isAvailable!,
                          price: price!,
                        );
                      },
                    ),
                  ),
                ],
              ),
              smallVerticalSpace,
              PriceCardShowMore(
                pricesLength: state.productStores!.length,
              )
            ],
          );
        } else {
          return const SizedBox();
        }
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
