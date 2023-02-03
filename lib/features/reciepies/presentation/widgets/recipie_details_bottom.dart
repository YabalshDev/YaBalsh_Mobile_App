import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/add_recipie_products_to_cart.dart';
import '../../../../core/widgets/custom_bottom_nav_bar.dart';
import '../blocs/cubit/recipie_details_cubit.dart';

class RecipieDetailsBottom extends StatelessWidget {
  const RecipieDetailsBottom({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RecipieDetailsCubit, RecipieDetailsState>(
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.only(bottom: 5.h),
          child: CustomNavBar(
              mainButtonTap: () => addRecpieProductsToCart(state.recipie!),
              height: 65.h,
              isButtonSecondary: true,
              isDisabled: state.recipie!.products != null
                  ? state.recipie!.products!.isEmpty
                  : state.recipie!.products == null,
              title: '+ اضف جميع المنتجات الى السلة '),
        );
      },
    );
  }
}
