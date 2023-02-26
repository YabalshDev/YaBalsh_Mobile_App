import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yabalash_mobile_app/features/settings/presentation/cubits/cubit/settings_cubit_cubit.dart';

import '../../../../core/constants/app_layouts.dart';
import '../../../../core/widgets/custom_svg_icon.dart';
import '../../../../core/widgets/custom_switch.dart';

class IsNearYouSettingCard extends StatelessWidget {
  final void Function(bool) onSwitchTap;
  final String title;
  final String iconPath;

  const IsNearYouSettingCard({
    super.key,
    required this.onSwitchTap,
    required this.title,
    required this.iconPath,
  });

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      preferBelow: false,
      waitDuration: const Duration(seconds: 5),
      message:
          'تفعيل هذه الخاصية يتيح لك التحكم في عرض السوبرماركتس للمنتج القريبة منك او لا ',
      textStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
            color: Colors.white,
          ),
      margin: EdgeInsets.symmetric(horizontal: 15.w),
      child: SizedBox(
        height: 56.h,
        child: ListTile(
            contentPadding: EdgeInsets.only(right: 15.w),
            trailing: BlocBuilder<SettingsCubit, SettingsState>(
              builder: (context, state) {
                if (state is IsNearStoresState) {
                  return Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'مفعلة',
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w700,
                                  color: state.isNearStores
                                      ? Colors.green.shade400
                                      : Colors.grey.shade300),
                        ),
                        CustomSwitch(
                          activeIndicator: state.isNearStores,
                          onSwitchTap: onSwitchTap,
                        )
                      ]);
                } else {
                  return const SizedBox();
                }
              },
            ),
            title: Row(
              children: [
                CustomSvgIcon(
                  iconPath: iconPath,
                  width: 20.w,
                  height: 20.h,
                  boxFit: BoxFit.fill,
                  color: Colors.black,
                ),
                mediumHorizontalSpace,
                Text(title,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                        )),
              ],
            )),
      ),
    );
  }
}
