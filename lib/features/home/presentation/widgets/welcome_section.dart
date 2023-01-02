import 'package:flutter/material.dart';
import 'package:yabalash_mobile_app/core/services/user_service.dart';

import '../../../../core/constants/app_layouts.dart';
import '../../../../core/depedencies.dart';

class WelcomeSection extends StatelessWidget {
  const WelcomeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: kScaffoldPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "اهلا بيك ${getIt<UserService>().currentCustomer!.firstName ?? ''},",
            style: Theme.of(context)
                .textTheme
                .bodyLarge
                ?.copyWith(fontWeight: FontWeight.w500),
          ),
          Text(
            "عايز تشتري ايه بارخص سعر؟",
            style: Theme.of(context)
                .textTheme
                .bodyLarge
                ?.copyWith(fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
