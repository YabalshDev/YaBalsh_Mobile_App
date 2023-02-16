import 'package:flutter/material.dart';
import 'package:yabalash_mobile_app/core/widgets/error_indicator.dart';

class SearchErrorIndicator extends StatelessWidget {
  const SearchErrorIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: ErrorIndicator(errorMessage: 'خطا اثناء البحث حاول مرة اخرى'),
    );
  }
}
