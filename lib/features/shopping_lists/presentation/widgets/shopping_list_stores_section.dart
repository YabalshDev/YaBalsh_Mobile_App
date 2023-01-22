import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../core/constants/app_layouts.dart';
import '../../../../core/utils/enums/request_state.dart';
import '../../../../core/widgets/custom_divider.dart';
import '../../../../core/widgets/custom_network_image.dart';
import '../../../../core/widgets/item_details_card.dart';
import '../blocs/cubit/cubit/shopping_list_details_cubit.dart';

class ShoppingListStoresSection extends StatelessWidget {
  const ShoppingListStoresSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShoppingListDetailsCubit, ShoppingListDetailsState>(
      builder: (context, state) {
        switch (state.storesState) {
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
            return ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: state.stores!.length,
              itemBuilder: (context, index) {
                final store = state.stores![index];
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        AppImage(
                          path: store.storeImagePath!,
                          width: 82.w,
                          height: 23.h,
                        ),
                        const Spacer(),
                        Text(
                          '${store.totalPrice} جنيه',
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(
                                  fontSize: 19.sp, fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    smallVerticalSpace,
                    const CustomDivider(),
                    smallVerticalSpace,
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: store.items.length,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        final item = store.items[index];
                        return ItemDetailsCard(cartItem: item);
                      },
                    ),
                    mediumVerticalSpace
                  ],
                );
              },
            );
          case RequestState.error:
            return const SizedBox();

          default:
            return const SizedBox();
        }
      },
    );
  }
}