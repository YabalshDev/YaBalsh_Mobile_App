import 'package:flutter/material.dart';
import 'package:yabalash_mobile_app/features/auth/presentation/widgets/account_problem_bottom_bar.dart';

import '../widgets/login_body.dart';

class LoginView extends StatelessWidget {
  final String phoneNumber;
  const LoginView({super.key, required this.phoneNumber});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: LoginBody(
        phoneNumber: phoneNumber,
      )),
      bottomNavigationBar: const AccountProblemBottomBar(),
    );
  }
}
