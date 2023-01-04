import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:yabalash_mobile_app/features/search/presentation/widgets/search_history_card.dart';

import '../../../../core/constants/app_layouts.dart';
import '../../../../core/theme/light/light_theme.dart';
import '../../../../core/utils/enums/request_state.dart';
import '../../../../core/widgets/sub_heading.dart';
import '../blocs/cubit/search_cubit.dart';

class SearchHistorySection extends StatelessWidget {
  const SearchHistorySection({super.key});

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
              return SearchHistoryLoaded(
                state: state,
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
  final SearchState state;
  const SearchHistoryLoaded({
    Key? key,
    required this.state,
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
          Wrap(
              runSpacing: 10.h,
              spacing: 10.w,
              direction: Axis.horizontal,
              key: UniqueKey(),
              children: state.searchHistory!
                  .map((name) => SearchHistoryCard(searchName: name))
                  .toList())
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
