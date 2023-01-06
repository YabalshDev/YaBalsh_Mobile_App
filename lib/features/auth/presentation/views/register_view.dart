import 'package:flutter/material.dart';
import 'package:yabalash_mobile_app/features/auth/presentation/widgets/account_problem_bottom_bar.dart';

import '../widgets/register_body.dart';

class RegisterView extends StatelessWidget {
  final String phoneNumber;
  final String fromRoute;
  const RegisterView(
      {super.key, required this.phoneNumber, required this.fromRoute});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: RegisterBody(phoneNumber: phoneNumber, fromRoute: fromRoute),
        bottomNavigationBar: const AccountProblemBottomBar());
  }
}
