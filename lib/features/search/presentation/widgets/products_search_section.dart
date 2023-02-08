import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yabalash_mobile_app/features/search/presentation/blocs/cubit/search_cubit.dart';
import 'package:yabalash_mobile_app/features/search/presentation/widgets/back_to_top_card.dart';
import 'package:yabalash_mobile_app/features/search/presentation/widgets/most_selling_products_section.dart';

import '../../../../core/utils/enums/request_state.dart';
import 'product_search_result.dart';

class ProductsSearchSection extends StatefulWidget {
  const ProductsSearchSection({super.key});

  @override
  State<ProductsSearchSection> createState() => _ProductsSearchSectionState();
}

class _ProductsSearchSectionState extends State<ProductsSearchSection> {
  ScrollController? _scrollController;

  @override
  void initState() {
    _scrollController = ScrollController();

    _scrollController?.addListener(() {
      if (_scrollController!.position.maxScrollExtent ==
          _scrollController!.position.pixels) {
        BlocProvider.of<SearchCubit>(context).handlePagination();
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    _scrollController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomScrollView(
          controller: _scrollController,
          slivers: [
            BlocBuilder<SearchCubit, SearchState>(
              builder: (context, state) {
                if (state.isSearchEmpty!) {
                  return const SliverToBoxAdapter(
                      child: MostSellingProdutsSection());
                } else {
                  return const ProductSearchResult();
                }
              },
            )
          ],
        ),
        // back to top
        BlocBuilder<SearchCubit, SearchState>(
          builder: (context, state) {
            return state.searchProductsResult!.isNotEmpty &&
                    state.searchProductsRequestState == RequestState.loaded
                ? Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: BackToTopCard(
                            scrollController: _scrollController!)),
                  )
                : const Positioned(
                    child: SizedBox(),
                  );
          },
        )
      ],
    );
  }
}
