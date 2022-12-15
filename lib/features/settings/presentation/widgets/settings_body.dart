import 'package:flutter/material.dart';

import '../../../../core/constants/app_layouts.dart';
import '../../../../core/widgets/custom_header.dart';

class SettingsBody extends StatelessWidget {
  const SettingsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomHeader(isWithNotification: false, title: 'الاعدادات'),
            largeVerticalSpace
          ],
        ),
      ),
    );
  }
}
