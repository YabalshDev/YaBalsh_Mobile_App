import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/depedencies.dart';
import '../../../../core/services/app_settings_service.dart';
import '../../../../core/widgets/custom_bottom_nav_bar.dart';
import '../blocs/cubit/cart_cubit.dart';
import 'basket_list_bottom_bar.dart';
import 'confirm_order_bottom.dart';
import 'select_supermarket_bottombar.dart';

class CartCustomNavBar extends StatefulWidget {
  final PageController pageController;
  const CartCustomNavBar({super.key, required this.pageController});

  @override
  State<CartCustomNavBar> createState() => _CartCustomNavBarState();
}

class _CartCustomNavBarState extends State<CartCustomNavBar> {
  late GlobalKey<FormBuilderState> _formKey;

  @override
  void initState() {
    _formKey = GlobalKey<FormBuilderState>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        if (state.cartItems!.isEmpty) {
          return const EmptyCartBottomBar();
        } else {
          if (state.cartStepIndex == 0) {
            //first step cart bottom
            return BascketListBottomBar(
              pageController: widget.pageController,
              formKey: _formKey,
            );
          } else if (state.cartStepIndex == 1) {
            //second step cart bottom
            return SelectSupermarketBottom(
              pageController: widget.pageController,
              state: state,
            );
          } else {
            //third step cart bottom
            return ConfirmOrderBottom(
              state: state,
            );
          }
        }
      },
    );
  }
}

class EmptyCartBottomBar extends StatelessWidget {
  const EmptyCartBottomBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: getIt<AppSettingsService>().appConfig.appVersion != '1.0.0'
          ? 165.h
          : 90.h,
      child: Column(
        children: [
          CustomNavBar(
            mainButtonTap: () {},
            isButtonSecondary: false,
            title: 'حفظ كقائمة تسوق',
            isDisabled: true,
          ),
          getIt<AppSettingsService>().appConfig.appVersion != '1.0.0'
              ? const CustomNavBar(
                  isButtonSecondary: false,
                  title: 'اختار السوبر ماركت',
                  isDisabled: true,
                )
              : const SizedBox()
        ],
      ),
    );
  }
}
