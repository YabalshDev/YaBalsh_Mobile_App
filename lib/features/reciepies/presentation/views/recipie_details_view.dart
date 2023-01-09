import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:yabalash_mobile_app/core/depedencies.dart';
import 'package:yabalash_mobile_app/core/widgets/custom_bottom_nav_bar.dart';
import 'package:yabalash_mobile_app/features/reciepies/domain/entities/recipie.dart';

import '../../../../core/widgets/custom_dialog.dart';
import '../../../cart/presentation/blocs/cubit/cart_cubit.dart';
import '../widgets/recipie_details_body.dart';

class RecipieDetailsView extends StatelessWidget {
  final Recipie recipie;
  const RecipieDetailsView({super.key, required this.recipie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RecipieDetailsBody(
        recipie: recipie,
      ),
      bottomNavigationBar: CustomNavBar(
          mainButtonTap: () => addRecpieItemsToCart(recipie),
          height: 60.h,
          isButtonSecondary: true,
          title: '+ اضف جميع المنتجات الى السلة '),
    );
  }
}

void addRecpieItemsToCart(Recipie recipie) {
  for (var element in recipie.products!) {
    getIt<CartCubit>().addItemToCart(element);
  }
  yaBalashCustomDialog(
    isWithEmoji: false,
    buttonTitle: 'حسنا',
    mainContent: 'تمت اضافة جميع المنتجات الى السلة',
    title: 'ملاحظة',
    onConfirm: () => Get.back(),
  );
}
