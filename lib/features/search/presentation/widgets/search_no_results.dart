import 'package:flutter/material.dart';

import '../../../../core/utils/enums/empty_states.dart';
import '../../../../core/widgets/empty_indicator.dart';

class SearchEmptyResult extends StatelessWidget {
  const SearchEmptyResult({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: EmptyIndicator(
          emptyStateType: EmptyStates.other, title: 'لا يوجد نتائج بحث'),
    );
  }
}
