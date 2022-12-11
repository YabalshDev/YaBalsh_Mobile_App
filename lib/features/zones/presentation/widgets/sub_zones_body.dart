import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

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
            const Icon(
              Icons.arrow_back_ios,
              color: AppColorsLight.kAppPrimaryColorLight,
            ),
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
            BlocBuilder<SubZoneCubit, SubZoneState>(
              builder: (context, state) {
                switch (state.subZonesState) {
                  case RequestState.idle:
                    return const SizedBox();
                  case RequestState.loading:
                    return SizedBox(
                      height: Get.size.height * 0.75,
                      child: const Center(child: CircularProgressIndicator()),
                    );

                  case RequestState.loaded:
                    return ListView.builder(
                      itemCount: state.subZones!.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        final subZone = state.subZones![index];
                        return Column(
                          children: [
                            SizedBox(
                              height: 45.h,
                              child: ListTile(
                                title: Text(subZone.name ?? '',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.copyWith(
                                            fontSize: 13.sp,
                                            fontWeight: FontWeight.w500)),
                              ),
                            ),
                            Divider(
                              color: Colors.grey.shade300,
                              thickness: 1,
                            )
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
            ),
            Expanded(
              child: Row(),
            ),
          ],
        ),
      ),
    );
  }
}
