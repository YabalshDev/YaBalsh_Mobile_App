import 'package:flutter/material.dart';

import '../../../../core/constants/app_layouts.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/theme/light/app_colors_light.dart';
import '../../../home/domain/entities/product.dart';
import 'near_you_section.dart';
import 'price_comparison_section.dart';
import 'product_image_card.dart';
import 'product_kewords_card.dart';

class ProductDetailsLoaded extends StatelessWidget {
  const ProductDetailsLoaded({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ProductImageCard(imagePath: product.imagePath!),
        Text(
          product.name!,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: AppColorsLight.kAppPrimaryColorLight,
              fontWeight: FontWeight.w700),
        ),
        smallVerticalSpace,
        const ProductKewordCards(),
        mediumVerticalSpace,
        Row(
          children: [
            Text(
              AppStrings.discoverComparePrices,
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge
                  ?.copyWith(color: Colors.black, fontWeight: FontWeight.w700),
            ),
            const Spacer(),
            const NearYouSection()
          ],
        ),
        mediumVerticalSpace,
        const PriceComparisonSection(),
        mediumVerticalSpace,
      ],
    );
  }
}
