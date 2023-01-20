import 'package:flutter/material.dart';

import '../widgets/register_body.dart';

class RegisterView extends StatelessWidget {
  final String phoneNumber;
  final String fromRoute;
  const RegisterView(
      {super.key, required this.phoneNumber, required this.fromRoute});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: RegisterBody(phoneNumber: phoneNumber, fromRoute: fromRoute),
    );
  }
}
