import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:yabalash_mobile_app/features/search/presentation/widgets/search_history_card.dart';

import '../../../../core/constants/app_layouts.dart';
import '../../../../core/theme/light/light_theme.dart';
import '../../../../core/utils/enums/request_state.dart';
import '../../../../core/widgets/sub_heading.dart';
import '../blocs/cubit/search_cubit.dart';

class SearchHistorySection extends StatelessWidget {
  final GlobalKey<FormBuilderState> searchFormKey;
  const SearchHistorySection({super.key, required this.searchFormKey});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        if (state.isSearchEmpty!) {
          switch (state.searchHistoryRequestState) {
            case RequestState.idle:
              return const SizedBox();
            case RequestState.loading:
              return const SearchHistoryLoading();
            case RequestState.loaded:
              return state.searchHistory!.isEmpty
                  ? const SizedBox()
                  : SearchHistoryLoaded(
                      state: state,
                      searchFormKey: searchFormKey,
                    );
            case RequestState.error:
              return const SizedBox();
            default:
              return const SizedBox();
          }
        } else {
          return const SizedBox();
        }
      },
    );
  }
}

class SearchHistoryLoaded extends StatelessWidget {
  final GlobalKey<FormBuilderState> searchFormKey;
  final SearchState state;
  const SearchHistoryLoaded({
    Key? key,
    required this.state,
    required this.searchFormKey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: kDefaultPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SubHeading(text: 'ما بحثت عنه مؤخرا'),
          mediumVerticalSpace,
          SizedBox(
            height: 29.h,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: state.searchHistory!.length,
              itemBuilder: (context, index) {
                final searchHistory = state.searchHistory![index];

                return SearchHistoryCard(
                    searchName: searchHistory, searchFormKey: searchFormKey);
              },
            ),
          )
        ],
      ),
    );
  }
}

class SearchHistoryLoading extends StatelessWidget {
  const SearchHistoryLoading({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: kDefaultPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SubHeading(text: 'ما بحثت عنه مؤخرا'),
          mediumVerticalSpace,
          Row(
              children: List.generate(
                  3,
                  (index) => Shimmer.fromColors(
                      baseColor: Colors.grey.shade500,
                      highlightColor: Colors.grey.shade600,
                      child: Container(
                          width: 57.w,
                          height: 25.h,
                          margin: EdgeInsets.only(left: 10.w),
                          decoration: kDefaultBoxDecoration.copyWith(
                              borderRadius: kSecondaryBorderRaduis,
                              color: Colors.amber)))))
        ],
      ),
    );
  }
}
