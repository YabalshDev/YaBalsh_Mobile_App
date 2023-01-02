import 'package:flutter/material.dart';

import '../widgets/search_body.dart';

class SearchView extends StatefulWidget {
  final String? intialValue;
  final bool fromCategory;
  const SearchView({super.key, this.intialValue, required this.fromCategory});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  late PageController pageController;
  @override
  void initState() {
    pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SearchBody(
          pageController: pageController,
          fromCategory: widget.fromCategory,
          intialValue: widget.intialValue),
    );
  }
}
