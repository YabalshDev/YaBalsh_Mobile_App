import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:yabalash_mobile_app/core/widgets/custom_animated_widget.dart';
import 'package:yabalash_mobile_app/features/reciepies/presentation/blocs/cubit/recipies_cubit.dart';

import '../../../../core/constants/app_layouts.dart';
import '../../../../core/routes/app_routes.dart';
import '../../../../core/utils/enums/request_state.dart';
import '../../../../core/widgets/sub_heading.dart';
import 'brand_card.dart';
import 'brands_loading.dart';

class CreatorsSection extends StatelessWidget {
  const CreatorsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RecipiesCubit, RecipiesState>(
      builder: (context, state) {
        switch (state.brandsRequestState) {
          case RequestState.idle:
            return const SizedBox();

          case RequestState.loading:
            return const CreatorsLoading();

          case RequestState.loaded:
            return CustomAnimatedWidget(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SubHeading(
                    text: 'وصفات من طهاة و ماركات',
                    isBold: false,
                  ),
                  mediumVerticalSpace,
                  SizedBox(
                    height: 100.h,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: state.brands!.length,
                      itemBuilder: (context, index) {
                        final brand = state.brands![index];
                        return InkWell(
                          onTap: () => Get.toNamed(
                              RouteHelper.getBrandDetailsRoute(),
                              arguments: brand),
                          child: BrandCard(brand: brand),
                        );
                      },
                    ),
                  )
                ],
              ),
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
