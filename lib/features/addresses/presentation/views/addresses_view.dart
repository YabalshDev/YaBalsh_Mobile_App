import 'package:flutter/material.dart';
import 'package:yabalash_mobile_app/core/constants/app_layouts.dart';
import 'package:yabalash_mobile_app/core/widgets/custom_header.dart';
import 'package:yabalash_mobile_app/features/addresses/presentation/widgets/addresses_body.dart';

class AddressesView extends StatelessWidget {
  const AddressesView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: AddressesBody());
  }
}
