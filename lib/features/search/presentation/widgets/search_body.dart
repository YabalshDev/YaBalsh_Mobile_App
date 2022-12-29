import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yabalash_mobile_app/core/constants/app_layouts.dart';
import 'package:yabalash_mobile_app/features/search/presentation/blocs/cubit/search_cubit.dart';
import 'package:yabalash_mobile_app/features/search/presentation/widgets/products_search_section.dart';
import 'package:yabalash_mobile_app/features/search/presentation/widgets/search_header.dart';
import 'package:yabalash_mobile_app/features/search/presentation/widgets/super_markets_search_section.dart';

import 'search_history_section.dart';
import 'search_type_section.dart';

class SearchBody extends StatelessWidget {
  final PageController pageController;
  final String? intialValue;
  final bool fromCategory;
  const SearchBody(
      {super.key,
      required this.pageController,
      this.intialValue,
      required this.fromCategory});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: kDefaultPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SearchHeader(intialValue: intialValue!),
            mediumVerticalSpace,
            SearchTypeSection(pageController: pageController),
            mediumVerticalSpace,
            const SearchHistorySection(),
            mediumVerticalSpace,
            Expanded(
              child: PageView.builder(
                controller: pageController,
                itemCount: searchPages.length,
                onPageChanged: (value) => BlocProvider.of<SearchCubit>(context)
                    .changeSearchType(value),
                itemBuilder: (context, index) => searchPages[index],
              ),
            )
          ],
        ),
      ),
    );
  }
}

final List<Widget> searchPages = [
  const ProductsSearchSection(),
  const SuperMarketsSearchSection()
];
