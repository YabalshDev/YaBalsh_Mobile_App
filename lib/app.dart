import 'package:flutter/material.dart';
import 'package:yabalash_mobile_app/core/constants/app_strings.dart';

class YaBalashApp extends StatelessWidget {
  const YaBalashApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: AppStrings.appName,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomeView());
  }
}

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
