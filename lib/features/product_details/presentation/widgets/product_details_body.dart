import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yabalash_mobile_app/core/theme/light/app_colors_light.dart';

import '../../../../core/constants/app_layouts.dart';
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
      child: Padding(
        padding: kDefaultPadding,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () => Get.back(),
                child: const Icon(
                  Icons.arrow_back_ios,
                  color: AppColorsLight.kAppPrimaryColorLight,
                ),
              ),
              const ProductDetailsSection(),
              const ProductVariantsSection(),
              const PopularProductsSection()
            ],
          ),
        ),
      ),
    );
  }
}
