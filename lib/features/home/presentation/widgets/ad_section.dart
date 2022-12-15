import 'package:flutter/material.dart';

import '../../../../core/constants/app_layouts.dart';

class AddSection extends StatelessWidget {
  final String? adImagePath;
  const AddSection({super.key, this.adImagePath = ''});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: kDefaultBorderRaduis,
      child: Image.asset(
        adImagePath!,
      ),
    );
  }
}
