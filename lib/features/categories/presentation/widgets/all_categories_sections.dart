import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:yabalash_mobile_app/core/widgets/custom_animated_widget.dart';
import 'package:yabalash_mobile_app/core/widgets/error_indicator.dart';
import 'package:yabalash_mobile_app/core/widgets/yaBalash_toast.dart';

import '../../../../core/utils/enums/request_state.dart';
import '../../../../core/widgets/custom_shimmer.dart';
import '../blocs/categories_cubit.dart';
import 'sub_category_section.dart';

class AllCategoriesSections extends StatelessWidget {
  const AllCategoriesSections({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CategoriesCubit, CategoriesState>(
      listener: (context, state) {
        if (state.categorySectionsRequestState == RequestState.error) {
          yaBalashCustomToast(
              message: state.categoriesError!, context: context);
        }
      },
      builder: (context, state) {
        switch (state.categorySectionsRequestState) {
          case RequestState.idle:
            return const SizedBox();
          case RequestState.loading:
            return ListView.builder(
              itemCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Wrap(
                    direction: Axis.horizontal,
                    runSpacing: 10.h,
                    spacing: 20.w,
                    children: List.generate(
                        5,
                        (index) => CustomShimmer(
                              height: 65.h,
                              width: 65.w,
                            )));
              },
            );
          case RequestState.loaded:
            return state.categorySections!.isEmpty
                ? const SizedBox()
                : CustomAnimatedWidget(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: state.categorySections!
                          .map((categoryData) =>
                              SubCategorySection(categorySection: categoryData))
                          .toList(),
                    ),
                  );
          case RequestState.error:
            return SizedBox(
              height: Get.height * 0.6,
              child: Center(
                  child: ErrorIndicator(errorMessage: state.categoriesError!)),
            );
          default:
            return const SizedBox();
        }
      },
    );
  }
}
