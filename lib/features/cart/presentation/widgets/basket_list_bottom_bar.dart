import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:yabalash_mobile_app/core/services/user_service.dart';
import 'package:yabalash_mobile_app/core/widgets/show_not_logged_in_button.dart';

import '../../../../core/constants/app_layouts.dart';
import '../../../../core/depedencies.dart';
import '../../../../core/services/app_settings_service.dart';
import '../../../../core/theme/light/app_colors_light.dart';
import '../../../../core/theme/light/light_theme.dart';
import '../../../../core/widgets/custom_bottom_nav_bar.dart';
import '../blocs/cubit/cart_cubit.dart';
import 'shopping_list_bottom_modal.dart';

class BascketListBottomBar extends StatelessWidget {
  final GlobalKey<FormBuilderState> formKey;
  const BascketListBottomBar({
    Key? key,
    required this.pageController,
    required this.formKey,
  }) : super(key: key);

  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: getIt<AppSettingsService>().appConfig.appVersion ==
              '2.0.0' // complete version more height for the 2 buttons
          ? 170.h
          : 95.h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
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
                if (getIt<AppSettingsService>().appConfig.appVersion !=
                        '2.0.0' &&
                    getIt<UserService>().token.isEmpty) {
                  // if not complete version (comparison version ) and not logged in
                  showNotLoggedInDialog();
                } else {
                  showModalBottomSheet(
                      context: context,
                      shape: RoundedRectangleBorder(
                          borderRadius: kSecondaryBorderRaduis),
                      builder: (context) => ShoppingListBottomModal(
                            formKey: formKey,
                            onTap: () {
                              final shoppingListName =
                                  formKey.currentState!.fields['name']!.value;
                              getIt<CartCubit>().addShoppingList(
                                  shoppingListName: shoppingListName);
                            },
                          ));
                }
              },
              child: Container(
                width: Get.width,
                height: 51.h,
                padding: kDefaultPadding,
                decoration: kDefaultBoxDecoration.copyWith(
                    border: Border.all(
                        color: AppColorsLight.kAppPrimaryColorLight, width: 2)),
                child: Center(
                  child: Text(
                    'حفظ كقائمة تسوق',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: AppColorsLight.kAppPrimaryColorLight,
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w700),
                  ),
                ),
              ),
            ),
          ),
          getIt<AppSettingsService>().appConfig.appVersion ==
                  '2.0.0' // show button when its complete version
              ? CustomNavBar(
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
              : const SizedBox()
        ],
      ),
    );
  }
}
