import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yabalash_mobile_app/core/constants/app_layouts.dart';

import '../../features/home/domain/entities/store.dart';
import 'custom_card.dart';

class NearStoresList extends StatelessWidget {
  final List<Store> stores;
  final bool isWithPadding;
  const NearStoresList(
      {super.key, required this.stores, required this.isWithPadding});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.h,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          padding: isWithPadding ? kScaffoldPadding : null,
          itemCount: stores.length,
          itemBuilder: (context, index) {
            final store = stores[index];
            return Container(
                margin: EdgeInsets.only(left: 10.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomCard(
                      imagePath: store.cardImagePath,
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
                ));
          }),
    );
  }
}
