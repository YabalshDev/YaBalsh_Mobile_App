import 'package:flutter/material.dart';
import 'package:yabalash_mobile_app/core/constants/app_layouts.dart';
import 'package:yabalash_mobile_app/core/theme/light/app_colors_light.dart';

class TitleRow extends StatelessWidget {
  final String title;
  final VoidCallback? onSelectAll;
  const TitleRow({super.key, required this.title, this.onSelectAll});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: kScaffoldPadding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          Text(
            "عرض الكل",
            style: Theme.of(context)
                .textTheme
                .bodyLarge
                ?.copyWith(color: AppColorsLight.kAppPrimaryColorLight),
          ),
        ],
      ),
    );
  }
}
