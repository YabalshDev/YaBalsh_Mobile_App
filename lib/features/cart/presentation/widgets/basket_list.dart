import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yabalash_mobile_app/features/cart/presentation/widgets/cart_item_card.dart';

import '../../../../core/theme/light/app_colors_light.dart';
import '../blocs/cubit/cart_cubit.dart';

class BasketList extends StatelessWidget {
  const BasketList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
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
                  onTap: () {},
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
      },
    );
  }
}
