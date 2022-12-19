import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yabalash_mobile_app/core/constants/app_layouts.dart';
import 'package:yabalash_mobile_app/features/cart/presentation/widgets/basket_list.dart';
import 'package:yabalash_mobile_app/features/cart/presentation/widgets/cart_stepper.dart';
import 'package:yabalash_mobile_app/features/cart/presentation/widgets/supermarkets_list.dart';

import '../../../../core/widgets/custom_header.dart';
import '../../../../core/widgets/empty_indicator.dart';
import '../blocs/cubit/cart_cubit.dart';

final List<Widget> cartSteps = [const BasketList(), const SuperMarketLists()];

class CartBody extends StatelessWidget {
  final PageController pageController;
  const CartBody({super.key, required this.pageController});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BlocBuilder<CartCubit, CartState>(
          builder: (context, state) {
            return const CustomHeader(
              isWithNotification: false,
              title: 'السلة',
            );
          },
        ),
        smallVerticalSpace,
        BlocBuilder<CartCubit, CartState>(
          builder: (context, state) {
            if (state.cartItems!.isEmpty) {
              return const Expanded(
                child: Center(
                  child: EmptyIndicator(title: 'دور و قارن بين أسعار المنتجات'),
                ),
              );
            } else {
              return Expanded(
                child: Column(
                  children: [
                    const CartStepper(),
                    Expanded(
                        child: Padding(
                      padding: kDefaultPadding,
                      child: PageView.builder(
                        controller: pageController,
                        itemCount: cartSteps.length,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) => cartSteps[index],
                      ),
                    ))
                  ],
                ),
              );
            }
          },
        )
      ],
    ));
  }
}
