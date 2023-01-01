import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:yabalash_mobile_app/core/widgets/custom_shimmer.dart';

import '../../../home/domain/entities/product.dart';
import 'price_comparison_card.dart';

class PriceComparisonSection extends StatelessWidget {
  final Product product;
  const PriceComparisonSection({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      itemCount: product.prices!.entries.toList().length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        final priceModelEntry = product.prices!.entries.toList()[index];
        return PriceComparisonCard(
            index: index,
            priceModel: priceModelEntry,
            pricesLength: product.prices!.entries.toList().length);
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
