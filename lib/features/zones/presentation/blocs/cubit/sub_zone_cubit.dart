import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yabalash_mobile_app/core/routes/app_routes.dart';
import 'package:yabalash_mobile_app/features/zones/domain/repositories/zones_repositoriy.dart';
import 'package:yabalash_mobile_app/features/zones/domain/usecases/get_mainzone_subzones_usecase.dart';

import '../../../../../core/utils/enums/request_state.dart';
import '../../../../../core/widgets/custom_dialog.dart';
import '../../../domain/entities/sub_zone.dart';

part 'sub_zone_state.dart';

class SubZoneCubit extends Cubit<SubZoneState> {
  final GetMainZoneSubZonesUseCase getMainZoneSubZonesUseCase;
  final ZonesRepository zonesRepository;
  SubZoneCubit(
      {required this.getMainZoneSubZonesUseCase, required this.zonesRepository})
      : super(const SubZoneState());

  void getMainZoneSubZones(int mainZoneId) async {
    final response = await getMainZoneSubZonesUseCase(
        GetMainZoneSubZonesParams(mainCategoryId: mainZoneId));

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
    yaBalashCustomDialog(
      title: 'ملاحظة',
      buttonTitle: 'تاكيد',
      isWithEmoji: false,
      mainContent: 'هل انت متاكد من اختيار منطقة ${subZone.name}؟',
      onConfirm: () {
        setSubZone(subZone: subZone);
        Get.back();
        Get.offAllNamed(RouteHelper.getMainNavigationRoute(), arguments: 0);
        debugPrint('success');
      },
    );
  }
}
