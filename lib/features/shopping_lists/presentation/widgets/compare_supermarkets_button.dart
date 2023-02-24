import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yabalash_mobile_app/core/depedencies.dart';
import 'package:yabalash_mobile_app/features/cart/presentation/blocs/cubit/cart_cubit.dart';
import 'package:yabalash_mobile_app/features/shopping_lists/domain/entities/shopping_list.dart';

import '../../../../core/routes/app_routes.dart';
import '../../../../core/widgets/ya_balash_custom_button.dart';

class CompareSupermarketsButton extends StatelessWidget {
  const CompareSupermarketsButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return YaBalashCustomButton(
      child: const Text('قارن كل السوبر ماركتس'),
      onTap: () {
        final shoppingListItems =
            (Get.routing.args[0] as ShoppingList).products;

        for (var element in shoppingListItems!) {
          getIt<CartCubit>().addItemToCart(element.product!);
        }

        Get.toNamed(RouteHelper.getSupermarketsRoute());
        getIt<CartCubit>().clearCart();
      },
    );
  }
}
