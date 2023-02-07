import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../../../core/constants/app_layouts.dart';
import '../../../../core/utils/enums/request_state.dart';
import '../blocs/cubit/search_cubit.dart';
import 'best_offer_section.dart';
import 'products_search_list.dart';
import 'search_error_indicator.dart';
import 'search_no_results.dart';
import 'search_products_loading.dart';

class ProductSearchResult extends StatelessWidget {
  const ProductSearchResult({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      buildWhen: (previous, current) =>
          previous.searchProductsRequestState !=
          current.searchProductsRequestState,
      builder: (context, state) {
        switch (state.searchProductsRequestState) {
          case RequestState.idle:
            return const SizedBox();
          case RequestState.loading:
            return const SliverToBoxAdapter(child: SearchProductsLoading());
          case RequestState.loaded:
            return state.searchProductsResult!.isEmpty
                ? SliverToBoxAdapter(
                    child: SizedBox(
                        height: Get.height * 0.6,
                        child: const SearchEmptyResult()),
                  )
                : const SliverToBoxAdapter(child: SearchProductResultsLoaded());
          case RequestState.error:
            return SliverToBoxAdapter(
              child: SizedBox(
                  height: Get.height * 0.6,
                  child: const SearchErrorIndicator()),
            );

          default:
            return const SizedBox();
        }
      },
    );
  }
}

class SearchProductResultsLoaded extends StatelessWidget {
  const SearchProductResultsLoaded({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        return Padding(
          padding: kDefaultPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              state.chepeastProduct!.id != null
                  ? const BestOfferSection()
                  : const SizedBox(),
              const ProductsSearchList()
            ],
          ),
        );
      },
    );
  }
}
