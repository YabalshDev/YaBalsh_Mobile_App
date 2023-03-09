import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yabalash_mobile_app/core/depedencies.dart';
import 'package:yabalash_mobile_app/core/services/app_settings_service.dart';

import '../../../../core/constants/app_layouts.dart';
import '../../../../core/utils/enums/request_state.dart';
import '../blocs/cubit/cubit/shopping_list_details_cubit.dart';
import 'shopping_list_details_bottom_loaded.dart';
import 'shopping_list_details_bottom_loading.dart';

class ShoppingListDetailsBottom extends StatelessWidget {
  const ShoppingListDetailsBottom({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: getIt<AppSettingsService>().appConfig.appVersion !=
              '2.0.0' // complete version should have less height because there is no button (compare all uspermarkets)
          ? 140.h
          : 110.h,
      padding: kDefaultPadding,
      child: BlocBuilder<ShoppingListDetailsCubit, ShoppingListDetailsState>(
        builder: (context, state) {
          switch (state.storesState) {
            case RequestState.idle:
              return const SizedBox();

            case RequestState.loading:
              return const ShoppingListDetailsBottomLoading();
            case RequestState.loaded:
              return const ShoppingListDetailsBottomLoaded();
            case RequestState.error:
              return const SizedBox();
            default:
              return const SizedBox();
          }
        },
      ),
    );
  }
}
