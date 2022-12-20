import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:yabalash_mobile_app/core/constants/app_assets.dart';
import 'package:yabalash_mobile_app/core/widgets/empty_indicator.dart';
import 'package:yabalash_mobile_app/features/addresses/presentation/blocs/cubit/address_cubit.dart';
import 'package:yabalash_mobile_app/features/addresses/presentation/widgets/address_card.dart';

import '../../../../core/constants/app_layouts.dart';
import '../../../../core/utils/enums/request_state.dart';
import '../../../../core/widgets/custom_header.dart';

class AddressesBody extends StatelessWidget {
  const AddressesBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
          child: Column(
        children: [
          const CustomHeader(
              isWithNotification: true,
              title: 'عناويني',
              iconPath: AppAssets.closeIcon),
          largeVerticalSpace,
          BlocBuilder<AddressCubit, AddressState>(
            builder: (context, state) {
              switch (state.addressesRequestState) {
                case RequestState.idle:
                  return const SizedBox();
                case RequestState.loading:
                  return SizedBox(
                    height: Get.size.height * 0.6,
                    child: const Center(
                      child: CircularProgressIndicator.adaptive(),
                    ),
                  );
                case RequestState.loaded:
                  if (state.addresses!.isNotEmpty) {
                    return ListView.builder(
                      key: UniqueKey(),
                      shrinkWrap: true,
                      itemCount: state.addresses!.length,
                      itemBuilder: (context, index) {
                        final address = state.addresses![index];
                        return AddressCard(
                          index: index,
                          address: address,
                          isPrimary: state.currentAddressIndex == index,
                        );
                      },
                    );
                  } else {
                    return SizedBox(
                        height: Get.height * 0.75,
                        child: const EmptyIndicator(
                            title: 'لا يوجد عناوين حاليا'));
                  }

                case RequestState.error:
                  return const SizedBox();
                default:
                  return const SizedBox();
              }
            },
          )
        ],
      )),
    );
  }
}