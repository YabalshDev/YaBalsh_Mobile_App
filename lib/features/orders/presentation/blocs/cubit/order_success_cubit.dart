import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:yabalash_mobile_app/core/utils/enums/request_state.dart';
import 'package:yabalash_mobile_app/features/home/domain/entities/product.dart';
import 'package:yabalash_mobile_app/features/product_details/domain/usecases/get_product_details_usecase.dart';

import '../../../domain/entities/order.dart';

part 'order_success_state.dart';

class OrderSuccessCubit extends Cubit<OrderSuccessState> {
  final GetProductDetailsUseCase getProductDetailsUseCase;
  OrderSuccessCubit({
    required this.getProductDetailsUseCase,
  }) : super(const OrderSuccessState());

  void changeViewDetails(bool value) {
    emit(state.copyWith(viewDetails: value));
  }

  void calculateSaving(Order order) async {
    List<Product> products = [];
    double saving = 0.0;
    for (var element in order.products!) {
      final response = await getProductDetailsUseCase(GetProductDetailsParams(
          withNearStores: false, productId: element.id!));
      response.fold((faiulre) {}, (product) {
        products.add(product);
      });
    }

    for (Product product in products) {
      saving += (product.prices!.entries.last.value.price! -
          product.prices![order.store!.name!]!.price!);
    }

    emit(state.copyWith(
        savingRequestState: RequestState.loaded, saving: saving));
  }
}
