import 'package:flutter/material.dart';
import 'package:yabalash_mobile_app/core/depedencies.dart';
import 'package:yabalash_mobile_app/core/widgets/not_logged_in_view.dart';

import '../services/user_service.dart';

class ProtectedRoute extends StatelessWidget {
  final Widget child;
  const ProtectedRoute({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    if (getIt<UserService>().token.isEmpty) {
      return const NotLoggedInView();
    } else {
      return child;
    }
  }
}
