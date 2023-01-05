part of 'order_success_cubit.dart';

class OrderSuccessState extends Equatable {
  final bool? viewDetails;
  final double? saving;
  final RequestState? savingRequestState;

  const OrderSuccessState(
      {this.saving = 0.0,
      this.savingRequestState = RequestState.loading,
      this.viewDetails = false});

  OrderSuccessState copyWith(
          {bool? viewDetails,
          double? saving,
          RequestState? savingRequestState}) =>
      OrderSuccessState(
          saving: saving ?? this.saving,
          savingRequestState: savingRequestState ?? this.savingRequestState,
          viewDetails: viewDetails ?? this.viewDetails);

  @override
  List<Object> get props => [viewDetails!, savingRequestState!, saving!];
}
