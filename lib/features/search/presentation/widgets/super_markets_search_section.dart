import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yabalash_mobile_app/core/constants/app_layouts.dart';
import 'package:yabalash_mobile_app/core/depedencies.dart';
import 'package:yabalash_mobile_app/core/utils/enums/request_state.dart';
import 'package:yabalash_mobile_app/core/widgets/near_stores_list.dart';
import 'package:yabalash_mobile_app/core/widgets/sub_heading.dart';
import 'package:yabalash_mobile_app/features/search/presentation/blocs/cubit/search_cubit.dart';
import 'package:yabalash_mobile_app/features/search/presentation/widgets/back_to_top_card.dart';

import '../../../../core/services/stores_service.dart';
import 'supermarkets_search_result.dart';

class SuperMarketsSearchSection extends StatefulWidget {
  const SuperMarketsSearchSection({super.key});

  @override
  State<SuperMarketsSearchSection> createState() =>
      _SuperMarketsSearchSectionState();
}

class _SuperMarketsSearchSectionState extends State<SuperMarketsSearchSection> {
  ScrollController? _scrollController;
  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController?.addListener(() {});
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SingleChildScrollView(
          controller: _scrollController,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BlocBuilder<SearchCubit, SearchState>(
                builder: (context, state) {
                  if (state.isSearchEmpty!) {
                    return getIt<StoreService>().uniqueStores.isEmpty
                        ? const SizedBox()
                        : Padding(
                            padding: kDefaultPadding,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SubHeading(
                                    text: 'السوبر ماركتس القريبة منك'),
                                mediumVerticalSpace,
                                NearStoresList(
                                    stores: getIt<StoreService>().uniqueStores,
                                    isWithPadding: false),
                              ],
                            ),
                          );
                  } else {
                    return SuperMarketsSearchResult(state: state);
                  }
                },
              )
            ],
          ),
        ),

        // back to top
        BlocBuilder<SearchCubit, SearchState>(
          builder: (context, state) {
            return state.searchStoresResult!.isNotEmpty &&
                    state.searchStoresRequestState == RequestState.loaded
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
