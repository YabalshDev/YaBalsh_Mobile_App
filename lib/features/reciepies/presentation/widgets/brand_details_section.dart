import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../domain/entities/brand.dart';
import 'brand_card.dart';

class CreatorDetailsSection extends StatelessWidget {
  const CreatorDetailsSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
        child: BrandCard(
      brand: (Get.routing.args as Brand),
    ));
  }
}
