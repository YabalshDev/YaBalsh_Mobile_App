import 'package:flutter/material.dart';
import 'package:yabalash_mobile_app/features/auth/presentation/widgets/account_problem_bottom_bar.dart';

import '../widgets/phone_number_body.dart';

class PhoneNumberView extends StatelessWidget {
  final String fromRoute;
  const PhoneNumberView({super.key, required this.fromRoute});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PhoneNumberBody(fromRoute: fromRoute),
      bottomNavigationBar: const AccountProblemBottomBar(),
    );
  }
}
