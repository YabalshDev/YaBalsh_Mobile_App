import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:yabalash_mobile_app/features/auth/presentation/widgets/auth_back_icon.dart';
import 'package:yabalash_mobile_app/features/zones/presentation/widgets/sub_zone_list.dart';

import '../../../../core/constants/app_layouts.dart';
import '../../../../core/theme/light/app_colors_light.dart';
import '../../../../core/utils/enums/request_state.dart';
import '../blocs/cubit/sub_zone_cubit.dart';

class SubZonesBody extends StatelessWidget {
  final String? mainZone;
  const SubZonesBody({super.key, this.mainZone});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: kDefaultPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AuthBackIcon(),
            mediumVerticalSpace,
            Text(
              'اختار منطقة',
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium
                  ?.copyWith(color: AppColorsLight.kAppPrimaryColorLight),
            ),
            largeVerticalSpace,
            RichText(
              text: TextSpan(children: [
                TextSpan(
                    text: 'اختار من ',
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        color: Colors.black,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w600)),
                TextSpan(
                    text: mainZone,
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        fontSize: 20.sp,
                        color: AppColorsLight.kAppPrimaryColorLight)),
              ]),
            ),
            smallVerticalSpace,
            const SubZoneList()
          ],
        ),
      ),
    );
  }
}
