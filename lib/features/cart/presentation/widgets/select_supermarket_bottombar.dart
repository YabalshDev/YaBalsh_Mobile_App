import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:yabalash_mobile_app/core/theme/light/app_colors_light.dart';

import '../../../../core/constants/app_layouts.dart';
import '../../../../core/depedencies.dart';
import '../../../../core/routes/app_routes.dart';
import '../../../../core/services/user_service.dart';
import '../../../../core/widgets/custom_bottom_nav_bar.dart';
import '../../../../core/widgets/custom_dialog.dart';
import '../blocs/cubit/cart_cubit.dart';

class SelectSupermarketBottom extends StatelessWidget {
  const SelectSupermarketBottom({
    Key? key,
    required this.pageController,
    required this.state,
  }) : super(key: key);

  final PageController pageController;
  final CartState state;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomNavBar(
            isButtonSecondary: false,
            mainButtonTap: () {
              // second step handle
              if (state.supermarket?.store != null) {
                if (getIt<UserService>().token.isEmpty) {
                  yaBalashCustomDialog(
                    isWithEmoji: false,
                    buttonTitle: 'تسجيل/مستخدم جديد',
                    mainContent: 'انت لست مسجلا سجل دخول لتتمكن من اتمام طلبك.',
                    title: 'ملاحظة',
                    onConfirm: () => Get
                      ..back()
                      ..offNamed(RouteHelper.getPhoneNumberRoute(),
                          arguments: RouteHelper.getCartRoute()),
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
            isDisabled: state.supermarket?.store == null),
        state.supermarket!.store != null
            ? Positioned(
                right: 35.w,
                top: 20.h,
                child: Container(
                  padding: kSecondaryPadding,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColorsLight.kLightPurpleColor),
                  child: Text(
                    '${state.cartItems!.length}',
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall
                        ?.copyWith(color: Colors.white, fontSize: 13.sp),
                  ),
                ),
              )
            : const Positioned(child: SizedBox()),
        state.supermarket!.store != null
            ? Positioned(
                right: Get.width * 0.7,
                top: 51.h / 2.4,
                child: Text(
                  '${state.supermarket!.price!.toStringAsFixed(0)} جنيه',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Colors.white, fontWeight: FontWeight.w700),
                ),
              )
            : const Positioned(
                child: SizedBox(),
              )
      ],
    );
  }
}
