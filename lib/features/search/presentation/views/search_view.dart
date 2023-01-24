import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:yabalash_mobile_app/core/utils/enums/search_navigation_screens.dart';
import 'package:yabalash_mobile_app/features/search/presentation/blocs/cubit/search_cubit.dart';

import '../widgets/search_body.dart';

class SearchView extends StatefulWidget {
  final String? intialValue;
  final SearchNavigationScreens searchNavigationScreens;
  const SearchView(
      {super.key, this.intialValue, required this.searchNavigationScreens});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  late PageController pageController;
  late GlobalKey<FormBuilderState> _searchFormKey;
  @override
  void initState() {
    final searchPageIndex =
        BlocProvider.of<SearchCubit>(context).state.searchTypeIndex;
    pageController = PageController(
        initialPage: searchPageIndex != 0 ? searchPageIndex! : 0);
    _searchFormKey = GlobalKey<FormBuilderState>();

    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    // _searchFormKey.currentState!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SearchBody(
          searchFormKey: _searchFormKey,
          pageController: pageController,
          searchNavigationScreens: widget.searchNavigationScreens,
          intialValue: widget.intialValue),
    );
  }
}
