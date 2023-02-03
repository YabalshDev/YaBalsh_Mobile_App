import 'package:flutter/material.dart';
import 'package:yabalash_mobile_app/core/depedencies.dart';
import 'package:yabalash_mobile_app/features/cart/presentation/widgets/cart_body.dart';
import 'package:yabalash_mobile_app/features/cart/presentation/widgets/cart_custom_bottom_bar.dart';

import '../blocs/cubit/cart_cubit.dart';

class CartView extends StatefulWidget {
  const CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  late PageController _pageController;

  @override
  void initState() {
    _pageController = PageController(
        initialPage: getIt<CartCubit>().state.cartStepIndex ?? 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CartBody(pageController: _pageController),
        bottomNavigationBar: CartCustomNavBar(
          pageController: _pageController,
        ));
  }
}
