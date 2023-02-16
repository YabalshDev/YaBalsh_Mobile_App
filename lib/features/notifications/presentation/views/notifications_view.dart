import 'package:flutter/material.dart';

import '../widgets/notifications_body.dart';

class NotificationsView extends StatelessWidget {
  const NotificationsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: NotificationsBody(),
    );
  }
}
