import 'package:flutter/material.dart';

import '../../../../core/utils/enums/empty_states.dart';
import '../../../../core/widgets/empty_indicator.dart';

class SearchEmptyResult extends StatelessWidget {
  final bool isProduct;
  const SearchEmptyResult({super.key, required this.isProduct});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: EmptyIndicator(
          emptyStateType: EmptyStates.other,
          title: isProduct
              ? 'للاسف المنتج دة مش موجود دلوقتي بس طلبك اتسجل وهنحاول نضيفه في اقرب وقت'
              : 'لا يوجد نتائج بحث'),
    );
  }
}
