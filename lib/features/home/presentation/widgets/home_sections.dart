import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:yabalash_mobile_app/core/constants/app_layouts.dart';
import 'package:yabalash_mobile_app/core/routes/app_routes.dart';
import 'package:yabalash_mobile_app/core/widgets/kew_word_products.dart';
import 'package:yabalash_mobile_app/features/home/presentation/blocs/cubit/home_cubit.dart';

import '../../../../core/utils/enums/request_state.dart';
import '../../domain/entities/product.dart';
import 'Title_row.dart';
import 'section_loading.dart';

class HomeSections extends StatelessWidget {
  // final Section section;

  const HomeSections({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) =>
          previous.homeSectionsRequestState != current.homeSectionsRequestState,
      builder: (context, state) {
        switch (state.homeSectionsRequestState) {
          case RequestState.loading:
            return Column(
                children: List.generate(3, (index) => const SectionLoading()));

          case RequestState.loaded:
            return Column(
              children: state.homeSections!
                  .map((homeSection) => SectionLoaded(
                      sectionName: homeSection.section!.keyWord!,
                      sectionProducts: homeSection.products!))
                  .toList(),
            );

          case RequestState.error:
            return const SizedBox();

          default:
            return const SizedBox.shrink();
        }
      },
    );
  }
}

class SectionLoaded extends StatelessWidget {
  const SectionLoaded({
    Key? key,
    required this.sectionName,
    required this.sectionProducts,
  }) : super(key: key);

  final String sectionName;
  final List<Product> sectionProducts;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        largeVerticalSpace,
        TitleRow(
          title: sectionName,
          onSelectAll: () => Get.toNamed(RouteHelper.getSearchRoute(),
              arguments: [false, sectionName]),
        ),
        mediumVerticalSpace,
        SizedBox(
            height: 290.h, child: KewordProducts(products: sectionProducts))
      ],
    );
  }
}
