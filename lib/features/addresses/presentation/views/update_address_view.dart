import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:yabalash_mobile_app/features/addresses/presentation/widgets/update_address_body.dart';

import '../../domain/entities/address.dart';
import '../widgets/update_address_bottom.dart';

class UpdateAddress extends StatefulWidget {
  final bool isfromEdit;
  final Address? address;
  final String fromRoute;
  const UpdateAddress(
      {super.key,
      required this.isfromEdit,
      this.address,
      required this.fromRoute});

  @override
  State<UpdateAddress> createState() => _UpdateAddressState();
}

class _UpdateAddressState extends State<UpdateAddress> {
  late GlobalKey<FormBuilderState> _formKey;

  @override
  void initState() {
    _formKey = GlobalKey<FormBuilderState>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: UpdateAddressBody(
        isFromEdit: widget.isfromEdit,
        fromRoute: widget.fromRoute,
        formkey: _formKey,
        address: widget.address,
      ),
      bottomNavigationBar: UpdateAddressBottom(
        addressId: widget.address!.id!,
        formKey: _formKey,
        fromRoute: widget.fromRoute,
        isfromEdit: widget.isfromEdit,
      ),
    );
  }
}
