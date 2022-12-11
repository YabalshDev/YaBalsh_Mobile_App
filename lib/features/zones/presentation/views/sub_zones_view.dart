import 'package:flutter/material.dart';
import 'package:yabalash_mobile_app/features/zones/presentation/widgets/sub_zones_body.dart';

class SubZonesView extends StatelessWidget {
  final String? mainZone;
  const SubZonesView({super.key, this.mainZone});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SubZonesBody(
      mainZone: mainZone,
    ));
  }
}
