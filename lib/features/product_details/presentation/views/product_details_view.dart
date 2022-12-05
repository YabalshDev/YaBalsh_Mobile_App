import 'package:flutter/material.dart';

import '../../../home/domain/entities/product.dart';
import '../widgets/product_details_body.dart';

class ProductDetailsView extends StatelessWidget {
  final Product product;
  const ProductDetailsView({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ProductDetailsBody(
        product: product,
      ),
    );
  }
}
