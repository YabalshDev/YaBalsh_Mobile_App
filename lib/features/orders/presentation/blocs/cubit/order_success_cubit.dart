import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'order_success_state.dart';

class OrderSuccessCubit extends Cubit<OrderSuccessState> {
  OrderSuccessCubit() : super(const OrderSuccessState());

  void changeViewDetails(bool value) {
    emit(OrderSuccessState(viewDetails: value));
  }
}
