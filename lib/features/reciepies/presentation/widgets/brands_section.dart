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

class BrandsSection extends StatefulWidget {
  const BrandsSection({super.key});

  @override
  State<BrandsSection> createState() => _BrandsSectionState();
}

class _BrandsSectionState extends State<BrandsSection> {
  late ScrollController _brandsScrollController;

  @override
  void initState() {
    _brandsScrollController = ScrollController();
    _brandsScrollController.addListener(() {
      if (_brandsScrollController.position.maxScrollExtent ==
          _brandsScrollController.position.pixels) {
        BlocProvider.of<RecipiesCubit>(context).handlePagination('brands');
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _brandsScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RecipiesCubit, RecipiesState>(
      builder: (context, state) {
        switch (state.brandsRequestState) {
          case RequestState.loading:
            return const CreatorsLoading();

          case RequestState.idle:

          case RequestState.loaded:
            return CustomAnimatedWidget(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: kDefaultPadding,
                    child: const SubHeading(
                      text: 'وصفات من طهاة و ماركات',
                      isBold: false,
                    ),
                  ),
                  mediumVerticalSpace,
                  SizedBox(
                    height: 100.h,
                    child: Row(
                      children: [
                        Expanded(
                          child: ListView.builder(
                            controller: _brandsScrollController,
                            scrollDirection: Axis.horizontal,
                            padding: EdgeInsets.only(right: 15.w),
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
                        ),
                        smallHorizontalSpace,
                        state.brandsPaginationLoading!
                            ? const Center(
                                child: CircularProgressIndicator.adaptive(),
                              )
                            : const SizedBox()
                      ],
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
