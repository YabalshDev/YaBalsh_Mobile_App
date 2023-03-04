import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:yabalash_mobile_app/core/utils/enums/request_state.dart';
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
    // Initialize the savings amount
    double saving = 0.0;

    // Loop through each product in the order
    for (var element in order.products!) {
      // Fetch the details of the product
      final response = await getProductDetailsUseCase(GetProductDetailsParams(
        withNearStores: false,
        productId: element.id!,
      ));

      // If the product details were fetched successfully, add the savings to the total
      response.fold(
        (failure) {}, // Ignore failures
        (product) {
          if (product.prices != null) {
            // Check if prices are available
            final storePrice = product.prices![order.store!.name!];
            if (storePrice != null) {
              // Check if the price for the current store is available
              // Calculate the savings for the current product and add it to the total
              saving += (product.prices!.entries.last.value.price! -
                  storePrice.price!);
            }
          }
        },
      );
    }

    // Update the state with the savings amount
    emit(state.copyWith(
      savingRequestState: RequestState.loaded,
      saving: saving,
    ));
  }
}
