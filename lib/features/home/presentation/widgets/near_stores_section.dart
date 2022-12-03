import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yabalash_mobile_app/core/constants/constantdata/stores_mock_list.dart';
import 'package:yabalash_mobile_app/core/widgets/custom_card.dart';

import '../../../../core/constants/app_layouts.dart';

class NearStoresSection extends StatelessWidget {
  const NearStoresSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.h,
      child: ListView.builder(
        padding: kScaffoldPadding,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: storesMock.length,
        itemBuilder: (context, index) {
          final store = storesMock[index];
          return Container(
            margin: EdgeInsets.only(left: 10.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomCard(
                  imagePath: store.imagePath,
                ),
                SizedBox(
                  height: 5.h,
                ),
                Text(
                  store.name!,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      fontWeight: FontWeight.w700, color: Colors.black),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
