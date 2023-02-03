import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:yabalash_mobile_app/core/constants/app_layouts.dart';
import 'package:yabalash_mobile_app/core/routes/app_routes.dart';
import 'package:yabalash_mobile_app/core/widgets/ya_balash_custom_button.dart';
import 'package:yabalash_mobile_app/features/store_details/presentation/blocs/cubit/store_details_cubit.dart';

import '../widgets/store_details_body.dart';

class StoreDetailsView extends StatelessWidget {
  const StoreDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: StoreDetailsBody(),
      bottomNavigationBar: StoreDetailsBottom(),
    );
  }
}

class StoreDetailsBottom extends StatelessWidget {
  const StoreDetailsBottom({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StoreDetailsCubit, StoreDetailsState>(
      builder: (context, state) {
        return Container(
          padding: kDefaultPadding,
          height: 60.h,
          child: YaBalashCustomButton(
              onTap: () {
                Get.toNamed(RouteHelper.getOtherBranches(),
                    arguments: state.store);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 23.h,
                  ),
                  smallHorizontalSpace,
                  const Text('فروع اخرى'),
                ],
              )),
        );
      },
    );
  }
}
