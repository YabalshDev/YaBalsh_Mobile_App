import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yabalash_mobile_app/core/constants/app_layouts.dart';
import 'package:yabalash_mobile_app/features/home/presentation/widgets/zone_bottom_modal.dart';

import '../../../../core/depedencies.dart';
import '../../../../core/services/zone_service.dart';
import '../../../../core/theme/light/app_colors_light.dart';
import '../../../zones/domain/entities/sub_zone.dart';
import '../blocs/cubit/home_cubit.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: kScaffoldPadding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "التوصيل الى",
                style: Theme.of(context).textTheme.bodySmall,
              ),
              smallVerticalSpace,
              InkWell(
                onTap: () async {
                  final subZones = await BlocProvider.of<HomeCubit>(context)
                      .getSubZoneHistory();
                  showModalBottomSheet(
                    context: context,
                    builder: (context) => ZonesBottomModal(zones: subZones),
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      getIt<ZoneService>().currentSubZone?.name ?? '',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: AppColorsLight.kAppPrimaryColorLight),
                    ),
                    const Icon(
                      Icons.keyboard_arrow_down,
                      color: AppColorsLight.kAppPrimaryColorLight,
                    )
                  ],
                ),
              )
            ],
          ),
          const Spacer()
        ],
      ),
    );
  }

  void showZonesBottomModal(BuildContext context, List<SubZone> subZones) {
    showModalBottomSheet(
      context: context,
      builder: (context) => ZonesBottomModal(zones: subZones),
    );
  }
}
