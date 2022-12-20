import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:get/get.dart';
import 'package:yabalash_mobile_app/features/cart/domain/entities/supermarket_card_model.dart';

import '../../../../../core/depedencies.dart';
import '../../../../../core/utils/enums/request_state.dart';
import '../../../../../core/widgets/custom_dialog.dart';
import '../../../../home/domain/entities/store.dart';
import '../../../domain/usecases/get_store_usecase.dart';
import 'cart_cubit.dart';

part 'super_markets_state.dart';

class SuperMarketsCubit extends Cubit<SuperMarketsState> {
  final GetStoreUseCase getStoreUseCase;
  SuperMarketsCubit({
    required this.getStoreUseCase,
  }) : super(const SuperMarketsState());

  void setSuperMarketIndex({required int index}) =>
      emit(state.copyWith(selectedSupermarketIndex: index));

  void getSuperMarkets() async {
    final cartProducts = getIt<CartCubit>().cart;
    List<Store> stores = [];
    List<SuperMarketCardModel> supermarkets = [];
    Map<String, double> storesTotalPrices = {};
    Set<int> storeIds = {};
    for (var element in cartProducts) {
      for (var element in element.product!.prices!.entries) {
        storeIds.add(element.value.storeId!);
        if (storesTotalPrices.containsKey(element.key)) {
          storesTotalPrices[element.key] !=
              storesTotalPrices[element.key]! + element.value.price!;
        } else {
          storesTotalPrices[element.key] = element.value.price!;
        }
      }
    }
    // storesTotalPrices.entries.toList().sort();

    for (int id in storeIds) {
      final response = await getStoreUseCase(GetStoreParams(id: id));
      response.fold((fauilre) {
        yaBalashCustomDialog(
          isWithEmoji: false,
          buttonTitle: 'حسنا',
          mainContent: 'حدث مشكلة اثناء جلب المتجر',
          title: 'خطأ',
          onConfirm: () => Get.back(),
        );
        emit(state.copyWith(storeRequestState: RequestState.error));
      }, (store) {
        supermarkets.add(SuperMarketCardModel(
            store: store,
            price: storesTotalPrices[store.name],
            saving: (storesTotalPrices.values.last -
                storesTotalPrices[store.name]!)));
      });
    }

    emit(state.copyWith(superMarkets: supermarkets));
  }
}
