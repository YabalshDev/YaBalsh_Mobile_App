import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:yabalash_mobile_app/core/constants/app_layouts.dart';
import 'package:yabalash_mobile_app/core/depedencies.dart';
import 'package:yabalash_mobile_app/core/routes/app_routes.dart';
import 'package:yabalash_mobile_app/core/theme/light/app_colors_light.dart';
import 'package:yabalash_mobile_app/core/theme/light/light_theme.dart';
import 'package:yabalash_mobile_app/core/widgets/custom_dialog.dart';
import 'package:yabalash_mobile_app/features/cart/presentation/widgets/shopping_list_bottom_modal.dart';
import 'package:yabalash_mobile_app/features/orders/data/models/order_product_model.dart';

import '../../../../core/services/user_service.dart';
import '../../../../core/widgets/custom_bottom_nav_bar.dart';
import '../../../orders/domain/entities/order_request.dart';
import '../blocs/cubit/cart_cubit.dart';
import '../blocs/cubit/order_summary_cubit.dart';

final formKey = GlobalKey<FormBuilderState>();

class CartCustomNavBar extends StatelessWidget {
  final PageController pageController;
  const CartCustomNavBar({super.key, required this.pageController});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        if (state.cartItems!.isEmpty) {
          return SizedBox(
            height: 150.h,
            child: Column(
              children: [
                CustomNavBar(
                  mainButtonTap: () {},
                  isButtonSecondary: false,
                  title: 'حفظ كقائمة تسوق',
                  isDisabled: true,
                ),
                const CustomNavBar(
                  isButtonSecondary: false,
                  title: 'اختار السوبر ماركت',
                  isDisabled: true,
                )
              ],
            ),
          );
        } else {
          if (state.cartStepIndex == 0) {
            return SizedBox(
              height: 170.h,
              child: Column(
                children: [
                  Text(
                    'ملاحظة: مرر من اليمين للحذف',
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall
                        ?.copyWith(fontSize: 9.sp, fontWeight: FontWeight.w600),
                  ),
                  Padding(
                    padding: kDefaultPadding,
                    child: InkWell(
                      onTap: () {
                        showModalBottomSheet(
                            context: context,
                            shape: RoundedRectangleBorder(
                                borderRadius: kSecondaryBorderRaduis),
                            builder: (context) => ShoppingListBottomModal(
                                  formKey: formKey,
                                  onTap: () {
                                    final shoppingListName = formKey
                                        .currentState!.fields['name']!.value;
                                    getIt<CartCubit>().addShoppingList(
                                        shoppingListName: shoppingListName);
                                  },
                                ));
                      },
                      child: Container(
                        width: Get.width,
                        padding: kDefaultPadding,
                        decoration: kDefaultBoxDecoration.copyWith(
                            border: Border.all(
                                color: AppColorsLight.kAppPrimaryColorLight,
                                width: 2)),
                        child: Center(
                          child: Text(
                            'حفظ كقائمة تسوق',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                    color: AppColorsLight.kAppPrimaryColorLight,
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.w700),
                          ),
                        ),
                      ),
                    ),
                  ),
                  CustomNavBar(
                    mainButtonTap: () {
                      pageController.animateToPage(1,
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeInOut);
                      getIt<CartCubit>().changeCurrentCartStep(1);
                    },
                    isButtonSecondary: false,
                    title: 'اختار السوبر ماركت',
                    isDisabled: false,
                  )
                ],
              ),
            );
          } else if (state.cartStepIndex == 1) {
            return CustomNavBar(
                isButtonSecondary: false,
                mainButtonTap: () {
                  // second step handle
                  if (state.supermarket?.store != null) {
                    if (getIt<UserService>().token.isEmpty) {
                      yaBalashCustomDialog(
                        isWithEmoji: false,
                        buttonTitle: 'تسجيل/مستخدم جديد',
                        mainContent:
                            'انت لست مسجلا سجل دخول لتتمكن من اتمام طلبك.',
                        title: 'ملاحظة',
                        onConfirm: () => Get.back(),
                      );
                    } else {
                      pageController.animateToPage(2,
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeInOut);
                      getIt<CartCubit>().changeCurrentCartStep(2);
                    }
                  }
                  // third step handle
                },
                title: 'خلص الطلب',
                isDisabled: state.supermarket?.store == null);
          } else {
            return CustomNavBar(
              isButtonSecondary: false,
              mainButtonTap: () async {
                final OrderRequest orderRequest = OrderRequest(
                    addressId: state.userAddress?.id,
                    storeId: state.supermarket?.store!.id,
                    products: state.cartItems!
                        .map((e) => OrderProductModel(
                            id: e.product!.id, quantity: e.quantity))
                        .toList());
                if (state.userAddress?.id != null) {
                  final order = await getIt<OrderSummaryCubit>()
                      .placeOrder(orderRequest: orderRequest);
                  if (order != null) {
                    Get.toNamed(RouteHelper.getOrderSuccessRoute(),
                        arguments: [order]);
                  }
                }
              },
              title: '✔  خلص الطلب',
              isDisabled: state.userAddress?.id == null,
            );
          }
        }
      },
    );
  }
}
