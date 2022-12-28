import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:get/get.dart';
import 'package:yabalash_mobile_app/core/usecases/use_cases.dart';
import 'package:yabalash_mobile_app/core/utils/enums/request_state.dart';
import 'package:yabalash_mobile_app/core/widgets/custom_dialog.dart';
import 'package:yabalash_mobile_app/features/orders/domain/usecases/get_past_orders_usecase.dart';

import '../../../domain/entities/order.dart';

part 'past_orders_state.dart';

class PastOrdersCubit extends Cubit<PastOrdersState> {
  final GetPastOrdersUseCase getPastOrdersUseCase;
  PastOrdersCubit({required this.getPastOrdersUseCase})
      : super(const PastOrdersState());

  void getPastOrders() async {
    final response = await getPastOrdersUseCase(NoParams());
    response.fold((failure) {
      emit(state.copyWith(
          errorMessage: 'حدث خطا اثناء جلب الطلبات',
          ordersRequestState: RequestState.error));
      yaBalashCustomDialog(
        buttonTitle: 'حسنا',
        isWithEmoji: false,
        title: 'خطأ',
        mainContent: failure.message,
        onConfirm: () => Get.back(),
      );
    }, (orders) {
      emit(state.copyWith(
        completedOrders:
            orders.where((element) => element.status == 'completed').toList(),
        pendingOrders:
            orders.where((element) => element.status == 'pending').toList(),
        ordersRequestState: RequestState.loaded,
      ));
    });
  }
}
