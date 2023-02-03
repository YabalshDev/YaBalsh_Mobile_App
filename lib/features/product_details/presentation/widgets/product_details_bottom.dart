import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_layouts.dart';
import '../../../../core/depedencies.dart';
import '../../../../core/widgets/ya_balash_custom_button.dart';
import '../../../cart/presentation/blocs/cubit/cart_cubit.dart';
import '../../../home/domain/entities/product.dart';
import 'product_cart_quantity_row.dart';
import 'product_notification_ring.dart';

class ProductDetailsBottom extends StatelessWidget {
  const ProductDetailsBottom({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80.h,
      child: BlocProvider<CartCubit>.value(
        value: getIt<CartCubit>(),
        child: BlocBuilder<CartCubit, CartState>(
          builder: (context, state) {
            bool checkIfProductExist =
                getIt<CartCubit>().checkIfItemisInCart(product);

            if (checkIfProductExist) {
              return ProductCartQuantity(product: product);
            } else {
              return Container(
                padding: EdgeInsets.fromLTRB(21.w, 12.h, 15.w, 28.h),
                child: Row(children: [
                  const ProductNotificationRing(),
                  mediumHorizontalSpace,
                  Expanded(
                    child: YaBalashCustomButton(
                      isSecondaryButton: true,
                      onTap: () {
                        getIt<CartCubit>().addItemToCart(product);
                      },
                      child: const Text('+ اضف الى السلة'),
                    ),
                  ),
                ]),
              );
            }
          },
        ),
      ),
    );
  }
}
