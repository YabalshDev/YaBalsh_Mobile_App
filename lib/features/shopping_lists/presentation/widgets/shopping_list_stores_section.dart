import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:yabalash_mobile_app/core/widgets/error_indicator.dart';

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
                        SizedBox(
                          width: 78.w,
                          height: 23.h,
                          child: AppImage(
                            path: store.storeImagePath!,
                            fit: BoxFit.cover,
                          ),
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
                    mediumVerticalSpace,
                    mediumVerticalSpace
                  ],
                );
              },
            );
          case RequestState.error:
            return SizedBox(
              height: Get.height * 0.55,
              child: Center(
                child: ErrorIndicator(errorMessage: state.errorMessage!),
              ),
            );

          default:
            return const SizedBox();
        }
      },
    );
  }
}
