import 'package:flutter/material.dart';

import '../widgets/notifications_body.dart';

class NotificatiosView extends StatelessWidget {
  const NotificatiosView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: NotificationsBody(),
    );
  }
}
