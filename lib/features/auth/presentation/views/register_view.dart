import 'package:flutter/material.dart';
import 'package:yabalash_mobile_app/features/auth/presentation/widgets/account_problem_bottom_bar.dart';

import '../widgets/register_body.dart';

class RegisterView extends StatelessWidget {
  final String phoneNumber;
  const RegisterView({super.key, required this.phoneNumber});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: RegisterBody(phoneNumber: phoneNumber),
        bottomNavigationBar: const AccountProblemBottomBar());
  }
}
