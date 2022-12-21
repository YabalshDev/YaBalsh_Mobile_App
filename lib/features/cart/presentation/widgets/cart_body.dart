import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yabalash_mobile_app/core/constants/app_assets.dart';
import 'package:yabalash_mobile_app/core/constants/app_layouts.dart';
import 'package:yabalash_mobile_app/features/cart/domain/entities/supermarket_card_model.dart';
import 'package:yabalash_mobile_app/features/cart/presentation/blocs/cubit/super_markets_cubit.dart';
import 'package:yabalash_mobile_app/features/cart/presentation/widgets/basket_list.dart';
import 'package:yabalash_mobile_app/features/cart/presentation/widgets/cart_stepper.dart';
import 'package:yabalash_mobile_app/features/cart/presentation/widgets/order_summary.dart';
import 'package:yabalash_mobile_app/features/cart/presentation/widgets/supermarkets_list.dart';

import '../../../../core/depedencies.dart';
import '../../../../core/widgets/custom_header.dart';
import '../blocs/cubit/cart_cubit.dart';

final List<Widget> cartSteps = [
  const BasketList(),
  BlocProvider<SuperMarketsCubit>(
    create: (context) {
      return getIt<SuperMarketsCubit>()..getSuperMarkets();
    },
    child: const SuperMarketLists(),
  ),
  const OrderSummary(superMarketCardModel: SuperMarketCardModel())
];

class CartBody extends StatelessWidget {
  final PageController pageController;
  const CartBody({super.key, required this.pageController});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      BlocBuilder<CartCubit, CartState>(
        builder: (context, state) {
          return CustomHeader(
            isWithNotification: true,
            title: 'السلة',
            onIconTap: () {
              getIt<CartCubit>()
                  .changeCurrentCartStep(state.cartStepIndex! - 1);
              pageController.animateToPage(state.cartStepIndex! - 1,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeInOut);
            },
            iconPath: state.cartStepIndex! > 0 ? AppAssets.backIcon : null,
          );
        },
      ),
      smallVerticalSpace,
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
    ]));
  }
}
