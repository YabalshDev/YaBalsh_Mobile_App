import 'package:get/get.dart';

import '../../features/cart/presentation/blocs/cubit/cart_cubit.dart';
import '../../features/reciepies/domain/entities/recipie.dart';
import '../depedencies.dart';
import '../widgets/custom_dialog.dart';

void addRecpieProductsToCart(Recipie recipie) {
  if (recipie.products!.isNotEmpty) {
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
}
