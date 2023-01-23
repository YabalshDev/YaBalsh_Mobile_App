import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:get/get.dart';
import 'package:yabalash_mobile_app/features/cart/domain/entities/store_price.dart';
import 'package:yabalash_mobile_app/features/cart/domain/entities/supermarket_card_model.dart';
import 'package:yabalash_mobile_app/features/home/domain/entities/location.dart';

import '../../../../../core/depedencies.dart';
import '../../../../../core/services/order_service.dart';
import '../../../../../core/services/zone_service.dart';
import '../../../../../core/utils/enums/request_state.dart';
import '../../../../../core/widgets/custom_dialog.dart';
import '../../../../home/domain/entities/price_model.dart';
import '../../../../home/domain/entities/store.dart';
import '../../../domain/entities/cart_item.dart';
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

  void _updateAvaialbleSupermarketsMap(
      PriceModel priceModel, Map<int, int> supermarketsIds) {
    int superMarketId = priceModel.storeId!;

    if (supermarketsIds[superMarketId] != null) {
      supermarketsIds[superMarketId] = supermarketsIds[superMarketId]! + 1;
    } else {
      supermarketsIds[superMarketId] = 1;
    }
  }

  List<int> _getAvailableSupermarketsIds(
      Map<int, int> supermarketsIds, List<CartItem> cart) {
    List<MapEntry<int, int>> entries = supermarketsIds.entries
        .where((element) => element.value == cart.length)
        .toList();
    List<int> storeIds = [];
    for (var element in entries) {
      storeIds.add(element.key);
    }
    return storeIds;
  }

  Map<String, dynamic> _getSupermarketsPrices() {
    final cartProducts = getIt<CartCubit>().cart;
    Map<String, StorePrice> storesTotalPrices = {};
    Map<int, int> supermarketsIds = {};
    for (var cartProduct in cartProducts) {
      int quantity = cartProduct.quantity!;
      for (var priceModel in cartProduct.product!.prices!.entries) {
        double price = priceModel.value.price!;
        bool isAvailable = priceModel.value.isAvailable!;
        _updateAvaialbleSupermarketsMap(priceModel.value, supermarketsIds);

        if (storesTotalPrices.containsKey(priceModel.key)) {
          StorePrice storePrice = storesTotalPrices[priceModel.key]!;
          double totalPrice = (storePrice.price! + (quantity * price));
          if (!storePrice.isAvailable!) {
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

    final storeIds =
        _getAvailableSupermarketsIds(supermarketsIds, cartProducts);

    // sort stores prices
    Map<String, StorePrice> sortedStoresPrices =
        Map.fromEntries(storesTotalPrices.entries.toList()
          ..sort(
            (a, b) => a.value.price!.compareTo(b.value.price!),
          ));

    return {'storeIds': storeIds, 'storePrices': sortedStoresPrices};
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
        bool isStoreInZone = _checkStoreInSameZone(store);

        if (isStoreInZone) {
          final storePriceModel = storesPrices[store.name];
          if (storePriceModel != null) {
            supermarkets.add(SuperMarketCardModel(
                store: store,
                price: storePriceModel.price,
                saving:
                    (storesPrices.values.last.price! - storePriceModel.price!),
                isAvailable: storePriceModel.isAvailable));
          }
        }
      });
    }

    supermarkets.sort(
      (a, b) => a.price!.compareTo(b.price!),
    );

    emit(state.copyWith(
        availableSupermarkets:
            supermarkets.where((element) => element.isAvailable!).toList(),
        storeRequestState: RequestState.loaded,
        unAvailableSupermarkets:
            supermarkets.where((element) => !element.isAvailable!).toList()));
  }

  bool _checkStoreInSameZone(Store store) {
    final zoneId = getIt<ZoneService>().currentSubZone!.id;
    bool isInSameZone = false;

    if (store.locations!.isNotEmpty) {
      for (Location location in store.locations!) {
        if (location.subZoneId == zoneId) {
          isInSameZone = true;
          break;
        }
      }
    }
    return isInSameZone;
  }
}
