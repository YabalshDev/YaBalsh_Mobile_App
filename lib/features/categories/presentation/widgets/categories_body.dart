import 'package:flutter/material.dart';
import 'package:yabalash_mobile_app/core/constants/app_layouts.dart';

import '../../../../core/widgets/custom_header.dart';

class CategoriesBody extends StatelessWidget {
  const CategoriesBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: kDefaultPadding,
      child: Column(
        children: const [
          CustomHeader(isWithNotification: true, title: "الاقسام")
        ],
      ),
    );
  }
}
