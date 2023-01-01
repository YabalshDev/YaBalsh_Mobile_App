import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:yabalash_mobile_app/core/utils/enums/request_state.dart';
import 'package:yabalash_mobile_app/features/product_details/domain/usecases/get_product_details_usecase.dart';
import 'package:yabalash_mobile_app/features/search/domain/usecases/search_product_usecase.dart';

import '../../../../home/domain/entities/product.dart';

part 'product_details_state.dart';

class ProductDetailsCubit extends Cubit<ProductDetailsState> {
  final GetProductDetailsUseCase getProductDetailsUseCase;
  final SearchProductUsecase searchProductUsecase;
  ProductDetailsCubit(
      {required this.getProductDetailsUseCase,
      required this.searchProductUsecase})
      : super(const ProductDetailsState());

  void changeWithNearStores(bool value) =>
      emit(state.copyWith(withNearStores: value));

  void changeShowMore(bool value) => emit(state.copyWith(showMore: value));

  void getProductDetails(
      {required int productId, required withNearStores}) async {
    final response = await getProductDetailsUseCase(GetProductDetailsParams(
        productId: productId, withNearStores: withNearStores));

    response.fold((l) {
      emit(state.copyWith(productRequestState: RequestState.error));
    },
        (product) => emit(state.copyWith(
            product: product, productRequestState: RequestState.loaded)));
  }
}
