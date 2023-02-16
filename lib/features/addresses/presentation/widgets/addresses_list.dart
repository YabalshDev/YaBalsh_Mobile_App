import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../../../core/utils/enums/empty_states.dart';
import '../../../../core/utils/enums/request_state.dart';
import '../../../../core/widgets/empty_indicator.dart';
import '../../../../core/widgets/error_indicator.dart';
import '../../../../core/widgets/yaBalash_toast.dart';
import '../blocs/cubit/address_cubit.dart';
import 'address_card.dart';

class AddressesList extends StatelessWidget {
  const AddressesList({
    Key? key,
    required this.fromRoute,
  }) : super(key: key);

  final String fromRoute;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddressCubit, AddressState>(
      listener: (context, state) {
        if (state.addressesRequestState == RequestState.error) {
          yaBalashCustomToast(message: state.errorMessage!, context: context);
        }
      },
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
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: state.addresses!.length,
                itemBuilder: (context, index) {
                  final address = state.addresses![index];
                  return AddressCard(
                    fromRoute: fromRoute,
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
                      emptyStateType: EmptyStates.addresses,
                      title: 'لا يوجد عناوين حاليا'));
            }

          case RequestState.error:
            return SizedBox(
                height: Get.height * 0.75,
                child:
                    ErrorIndicator(errorMessage: state.errorMessage ?? 'جطا '));
          default:
            return const SizedBox();
        }
      },
    );
  }
}
