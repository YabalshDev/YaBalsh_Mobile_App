import 'package:flutter/material.dart';

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
