import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../blocs/cubit/main_zones_cubit.dart';
import 'main_zone_card.dart';

class MainZonesLoaded extends StatelessWidget {
  final MainZonesState state;
  const MainZonesLoaded({
    Key? key,
    required this.state,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'او اختار منطقتك',
          style: Theme.of(context)
              .textTheme
              .bodyMedium
              ?.copyWith(fontSize: 13.sp, color: Colors.grey),
        ),
        Divider(
          color: Colors.grey.shade300,
          thickness: 1,
        ),
        ListView.builder(
          itemCount: state.mainZones!.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            final mainZone = state.mainZones![index];
            return MainZoneCard(
              mainZone: mainZone,
              length: state.mainZones!.length,
              index: index,
            );
          },
        )
      ],
    );
  }
}
