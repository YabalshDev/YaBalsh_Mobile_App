import 'package:flutter/material.dart';
import 'package:yabalash_mobile_app/features/cart/presentation/widgets/cart_body.dart';
import 'package:yabalash_mobile_app/features/cart/presentation/widgets/cart_custom_bottom_bar.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: CartBody(), bottomNavigationBar: CartCustomNavBar());
  }
}
