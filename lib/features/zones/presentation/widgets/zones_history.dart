import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yabalash_mobile_app/core/utils/handle_zone_history_selection.dart';
import 'package:yabalash_mobile_app/core/widgets/yaBalash_toast.dart';
import 'package:yabalash_mobile_app/features/zones/presentation/widgets/zone_history_card.dart';

import '../../../../core/constants/app_layouts.dart';
import '../../../../core/utils/enums/request_state.dart';
import '../blocs/cubit/main_zones_cubit.dart';

class ZonesHistory extends StatelessWidget {
  const ZonesHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainZonesCubit, MainZonesState>(
      listener: (context, state) {
        if (state.zonesHistoryState == RequestState.error) {
          yaBalashCustomToast(
              message: state.zonesHistoryErrorMessage!, context: context);
        }
      },
      builder: (context, state) {
        switch (state.zonesHistoryState) {
          case RequestState.idle:
            return const SizedBox();
          case RequestState.loading:
            return const SizedBox();
          case RequestState.loaded:
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'آخر المناطق الي اخترتها',
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(fontSize: 13.sp, color: Colors.grey),
                ),
                smallVerticalSpace,
                Divider(
                  color: Colors.grey.shade300,
                  thickness: 1,
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: state.zonesHistory!.length,
                  itemBuilder: (context, index) {
                    final subZone = state.zonesHistory![index];
                    return InkWell(
                      onTap: () => handleOnZoneHistorySelection(subZone),
                      child: ZoneHistoryCard(
                        subZone: subZone,
                      ),
                    );
                  },
                ),
              ],
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
