import 'package:flutter/material.dart';

import '../../features/home/domain/entities/product.dart';
import '../../features/home/presentation/widgets/home_product_card.dart';
import '../constants/app_layouts.dart';

class KewordProducts extends StatelessWidget {
  final List<Product> products;
  const KewordProducts({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: kScaffoldPadding,
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      itemCount: products.length,
      itemBuilder: (context, index) {
        final product = products[index];
        return HomeProductCard(product: product);
      },
    );
  }
}
