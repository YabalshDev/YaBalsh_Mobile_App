// ignore_for_file: prefer_final_fields, unused_field

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:get/get.dart';
import 'package:yabalash_mobile_app/core/utils/enums/request_state.dart';
import 'package:yabalash_mobile_app/core/widgets/custom_dialog.dart';
import 'package:yabalash_mobile_app/features/orders/domain/usecases/get_past_orders_usecase.dart';

import '../../../domain/entities/order.dart';

part 'past_orders_state.dart';

class PastOrdersCubit extends Cubit<PastOrdersState> {
  final GetPastOrdersUseCase getPastOrdersUseCase;
  PastOrdersCubit({required this.getPastOrdersUseCase})
      : super(const PastOrdersState());

  int _currentPage = 1;

  List<Order> _pastOrders = [];

  void getPastOrders() async {
    final response =
        await getPastOrdersUseCase(GetPastOrdersParams(page: _currentPage));
    response.fold((failure) {
      emit(state.copyWith(
          errorMessage: failure.message,
          ordersRequestState: RequestState.error));
      yaBalashCustomDialog(
        buttonTitle: 'حسنا',
        isWithEmoji: false,
        title: 'خطأ',
        mainContent: failure.message,
        onConfirm: () => Get.back(),
      );
    }, (orders) {
      _currentPage++;
      _pastOrders.addAll(orders);
      emit(state.copyWith(
        paginationLoading: false,
        completedOrders: _pastOrders
            .where((element) => element.status != 'pending')
            .toList(),
        pendingOrders: _pastOrders
            .where((element) => element.status == 'pending')
            .toList(),
        ordersRequestState: RequestState.loaded,
      ));
    });
  }

  void handlePastOrdersPagination() {
    emit(state.copyWith(
        ordersRequestState: RequestState.idle, paginationLoading: true));
    getPastOrders();
  }
}
