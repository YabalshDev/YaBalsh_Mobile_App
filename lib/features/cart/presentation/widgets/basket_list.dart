import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:yabalash_mobile_app/core/depedencies.dart';
import 'package:yabalash_mobile_app/features/cart/presentation/widgets/cart_item_card.dart';

import '../../../../core/theme/light/app_colors_light.dart';
import '../../../../core/widgets/empty_indicator.dart';
import '../blocs/cubit/cart_cubit.dart';

class BasketList extends StatelessWidget {
  const BasketList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        if (state.cartItems!.isEmpty) {
          return SizedBox(
            height: Get.height * 0.6,
            child: const Center(
              child: EmptyIndicator(title: 'دور و قارن بين أسعار المنتجات'),
            ),
          );
        } else {
          return Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'تفاصيل الطلب',
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge
                        ?.copyWith(fontWeight: FontWeight.w700),
                  ),
                  InkWell(
                    onTap: () => getIt<CartCubit>().clearCart(),
                    child: Text(
                      "ازالة الكل",
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: AppColorsLight.kAppPrimaryColorLight,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: ListView.builder(
                  key: UniqueKey(),
                  itemCount: state.cartItems!.length,
                  itemBuilder: (context, index) {
                    final cartItem = state.cartItems![index];
                    return CartItemCard(cartItem: cartItem);
                  },
                ),
              )
            ],
          );
        }
      },
    );
  }
}
