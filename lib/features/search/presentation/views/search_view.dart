import 'package:flutter/material.dart';

import '../widgets/search_body.dart';

final PageController _pageController = PageController();

class SearchView extends StatelessWidget {
  final String? intialValue;
  final bool fromCategory;
  const SearchView({super.key, this.intialValue, required this.fromCategory});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SearchBody(
          pageController: _pageController,
          fromCategory: fromCategory,
          intialValue: intialValue),
    );
  }
}
