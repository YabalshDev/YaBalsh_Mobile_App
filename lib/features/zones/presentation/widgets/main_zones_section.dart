import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:yabalash_mobile_app/core/widgets/error_indicator.dart';

import '../../../../core/utils/enums/request_state.dart';
import '../blocs/cubit/main_zones_cubit.dart';
import 'main_zones_loaded.dart';
import 'main_zones_loading.dart';

class MainZonesSection extends StatelessWidget {
  const MainZonesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainZonesCubit, MainZonesState>(
      builder: (context, state) {
        switch (state.mainZonesState) {
          case RequestState.idle:
            return const SizedBox();
          case RequestState.loading:
            return const MainZonesLoading();
          case RequestState.loaded:
            return MainZonesLoaded(
              state: state,
            );
          case RequestState.error:
            return SizedBox(
              height: Get.height * 0.6,
              child: Center(
                child:
                    ErrorIndicator(errorMessage: state.mainZonesErrorMessage!),
              ),
            );
          default:
            return const SizedBox();
        }
      },
    );
  }
}
