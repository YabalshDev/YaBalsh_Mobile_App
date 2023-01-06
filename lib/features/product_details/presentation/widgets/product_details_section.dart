import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../../../core/utils/enums/request_state.dart';
import '../../../../core/widgets/empty_indicator.dart';
import '../../../home/domain/entities/product.dart';
import '../blocs/cubit/product_details_cubit.dart';
import 'product_details_loaded.dart';
import 'product_details_loading.dart';

class ProductDetailsSection extends StatelessWidget {
  const ProductDetailsSection({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductDetailsCubit, ProductDetailsState>(
      buildWhen: (previous, current) =>
          previous.productRequestState != current.productRequestState,
      builder: (context, state) {
        switch (state.productRequestState) {
          case RequestState.idle:
            return const SizedBox();
          case RequestState.loading:
            return const ProductDetailsLoading();

          case RequestState.loaded:
            return ProductDetailsLoaded(product: product);
          case RequestState.error:
            return SizedBox(
              height: Get.height * 0.6,
              child: const Center(
                child: EmptyIndicator(title: 'مشكلة في جلب المنتج '),
              ),
            );

          default:
            return const SizedBox();
        }
      },
    );
  }
}
