import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/depedencies.dart';
import '../../../../core/services/zone_service.dart';
import '../../../../core/widgets/custom_bottom_nav_bar.dart';
import '../../domain/entities/address_request.dart';
import '../blocs/cubit/update_address_cubit.dart';

class UpdateAddressBottom extends StatelessWidget {
  const UpdateAddressBottom({
    super.key,
    required this.formKey,
    required this.isfromEdit,
    required this.fromRoute,
    this.addressId,
  });

  final GlobalKey<FormBuilderState> formKey;
  final bool isfromEdit;
  final String fromRoute;
  final int? addressId;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UpdateAddressCubit, UpdateAddressState>(
      builder: (context, state) {
        return CustomNavBar(
          isButtonSecondary: false,
          height: 85.h,
          isDisabled: isfromEdit ? false : state.isButtonDisabled,
          mainButtonTap: () {
            if (!state.isButtonDisabled!) {
              if (formKey.currentState!.validate()) {
                final zone = getIt<ZoneService>().currentSubZone;
                final district =
                    formKey.currentState!.fields['district']!.value;
                final name = formKey.currentState!.fields['fullName']!.value;
                final street = formKey.currentState!.fields['street']!.value;

                final addressBody = AddressRequest(
                    addressLine:
                        '$name%$district%$street%${zone!.mainZoneName}',
                    apartmentNo:
                        formKey.currentState!.fields['apartment']!.value,
                    buildingNo:
                        formKey.currentState!.fields['buildingNo']!.value,
                    floorNo: formKey.currentState!.fields['floor']!.value);

                if (isfromEdit) {
                  BlocProvider.of<UpdateAddressCubit>(context).editAddress(
                      id: addressId!,
                      addressRequest: addressBody,
                      fromRoute: fromRoute);
                } else {
                  BlocProvider.of<UpdateAddressCubit>(context).addAddress(
                      addressRequest: addressBody, fromRoute: fromRoute);
                }
              }
            }
          },
          title: 'حفظ العنوان',
        );
      },
    );
  }
}
