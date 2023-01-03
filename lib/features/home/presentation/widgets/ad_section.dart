import 'package:flutter/material.dart';

import '../../../../core/constants/app_layouts.dart';

class AdSection extends StatelessWidget {
  final String? adImagePath;
  const AdSection({super.key, this.adImagePath = ''});

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
