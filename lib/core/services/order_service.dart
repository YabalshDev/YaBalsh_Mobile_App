// ignore_for_file: unused_field

import 'package:yabalash_mobile_app/features/cart/domain/entities/supermarket_card_model.dart';

abstract class OrderService {
  SuperMarketCardModel? _superMarketCardModel;
  SuperMarketCardModel? get superMarketCardModel;
  void setSelectedSuperMarket({required SuperMarketCardModel supermarket});
}

class OrderServiceImpl implements OrderService {
  @override
  SuperMarketCardModel? _superMarketCardModel;
  @override
  SuperMarketCardModel? get superMarketCardModel => _superMarketCardModel;

  @override
  void setSelectedSuperMarket({required SuperMarketCardModel supermarket}) {
    _superMarketCardModel = supermarket;
  }
}
