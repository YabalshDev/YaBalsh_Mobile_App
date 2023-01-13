import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:yabalash_mobile_app/core/routes/app_routes.dart';
import 'package:yabalash_mobile_app/features/zones/domain/entities/main_zone.dart';

class MainZoneCard extends StatelessWidget {
  final MainZone mainZone;
  final int index;
  final int length;
  const MainZoneCard(
      {super.key,
      required this.mainZone,
      required this.index,
      required this.length});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 44.h,
          child: ListTile(
              onTap: () {
                Get.toNamed(RouteHelper.getSubZonesRoute(),
                    arguments: mainZone);
              },
              trailing: Icon(
                Icons.arrow_forward_ios,
                color: Colors.grey,
                size: 15.h,
              ),
              title: Text(mainZone.name!,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontSize: 13.sp, fontWeight: FontWeight.w700))),
        ),
        index == length - 1
            ? const SizedBox()
            : Divider(
                color: Colors.grey.shade300,
                thickness: 1,
              )
      ],
    );
  }
}
