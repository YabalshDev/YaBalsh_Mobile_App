import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:yabalash_mobile_app/core/theme/light/app_colors_light.dart';

class DotsIndicatorsCards extends StatelessWidget {
  final int index;
  final int length;
  const DotsIndicatorsCards(
      {super.key, required this.index, required this.length});

  @override
  Widget build(BuildContext context) {
    return DotsIndicator(
      dotsCount: length,
      position: double.parse(index.toString()),
      decorator: DotsDecorator(
        activeColor: AppColorsLight.kAppPrimaryColorLight,
        color: AppColorsLight.kCircularProgressColor,
        size: const Size.square(9.0),
        activeSize: const Size(18.0, 9.0),
        activeShape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
      ),
    );
  }
}
