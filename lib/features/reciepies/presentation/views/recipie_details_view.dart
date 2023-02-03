import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yabalash_mobile_app/core/widgets/custom_bottom_nav_bar.dart';
import 'package:yabalash_mobile_app/features/reciepies/presentation/blocs/cubit/recipie_details_cubit.dart';

import '../../../../core/utils/add_recipie_products_to_cart.dart';
import '../widgets/recipie_details_body.dart';

class RecipieDetailsView extends StatelessWidget {
  const RecipieDetailsView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const RecipieDetailsBody(),
      bottomNavigationBar:
          BlocBuilder<RecipieDetailsCubit, RecipieDetailsState>(
        builder: (context, state) {
          return CustomNavBar(
              mainButtonTap: () => addRecpieProductsToCart(state.recipie!),
              height: 60.h,
              isButtonSecondary: true,
              isDisabled: state.recipie!.products != null
                  ? state.recipie!.products!.isEmpty
                  : state.recipie!.products == null,
              title: '+ اضف جميع المنتجات الى السلة ');
        },
      ),
    );
  }
}
