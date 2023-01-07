import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import '../widgets/search_body.dart';

final _searchFormKey = GlobalKey<FormBuilderState>();

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
          searchFormKey: _searchFormKey,
          pageController: pageController,
          fromCategory: widget.fromCategory,
          intialValue: widget.intialValue),
    );
  }
}
