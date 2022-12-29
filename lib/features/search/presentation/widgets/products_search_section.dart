import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductsSearchSection extends StatelessWidget {
  const ProductsSearchSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        height: Get.height * 0.6,
        child: const Center(
          child: Text('المنتجات'),
        ),
      ),
    );
  }
}
