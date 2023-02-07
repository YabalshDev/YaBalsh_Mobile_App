import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:yabalash_mobile_app/core/constants/app_layouts.dart';
import 'package:yabalash_mobile_app/core/routes/app_routes.dart';
import 'package:yabalash_mobile_app/core/utils/enums/search_navigation_screens.dart';
import 'package:yabalash_mobile_app/core/widgets/custom_animated_widget.dart';

import '../../features/home/domain/entities/store.dart';
import 'custom_card.dart';

class NearStoresList extends StatelessWidget {
  final bool isWithPadding;
  final List<Store> stores;
  const NearStoresList(
      {super.key, required this.isWithPadding, required this.stores});

  @override
  Widget build(BuildContext context) {
    return CustomAnimatedWidget(
      child: SizedBox(
        height: 100.h,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: isWithPadding ? kScaffoldPadding : null,
            itemCount: stores.length,
            itemBuilder: (context, index) {
              final store = stores[index];
              return GestureDetector(
                onTap: () {
                  Get.back();
                  Get.toNamed(RouteHelper.getSearchRoute(), arguments: [
                    SearchNavigationScreens.storeScreen,
                    store.name,
                    0
                  ]);
                },
                child: Container(
                    margin: EdgeInsets.only(left: 25.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CustomCard(
                          imagePath: store.logoImagePath,
                          fit: BoxFit.cover,
                          isAssetImage: false,
                          borderRadius: 10.r,
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Container(
                          constraints: BoxConstraints(maxWidth: 80.w),
                          child: Text(
                            store.name!,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall
                                ?.copyWith(
                                    fontWeight: FontWeight.w700,
                                    color: Colors.black),
                          ),
                        )
                      ],
                    )),
              );
            }),
      ),
    );
  }
}
