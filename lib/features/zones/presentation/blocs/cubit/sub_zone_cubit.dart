import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yabalash_mobile_app/features/zones/domain/repositories/zones_repositoriy.dart';
import 'package:yabalash_mobile_app/features/zones/domain/usecases/get_all_subzones_usecase.dart';

import '../../../../../core/usecases/use_cases.dart';
import '../../../../../core/utils/enums/request_state.dart';
import '../../../../../core/widgets/custom_dialog.dart';
import '../../../domain/entities/sub_zone.dart';

part 'sub_zone_state.dart';

class SubZoneCubit extends Cubit<SubZoneState> {
  final GetSubZonesUseCase getSubZonesUseCase;
  final ZonesRepository zonesRepository;
  SubZoneCubit(
      {required this.getSubZonesUseCase, required this.zonesRepository})
      : super(const SubZoneState());

  void getSubZones() async {
    final response = await getSubZonesUseCase(NoParams());

    response.fold((failure) {
      emit(state.copyWith(
          errorMessage: failure.message, subZonesState: RequestState.error));
      showCustomDialog(
          title: 'خطأ',
          buttonTitle: 'حسنا',
          isWithEmoji: false,
          onConfirm: () => Get.back(),
          mainContent: failure.message);
    }, (zones) {
      emit(state.copyWith(subZones: zones, subZonesState: RequestState.loaded));
    });
  }

  void setSubZone({required SubZone subZone}) {
    zonesRepository.setZone(zone: subZone);
  }

  void onSubZoneSelect({required SubZone subZone}) {
    showCustomDialog(
      title: 'ملاحظة',
      buttonTitle: 'تاكيد',
      isWithEmoji: false,
      mainContent: 'هل انت متاكد من اختيار منطقة ${subZone.name}؟',
      onConfirm: () {
        setSubZone(subZone: subZone);
        debugPrint('success');
      },
    );
  }
}
