import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yabalash_mobile_app/core/constants/app_assets.dart';

import '../../../../core/constants/app_layouts.dart';
import '../../../../core/routes/app_routes.dart';
import '../../../../core/widgets/custom_header.dart';
import 'addresses_list.dart';

class AddressesBody extends StatelessWidget {
  final String fromRoute;
  const AddressesBody({super.key, required this.fromRoute});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
          child: Column(
        children: [
          CustomHeader(
              title: 'عناويني',
              onIconTap: () => fromRoute == RouteHelper.getCartRoute()
                  ? Get.offAllNamed(RouteHelper.getMainNavigationRoute(),
                      arguments: 2) // close all and navigate to cart index
                  : Get.offAllNamed(RouteHelper.getMainNavigationRoute(),
                      arguments: 4), // close all and navigate to settings
              iconPath: AppAssets.closeIcon),
          largeVerticalSpace,
          AddressesList(fromRoute: fromRoute)
        ],
      )),
    );
  }
}
