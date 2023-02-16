import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:yabalash_mobile_app/core/widgets/error_indicator.dart';
import 'package:yabalash_mobile_app/core/widgets/yaBalash_toast.dart';

import '../../../../core/utils/enums/request_state.dart';
import '../blocs/cubit/product_details_cubit.dart';
import 'product_details_loaded.dart';
import 'product_details_loading.dart';

class ProductDetailsSection extends StatelessWidget {
  const ProductDetailsSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductDetailsCubit, ProductDetailsState>(
      listener: (context, state) {
        if (state.productRequestState == RequestState.error) {
          yaBalashCustomToast(
              message: 'فشل في جلب بيانات المنتج ... حاول مرة اخرى',
              context: context);
        }
      },
      buildWhen: (previous, current) =>
          previous.productRequestState != current.productRequestState,
      builder: (context, state) {
        switch (state.productRequestState) {
          case RequestState.idle:
            return const SizedBox();
          case RequestState.loading:
            return const ProductDetailsLoading();

          case RequestState.loaded:
            return ProductDetailsLoaded(product: state.product!);
          case RequestState.error:
            return SizedBox(
              height: Get.height * 0.6,
              child: const Center(
                child: ErrorIndicator(errorMessage: 'مشكلة في جلب المنتج '),
              ),
            );

          default:
            return const SizedBox();
        }
      },
    );
  }
}
