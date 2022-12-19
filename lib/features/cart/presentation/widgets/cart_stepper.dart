import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yabalash_mobile_app/core/theme/light/app_colors_light.dart';

import '../blocs/cubit/cart_cubit.dart';

class CartStepper extends StatelessWidget {
  const CartStepper({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        return SizedBox(
            height: 40.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 25.h,
                  height: 25.h,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: state.cartStepIndex! >= 0
                          ? AppColorsLight.kAppPrimaryColorLight
                          : AppColorsLight.kDisabledButtonTextColor),
                  child: Center(
                    child: Text(
                      '1',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontSize: 13.sp,
                          color: state.cartStepIndex! >= 0
                              ? Colors.white
                              : Colors.black),
                    ),
                  ),
                ),
                Container(
                  width: 20.w,
                  height: 5.h,
                  color: state.cartStepIndex! >= 1
                      ? AppColorsLight.kAppPrimaryColorLight
                      : AppColorsLight.kDisabledButtonColor,
                ),
                Container(
                  width: 25.h,
                  height: 25.h,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: state.cartStepIndex! >= 1
                          ? AppColorsLight.kAppPrimaryColorLight
                          : AppColorsLight.kDisabledButtonColor),
                  child: Center(
                    child: Text(
                      '2',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontSize: 13.sp,
                          color: state.cartStepIndex! >= 1
                              ? Colors.white
                              : Colors.black),
                    ),
                  ),
                ),
                Container(
                  width: 20.w,
                  height: 5.h,
                  color: state.cartStepIndex! >= 2
                      ? AppColorsLight.kAppPrimaryColorLight
                      : AppColorsLight.kDisabledButtonColor,
                ),
                Container(
                  width: 25.h,
                  height: 25.h,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: state.cartStepIndex! >= 2
                          ? AppColorsLight.kAppPrimaryColorLight
                          : AppColorsLight.kDisabledButtonColor),
                  child: Center(
                    child: Text(
                      '3',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontSize: 13.sp,
                          color: state.cartStepIndex! >= 2
                              ? Colors.white
                              : Colors.black),
                    ),
                  ),
                ),
              ],
            ));
      },
    );
  }
}
