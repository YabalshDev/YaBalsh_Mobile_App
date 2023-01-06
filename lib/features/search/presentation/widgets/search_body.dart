import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:yabalash_mobile_app/core/constants/app_layouts.dart';
import 'package:yabalash_mobile_app/features/search/presentation/widgets/products_search_section.dart';
import 'package:yabalash_mobile_app/features/search/presentation/widgets/search_header.dart';
import 'package:yabalash_mobile_app/features/search/presentation/widgets/super_markets_search_section.dart';

import 'search_history_section.dart';
import 'search_type_section.dart';

final _searchFormKey = GlobalKey<FormBuilderState>();

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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SearchHeader(
              intialValue: intialValue!, searchFormKey: _searchFormKey),
          SearchTypeSection(
              pageController: pageController, searchFormKey: _searchFormKey),
          const SearchHistorySection(),
          smallVerticalSpace,
          Expanded(
            child: PageView.builder(
              physics: const NeverScrollableScrollPhysics(),
              controller: pageController,
              itemCount: searchPages.length,
              itemBuilder: (context, index) => searchPages[index],
            ),
          )
        ],
      ),
    );
  }
}

final List<Widget> searchPages = [
  const ProductsSearchSection(),
  const SuperMarketsSearchSection()
];
