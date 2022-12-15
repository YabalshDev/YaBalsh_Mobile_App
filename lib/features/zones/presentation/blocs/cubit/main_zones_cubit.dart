import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:get/get.dart';
import 'package:yabalash_mobile_app/core/usecases/use_cases.dart';
import 'package:yabalash_mobile_app/core/utils/enums/request_state.dart';
import 'package:yabalash_mobile_app/core/widgets/custom_dialog.dart';
import 'package:yabalash_mobile_app/features/zones/domain/entities/sub_zone.dart';
import 'package:yabalash_mobile_app/features/zones/domain/usecases/get_past_subzones_usecase.dart';

part 'main_zones_state.dart';

class MainZonesCubit extends Cubit<MainZonesState> {
  final GetPastSubZonesUseCase getPastSubZonesUseCase;
  MainZonesCubit({required this.getPastSubZonesUseCase})
      : super(const MainZonesState());

  void getZonesHistory() async {
    final response = getPastSubZonesUseCase(NoParams());

    response.fold((failure) {
      emit(state.copyWith(
          errorMessage: failure.message,
          zonesHistoryState: RequestState.error));
      showCustomDialog(
          title: 'خطأ',
          buttonTitle: 'حسنا',
          isWithEmoji: false,
          onConfirm: () => Get.back(),
          mainContent: failure.message);
    }, (zones) {
      emit(state.copyWith(
          zonesHistory: zones, zonesHistoryState: RequestState.loaded));
    });
  }
}
