import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yabalash_mobile_app/core/constants/app_assets.dart';
import 'package:yabalash_mobile_app/core/constants/app_layouts.dart';
import 'package:yabalash_mobile_app/core/services/app_settings_service.dart';
import 'package:yabalash_mobile_app/core/widgets/keyboard_dissmisable.dart';
import 'package:yabalash_mobile_app/features/addresses/domain/entities/address.dart';
import 'package:yabalash_mobile_app/features/cart/domain/entities/supermarket_card_model.dart';
import 'package:yabalash_mobile_app/features/cart/presentation/blocs/cubit/order_summary_cubit.dart';
import 'package:yabalash_mobile_app/features/cart/presentation/blocs/cubit/super_markets_cubit.dart';
import 'package:yabalash_mobile_app/features/cart/presentation/widgets/basket_list.dart';
import 'package:yabalash_mobile_app/features/cart/presentation/widgets/cart_stepper.dart';
import 'package:yabalash_mobile_app/features/cart/presentation/widgets/order_summary.dart';
import 'package:yabalash_mobile_app/features/cart/presentation/widgets/supermarkets_list.dart';

import '../../../../core/depedencies.dart';
import '../../../../core/widgets/custom_header.dart';
import '../blocs/cubit/cart_cubit.dart';

List<Widget> cartSteps = [
  const BasketList(),
  BlocProvider<SuperMarketsCubit>(
    create: (context) => getIt<SuperMarketsCubit>()..getSuperMarkets(),
    child: const SuperMarketLists(),
  ),
  BlocProvider<OrderSummaryCubit>(
    create: (context) => getIt<OrderSummaryCubit>()..getUserAddress(),
    child: const KeyboardDissmisable(child: OrderSummary()),
  )
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
            title: 'السلة',
            onIconTap: () {
              getIt<CartCubit>()
                  .changeCurrentCartStep(state.cartStepIndex! - 1);
              pageController.animateToPage(state.cartStepIndex! - 1,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeInOut);
              getIt<CartCubit>().changeSelectedUserAddress(const Address());
              getIt<CartCubit>()
                  .changeSupermarketSelected(const SuperMarketCardModel());
              FocusScope.of(context).requestFocus(FocusNode());
            },
            iconPath: state.cartStepIndex! > 0 ? AppAssets.backIcon : null,
          );
        },
      ),
      smallVerticalSpace,
      getIt<AppSettingsService>().appConfig.appVersion ==
              '2.0.0' // complete version show  cart stepper
          ? const CartStepper()
          : const SizedBox(),
      getIt<AppSettingsService>().appConfig.appVersion ==
              '2.0.0' // complete version use page view
          ? Expanded(
              child: Padding(
              padding: kDefaultPadding,
              child: PageView.builder(
                controller: pageController,
                itemCount: cartSteps.length,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) =>
                    cartSteps[getIt<CartCubit>().state.cartStepIndex!],
              ),
            ))
          : Padding(
              padding: kDefaultPadding,
              child: const BasketList(),
            )
    ]));
  }
}
