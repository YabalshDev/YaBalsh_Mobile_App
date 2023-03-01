import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:yabalash_mobile_app/core/widgets/yaBalash_toast.dart';

import '../../../../core/utils/enums/request_state.dart';
import '../../domain/entities/main_zone.dart';
import '../blocs/cubit/sub_zone_cubit.dart';

class SubZoneList extends StatelessWidget {
  final MainZone mainZone;
  const SubZoneList({super.key, required this.mainZone});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SubZoneCubit, SubZoneState>(
      listener: (context, state) {
        if (state.subZonesState == RequestState.error) {
          yaBalashCustomToast(message: state.errorMessage!, context: context);
        }
      },
      buildWhen: (previous, current) =>
          previous.subZonesState != current.subZonesState,
      builder: (context, state) {
        switch (state.subZonesState) {
          case RequestState.idle:
            return const SizedBox();
          case RequestState.loading:
            return SizedBox(
              height: Get.size.height * 0.50,
              child: const Center(child: CircularProgressIndicator.adaptive()),
            );

          case RequestState.loaded:
            return ListView.builder(
              itemCount: state.subZones!.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                final subZone = state.subZones![index];
                return InkWell(
                  onTap: () {
                    final updatedSubZone = subZone.copyWith(
                        mainZoneName: mainZone.name, mainZoneId: mainZone.id);
                    BlocProvider.of<SubZoneCubit>(context)
                        .onSubZoneSelect(subZone: updatedSubZone);
                  },
                  child: Column(
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
                  ),
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
