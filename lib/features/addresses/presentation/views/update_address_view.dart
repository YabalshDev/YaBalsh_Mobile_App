import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yabalash_mobile_app/core/constants/app_layouts.dart';
import 'package:yabalash_mobile_app/core/services/zone_service.dart';
import 'package:yabalash_mobile_app/features/addresses/domain/entities/address_request.dart';
import 'package:yabalash_mobile_app/features/addresses/presentation/widgets/update_address_body.dart';

import '../../../../core/depedencies.dart';
import '../../../../core/widgets/ya_balash_custom_button.dart';
import '../../domain/entities/address.dart';
import '../blocs/cubit/update_address_cubit.dart';

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
      bottomNavigationBar: Container(
        padding: kDefaultPadding.copyWith(bottom: 10.h, top: 10.h),
        height: 80.h,
        child: BlocBuilder<UpdateAddressCubit, UpdateAddressState>(
          builder: (context, state) {
            return YaBalashCustomButton(
              isDisabled: widget.isfromEdit ? false : state.isButtonDisabled,
              onTap: () {
                if (!state.isButtonDisabled!) {
                  if (_formKey.currentState!.validate()) {
                    final zone = getIt<ZoneService>().currentSubZone;
                    final district =
                        _formKey.currentState!.fields['district']!.value;
                    final name =
                        _formKey.currentState!.fields['fullName']!.value;
                    final street =
                        _formKey.currentState!.fields['street']!.value;

                    final addressBody = AddressRequest(
                        addressLine:
                            '$name%$district%$street%${zone!.mainZoneName}',
                        apartmentNo:
                            _formKey.currentState!.fields['apartment']!.value,
                        buildingNo:
                            _formKey.currentState!.fields['buildingNo']!.value,
                        floorNo: _formKey.currentState!.fields['floor']!.value);

                    if (widget.isfromEdit) {
                      BlocProvider.of<UpdateAddressCubit>(context).editAddress(
                          id: widget.address!.id!,
                          addressRequest: addressBody,
                          fromRoute: widget.fromRoute);
                    } else {
                      BlocProvider.of<UpdateAddressCubit>(context).addAddress(
                          addressRequest: addressBody,
                          fromRoute: widget.fromRoute);
                    }
                  }
                }
              },
              child: const Text('حفظ العنوان'),
            );
          },
        ),
      ),
    );
  }
}
