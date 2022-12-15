import 'package:flutter/material.dart';
import 'package:yabalash_mobile_app/features/auth/presentation/widgets/account_problem_bottom_bar.dart';

import '../widgets/phone_number_body.dart';

class PhoneNumberView extends StatelessWidget {
  const PhoneNumberView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: PhoneNumberBody(),
      bottomNavigationBar: AccountProblemBottomBar(),
    );
  }
}
