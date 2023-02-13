import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:yabalash_mobile_app/core/widgets/yaBalash_toast.dart';

import '../../../../core/utils/enums/request_state.dart';
import '../blocs/cubit/super_markets_cubit.dart';
import 'supermarkets_loaded.dart';

class SuperMarketLists extends StatelessWidget {
  const SuperMarketLists({super.key});

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
            return SizedBox(
              height: Get.height * 0.6,
              child: const Center(child: CircularProgressIndicator()),
            );

          case RequestState.loaded:
            return const SuperMarketsLoaded();
          case RequestState.error:
            return SizedBox(
              height: Get.height * 0.6,
              child: const Center(
                child: Text('خطا'),
              ),
            );
          default:
            return const SizedBox();
        }
      },
    );
  }
}
