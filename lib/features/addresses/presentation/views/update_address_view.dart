import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yabalash_mobile_app/core/constants/app_layouts.dart';
import 'package:yabalash_mobile_app/features/addresses/domain/entities/address_request.dart';
import 'package:yabalash_mobile_app/features/addresses/presentation/widgets/update_address_body.dart';

import '../../../../core/widgets/ya_balash_custom_button.dart';
import '../../domain/entities/address.dart';
import '../blocs/cubit/update_address_cubit.dart';

final _formKey = GlobalKey<FormBuilderState>();

class UpdateAddress extends StatelessWidget {
  final bool isfromEdit;
  final Address? address;
  final String fromRoute;
  const UpdateAddress(
      {super.key,
      required this.isfromEdit,
      this.address,
      required this.fromRoute});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: UpdateAddressBody(
        isFromEdit: isfromEdit,
        fromRoute: fromRoute,
        formkey: _formKey,
        address: address,
      ),
      bottomNavigationBar: Container(
        padding: kDefaultPadding.copyWith(bottom: 10.h, top: 10.h),
        height: 80.h,
        child: BlocBuilder<UpdateAddressCubit, UpdateAddressState>(
          builder: (context, state) {
            return YaBalashCustomButton(
              isDisabled: isfromEdit ? false : state.isButtonDisabled,
              onTap: () {
                if (!state.isButtonDisabled!) {
                  if (_formKey.currentState!.validate()) {
                    final district =
                        _formKey.currentState!.fields['district']!.value;
                    final name =
                        _formKey.currentState!.fields['fullName']!.value;
                    final street =
                        _formKey.currentState!.fields['street']!.value;

                    final addressBody = AddressRequest(
                        addressLine: '$name%$district%$street',
                        apartmentNo:
                            _formKey.currentState!.fields['apartment']!.value,
                        buildingNo:
                            _formKey.currentState!.fields['buildingNo']!.value,
                        floorNo: _formKey.currentState!.fields['floor']!.value);

                    if (isfromEdit) {
                      BlocProvider.of<UpdateAddressCubit>(context).editAddress(
                          id: address!.id!,
                          addressRequest: addressBody,
                          fromRoute: fromRoute);
                    } else {
                      BlocProvider.of<UpdateAddressCubit>(context).addAddress(
                          addressRequest: addressBody, fromRoute: fromRoute);
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
