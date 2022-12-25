import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:yabalash_mobile_app/core/constants/app_layouts.dart';
import 'package:yabalash_mobile_app/core/theme/light/app_colors_light.dart';
import 'package:yabalash_mobile_app/core/theme/light/light_theme.dart';
import 'package:yabalash_mobile_app/core/widgets/custom_card.dart';
import 'package:yabalash_mobile_app/core/widgets/custom_header.dart';
import 'package:yabalash_mobile_app/features/shopping_lists/presentation/blocs/cubit/shopping_list_cubit.dart';

import '../../../../core/utils/enums/request_state.dart';
import '../../../../core/widgets/empty_indicator.dart';

class ShoppingListsView extends StatelessWidget {
  const ShoppingListsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: kDefaultPadding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomHeader(isWithNotification: false, title: 'قوائمي'),
                BlocBuilder<ShoppingListCubit, ShoppingListState>(
                  builder: (context, state) {
                    switch (state.shoppingListRequestState) {
                      case RequestState.idle:
                        return const SizedBox();

                      case RequestState.loading:
                        return SizedBox(
                          height: Get.height * 0.65,
                          child: const Center(
                            child: CircularProgressIndicator.adaptive(),
                          ),
                        );

                      case RequestState.loaded:
                        return state.shoppingLists!.isEmpty
                            ? const EmptyIndicator(title: 'لا يوجد طلبات سابقة')
                            : ListView.builder(
                                shrinkWrap: true,
                                padding: kDefaultPadding,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: state.shoppingLists!.length,
                                itemBuilder: (context, index) {
                                  final shoppingList =
                                      state.shoppingLists![index];
                                  return Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                              width: 65.h,
                                              height: 65.h,
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 3.w,
                                                  vertical: 5.h),
                                              decoration: kDefaultBoxDecoration
                                                  .copyWith(
                                                      border: Border.all(
                                                          color: Colors
                                                              .transparent),
                                                      color: AppColorsLight
                                                          .kDisabledButtonColor),
                                              child: Wrap(
                                                direction: Axis.horizontal,
                                                alignment: WrapAlignment.start,
                                                spacing: 3,
                                                children: shoppingList.products!
                                                    .map((cartItem) =>
                                                        CustomCard(
                                                          withBorder: false,
                                                          isAssetImage: true,
                                                          borderRadius: 8,
                                                          backgroundColor:
                                                              Colors.white,
                                                          width: 30.w,
                                                          height: 25.h,
                                                          imagePath: cartItem
                                                              .product!
                                                              .imagePath,
                                                        ))
                                                    .toList(),
                                              )),
                                          mediumHorizontalSpace,
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                shoppingList.name!,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyMedium
                                                    ?.copyWith(
                                                        fontSize: 15.sp,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color: AppColorsLight
                                                            .kAppPrimaryColorLight),
                                              ),
                                              mediumVerticalSpace,
                                              Text(
                                                '${shoppingList.products!.length} منتجات',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyMedium
                                                    ?.copyWith(
                                                        fontSize: 12.sp,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color: AppColorsLight
                                                            .kAppPrimaryColorLight
                                                            .withOpacity(0.6)),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                      const Spacer(),
                                      Icon(
                                        Icons.arrow_forward_ios,
                                        size: 15.h,
                                        color: AppColorsLight
                                            .kAppPrimaryColorLight
                                            .withOpacity(0.8),
                                      )
                                    ],
                                  );
                                },
                              );
                      case RequestState.error:
                        return EmptyIndicator(title: state.errorMessage!);

                      default:
                        return const SizedBox();
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
