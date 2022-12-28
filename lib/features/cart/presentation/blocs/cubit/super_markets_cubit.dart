import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:get/get.dart';
import 'package:yabalash_mobile_app/features/cart/domain/entities/store_price.dart';
import 'package:yabalash_mobile_app/features/cart/domain/entities/supermarket_card_model.dart';

import '../../../../../core/depedencies.dart';
import '../../../../../core/services/order_service.dart';
import '../../../../../core/utils/enums/request_state.dart';
import '../../../../../core/widgets/custom_dialog.dart';
import '../../../domain/usecases/get_store_usecase.dart';
import 'cart_cubit.dart';

part 'super_markets_state.dart';

class SuperMarketsCubit extends Cubit<SuperMarketsState> {
  final GetStoreUseCase getStoreUseCase;
  SuperMarketsCubit({
    required this.getStoreUseCase,
  }) : super(const SuperMarketsState());

  void setSuperMarketIndex({required int index}) {
    getIt<OrderService>().setSelectedSuperMarket(
        supermarket: state.availableSupermarkets![index]);
    getIt<CartCubit>()
        .changeSupermarketSelected(state.availableSupermarkets![index]);
    emit(state.copyWith(selectedSupermarketIndex: index));
  }

  Map<String, StorePrice> _sortStoresPrices(Map<String, StorePrice> prices) {
    List<MapEntry<String, StorePrice>> entries = prices.entries.toList();
    entries.sort(
      (a, b) => a.value.price!.compareTo(b.value.price!),
    );

    return Map.fromEntries(entries);
  }

  Map<String, dynamic> _getSupermarketsPrices() {
    final cartProducts = getIt<CartCubit>().cart;
    Map<String, StorePrice> storesTotalPrices = {};
    Map<int, int> supermarketsIds = {};
    for (var cartProduct in cartProducts) {
      int quantity = cartProduct.quantity!;
      for (var priceModel in cartProduct.product!.prices!.entries) {
        double price = priceModel.value.price!;
        int isAvailable = priceModel.value.isAvailable!;
        if (supermarketsIds[priceModel.value.storeId!] != null) {
          supermarketsIds[priceModel.value.storeId!] =
              supermarketsIds[priceModel.value.storeId!]! + 1;
        } else {
          supermarketsIds[priceModel.value.storeId!] = 1;
        }

        if (storesTotalPrices.containsKey(priceModel.key)) {
          StorePrice storePrice = storesTotalPrices[priceModel.key]!;
          double totalPrice = (storePrice.price! + (quantity * price));
          if (storePrice.isAvailable == 0) {
            storesTotalPrices.update(
                priceModel.key,
                (value) => storePrice.copyWith(
                      price: totalPrice,
                    ));
          } else {
            storesTotalPrices.update(
                priceModel.key,
                (value) => storePrice.copyWith(
                    price: totalPrice, isAvailable: isAvailable));
          }
        } else {
          //first addition
          storesTotalPrices[priceModel.key] =
              StorePrice(price: (quantity * price), isAvailable: isAvailable);
        }
      }
    }

    List<MapEntry<int, int>> entries = supermarketsIds.entries
        .where((element) => element.value == cartProducts.length)
        .toList();
    List<int> storeIds = [];
    for (var element in entries) {
      storeIds.add(element.key);
    }

    final sortedPrices = _sortStoresPrices(storesTotalPrices);

    return {'storeIds': storeIds, 'storePrices': sortedPrices};
  }

  void getSuperMarkets() async {
    List<SuperMarketCardModel> supermarkets = [];

    final supermarketPrices = _getSupermarketsPrices();

    List<int> storeIds = supermarketPrices['storeIds'];
    Map<String, StorePrice> storesPrices = supermarketPrices['storePrices'];

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
        final storePriceModel = storesPrices[store.name];
        supermarkets.add(SuperMarketCardModel(
            store: store,
            price: storePriceModel!.price,
            saving: (storesPrices.values.last.price! - storePriceModel.price!),
            isAvailable: storesPrices[store.name]!.isAvailable));
      });
    }

    emit(state.copyWith(
        availableSupermarkets:
            supermarkets.where((element) => element.isAvailable == 1).toList(),
        storeRequestState: RequestState.loaded,
        unAvailableSupermarkets: supermarkets
            .where((element) => element.isAvailable == 0)
            .toList()));
  }
}
