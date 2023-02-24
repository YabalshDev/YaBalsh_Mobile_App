import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yabalash_mobile_app/features/shopping_lists/presentation/blocs/cubit/cubit/shopping_list_details_cubit.dart';

import '../../../../core/constants/app_layouts.dart';
import '../../../../core/depedencies.dart';
import '../../../../core/services/app_settings_service.dart';
import '../../../../core/theme/light/app_colors_light.dart';
import '../../../../core/widgets/sub_heading.dart';
import 'compare_supermarkets_button.dart';

class ShoppingListDetailsBottomLoaded extends StatelessWidget {
  const ShoppingListDetailsBottomLoaded({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShoppingListDetailsCubit, ShoppingListDetailsState>(
      builder: (context, state) {
        return Column(
          mainAxisAlignment: getIt<AppSettingsService>().appVersion == '1.0.0'
              ? MainAxisAlignment.start
              : MainAxisAlignment.center,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SubHeading(text: 'الاجمالي'),
                smallHorizontalSpace,
                Text(
                  '(وفرت ${state.saving} جنيه)',
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall
                      ?.copyWith(color: Colors.green.shade400, fontSize: 12.sp),
                ),
                const Spacer(),
                Text(state.subTotal!.toStringAsFixed(2),
                    style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                          color: AppColorsLight.kAppPrimaryColorLight,
                        )),
              ],
            ),
            getIt<AppSettingsService>().appVersion != '1.0.0'
                ? const SizedBox()
                : const Spacer(),
            getIt<AppSettingsService>().appVersion != '1.0.0'
                ? const SizedBox()
                : const CompareSupermarketsButton(),
            smallVerticalSpace
          ],
        );
      },
    );
  }
}
