import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yabalash_mobile_app/core/constants/app_layouts.dart';
import 'package:yabalash_mobile_app/core/widgets/kew_word_products.dart';
import 'package:yabalash_mobile_app/core/widgets/product_loading_shimmer.dart';
import 'package:yabalash_mobile_app/features/home/presentation/blocs/cubit/home_cubit.dart';

import '../../../../core/utils/enums/request_state.dart';
import '../../domain/entities/product.dart';
import 'Title_row.dart';

class HomeSections extends StatelessWidget {
  // final Section section;

  const HomeSections({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        switch (state.firstSectionRequestState) {
          case RequestState.loading:
            return const SectionLoading();

          case RequestState.loaded:
            return SectionLoaded(
                sectionName: state.firstSection!.keyWord!,
                sectionProducts: state.firstSection!.products!);

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
        TitleRow(title: sectionName),
        SizedBox(
          height: 10.h,
        ),
        SizedBox(
            height: 280.h, child: KewordProducts(products: sectionProducts))
      ],
    );
  }
}

class SectionLoading extends StatelessWidget {
  const SectionLoading({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 10.h),
        SizedBox(
          height: 200.h,
          child: ListView.builder(
            padding: kScaffoldPadding,
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: 3,
            itemBuilder: (context, index) {
              return const ProductLoadingShimmer();
            },
          ),
        ),
      ],
    );
  }
}
