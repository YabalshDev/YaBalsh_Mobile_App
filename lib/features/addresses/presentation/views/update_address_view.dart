import 'package:flutter/material.dart';
import 'package:yabalash_mobile_app/features/addresses/presentation/widgets/update_address_body.dart';

class UpdateAddress extends StatelessWidget {
  final bool isfromEdit;
  const UpdateAddress({super.key, required this.isfromEdit});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: UpdateAddressBody());
  }
}
