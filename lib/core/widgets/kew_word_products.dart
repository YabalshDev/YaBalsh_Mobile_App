import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yabalash_mobile_app/core/depedencies.dart';
import 'package:yabalash_mobile_app/core/widgets/custom_shimmer.dart';
import 'package:yabalash_mobile_app/features/home/presentation/widgets/main_product_card.dart';

import '../../features/cart/presentation/blocs/cubit/cart_cubit.dart';
import '../../features/home/domain/entities/product.dart';
import '../constants/app_layouts.dart';

class KewordProducts extends StatelessWidget {
  final bool isWithPadding;
  final List<Product> products;
  const KewordProducts(
      {super.key, required this.products, required this.isWithPadding});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: getIt<CartCubit>(),
      child: SizedBox(
        height: 263.h,
        child: ListView.builder(
          padding: isWithPadding ? kScaffoldPadding : EdgeInsets.zero,
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          itemCount: products.length,
          itemBuilder: (context, index) {
            final product = products[index];
            return MainProductCard(
              product: product,
              fromSearch: false,
              fromProductDetails: true,
            );
          },
        ),
      ),
    );
  }
}

class SimillarProductsLoading extends StatelessWidget {
  const SimillarProductsLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250.h,
      child: ListView.builder(
        padding: kScaffoldPadding,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: 3,
        itemBuilder: (context, index) {
          return CustomShimmer(
            width: 133.w,
            height: 290.h,
          );
        },
      ),
    );
  }
}
