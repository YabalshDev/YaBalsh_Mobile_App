import 'package:flutter/material.dart';
import 'package:yabalash_mobile_app/features/reciepies/domain/entities/brand.dart';

import '../widgets/brand_details_body.dart';

class BrandDetailsView extends StatelessWidget {
  final Brand brand;
  const BrandDetailsView({super.key, required this.brand});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BrandDetailsBody(brand: brand),
    );
  }
}
