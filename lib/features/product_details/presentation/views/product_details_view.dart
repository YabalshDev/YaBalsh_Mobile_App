import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yabalash_mobile_app/core/constants/app_layouts.dart';
import 'package:yabalash_mobile_app/core/widgets/ya_balash_custom_button.dart';
import 'package:yabalash_mobile_app/features/cart/presentation/blocs/cubit/cart_cubit.dart';
import 'package:yabalash_mobile_app/features/product_details/presentation/widgets/product_cart_quantity_row.dart';

import '../../../../core/depedencies.dart';
import '../../../home/domain/entities/product.dart';
import '../widgets/product_details_body.dart';

class ProductDetailsView extends StatelessWidget {
  final Product product;
  const ProductDetailsView({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const ProductDetailsBody(),
      bottomNavigationBar: SizedBox(
        height: 100.h,
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
                  padding: kDefaultPadding,
                  child: Row(children: [
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
      ),
    );
  }
}
