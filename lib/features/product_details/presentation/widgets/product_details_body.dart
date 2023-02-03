import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yabalash_mobile_app/core/constants/app_layouts.dart';
import 'package:yabalash_mobile_app/core/theme/light/app_colors_light.dart';

import 'popular_products_section.dart';
import 'product_details_section.dart';
import 'product_variants_section.dart';

class ProductDetailsBody extends StatelessWidget {
  const ProductDetailsBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(physics: const BouncingScrollPhysics(), slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: kDefaultPadding,
            child: InkWell(
              onTap: () => Get.back(),
              child: const Icon(
                Icons.arrow_back_ios,
                color: AppColorsLight.kAppPrimaryColorLight,
              ),
            ),
          ),
        ),
        const SliverToBoxAdapter(child: ProductDetailsSection()),
        const SliverToBoxAdapter(child: ProductVariantsSection()),
        const SliverToBoxAdapter(child: PopularProductsSection())
      ]),
    );
  }
}
