import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../../../core/depedencies.dart';
import '../../../../core/services/app_settings_service.dart';
import '../../../../core/utils/enums/request_state.dart';
import '../../../../core/widgets/error_indicator.dart';
import '../../../../core/widgets/yaBalash_toast.dart';
import '../blocs/cubit/super_markets_cubit.dart';
import 'supermarkets_loaded.dart';

class AllSupermarketsSection extends StatelessWidget {
  const AllSupermarketsSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SuperMarketsCubit, SuperMarketsState>(
      listener: (context, state) {
        if (state.storeRequestState == RequestState.error) {
          yaBalashCustomToast(
              message: 'فشل في جلب السوبرماركتس... حاول مرة اخرى',
              context: context);
        }
      },
      builder: (context, state) {
        switch (state.storeRequestState) {
          case RequestState.idle:
            return const SizedBox();
          case RequestState.loading:
            return getIt<AppSettingsService>().appVersion != '1.0.0'
                ? SizedBox(
                    height: Get.height * 0.6,
                    child: const Center(child: CircularProgressIndicator()),
                  )
                : const Expanded(
                    child: Center(child: CircularProgressIndicator()));

          case RequestState.loaded:
            return const SuperMarketsLoaded();
          case RequestState.error:
            return SizedBox(
              height: getIt<AppSettingsService>().appVersion == '1.0.0'
                  ? Get.height
                  : Get.height * 0.6,
              child: const Center(
                child:
                    ErrorIndicator(errorMessage: 'خطا اثناء جلب السوبر ماركتس'),
              ),
            );
          default:
            return const SizedBox();
        }
      },
    );
  }
}
