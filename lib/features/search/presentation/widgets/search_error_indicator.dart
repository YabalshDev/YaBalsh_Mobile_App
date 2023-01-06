import 'package:flutter/material.dart';

import '../../../../core/widgets/empty_indicator.dart';

class SearchErrorIndicator extends StatelessWidget {
  const SearchErrorIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: EmptyIndicator(title: 'خطا اثناء البحث حاول مرة اخرى'),
    );
  }
}
