import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:yabalash_mobile_app/core/constants/app_layouts.dart';
import 'package:yabalash_mobile_app/core/widgets/sub_heading.dart';
import 'package:yabalash_mobile_app/features/shopping_lists/domain/entities/shopping_list.dart';
import 'package:yabalash_mobile_app/features/shopping_lists/presentation/blocs/cubit/cubit/shopping_list_details_cubit.dart';
import 'package:yabalash_mobile_app/features/shopping_lists/presentation/widgets/shopping_list_details_body.dart';

import '../../../../core/theme/light/app_colors_light.dart';
import '../../../../core/utils/enums/request_state.dart';

class ShoppingListDetailsView extends StatelessWidget {
  final ShoppingList shoppingList;
  const ShoppingListDetailsView({super.key, required this.shoppingList});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ShoppingListDetailsBody(
        shoppingList: shoppingList,
      ),
      bottomNavigationBar: Container(
        height: 100.h,
        padding: kDefaultPadding,
        child: BlocBuilder<ShoppingListDetailsCubit, ShoppingListDetailsState>(
          builder: (context, state) {
            switch (state.storesState) {
              case RequestState.idle:
                return const SizedBox();

              case RequestState.loading:
                return Row(
                  children: [
                    const SubHeading(text: 'الاجمالي'),
                    Shimmer.fromColors(
                        baseColor: Colors.grey[800]!,
                        highlightColor: Colors.grey[850]!,
                        child: SizedBox(
                          height: 10.h,
                          width: 72.w,
                        )),
                    const Spacer(),
                    Shimmer.fromColors(
                        baseColor: Colors.grey[800]!,
                        highlightColor: Colors.grey[850]!,
                        child: SizedBox(
                          height: 18.h,
                          width: 88.w,
                        ))
                  ],
                );
              case RequestState.loaded:
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SubHeading(text: 'الاجمالي'),
                    smallHorizontalSpace,
                    Text(
                      '(وفرت ${state.saving} جنيه)',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Colors.green.shade400, fontSize: 12.sp),
                    ),
                    const Spacer(),
                    Text(state.subTotal!.toStringAsFixed(2),
                        style:
                            Theme.of(context).textTheme.headlineLarge?.copyWith(
                                  color: AppColorsLight.kAppPrimaryColorLight,
                                )),
                  ],
                );
              case RequestState.error:
                return const SizedBox();
              default:
                return const SizedBox();
            }
          },
        ),
      ),
    );
  }
}
