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
        if (state.withNearStores! && state.nearStores!.isNotEmpty) {
          return ListView.builder(
            key: UniqueKey(),
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            itemCount: state.showMore! && state.nearStores!.length > 5
                ? state.nearStores!.sublist(0, 4).length
                : state.nearStores!.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              final store = state.nearStores![index];
              final isAvailable =
                  state.product!.prices![store.name]!.isAvailable;
              final price = state.product!.prices![store.name]!.price;
              return PriceComparisonCard(
                index: index,
                price: price!,
                isNear: true,
                store: store,
                isAvailable: isAvailable!,
                pricesLength: state.showMore! && state.nearStores!.length > 5
                    ? state.nearStores!.sublist(0, 4).length
                    : state.nearStores!.length,
              );
            },
          );
        } else if (!state.withNearStores! && state.productStores!.isNotEmpty) {
          return ListView.builder(
            key: UniqueKey(),
            padding: EdgeInsets.zero,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: state.showMore! && state.productStores!.length > 5
                ? state.productStores!.sublist(0, 4).length
                : state.productStores!.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              final store = state.productStores![index];
              final isAvailable =
                  state.product!.prices![store.name]!.isAvailable;
              final price = state.product!.prices![store.name]!.price;
              return PriceComparisonCard(
                index: index,
                store: store,
                isAvailable: isAvailable!,
                price: price!,
                isNear: false,
                pricesLength: state.showMore! && state.productStores!.length > 5
                    ? state.productStores!.sublist(0, 4).length
                    : state.productStores!.length,
              );
            },
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
