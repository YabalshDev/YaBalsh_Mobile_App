import 'package:flutter/material.dart';

import '../widgets/categories_body.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: CategoriesBody()),
    );
  }
}
