import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/widgets/custom_bottom_nav_bar.dart';
import '../blocs/cubit/cart_cubit.dart';

class CartCustomNavBar extends StatelessWidget {
  const CartCustomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        if (state.cartItems!.isEmpty) {
          return SizedBox(
            height: 150.h,
            child: Column(
              children: const [
                CustomNavBar(
                  isButtonSecondary: false,
                  title: 'حفظ كقائمة تسوق',
                  isDisabled: true,
                ),
                CustomNavBar(
                  isButtonSecondary: false,
                  title: 'اختار السوبر ماركت',
                  isDisabled: true,
                )
              ],
            ),
          );
        } else {
          return CustomNavBar(
            isButtonSecondary: false,
            title: 'اختار السوبر ماركت',
            isDisabled: state.cartItems!.isEmpty ? true : false,
          );
        }
      },
    );
  }
}
