import 'package:flutter/material.dart';
import 'package:yabalash_mobile_app/core/constants/app_layouts.dart';

import 'branch_address_details.dart';
import 'branch_delivery_details.dart';
import 'branch_map_image.dart';
import 'branch_store_details.dart';
import 'branch_title.dart';

class StoreDetailsBody extends StatelessWidget {
  const StoreDetailsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: kDefaultPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const BranchTitle(),
              mediumVerticalSpace,
              const BranchMapImage(),
              largeVerticalSpace,
              mediumVerticalSpace,
              const BranchStoreDetails(),
              mediumVerticalSpace,
              const BranchDeliveryDetails(),
              mediumVerticalSpace,
              const BranchAddressDetails()
            ],
          ),
        ),
      ),
    );
  }
}
