import 'package:yabalash_mobile_app/features/cart/domain/entities/supermarket_card_model.dart';

class OrderService {
  SuperMarketCardModel? _superMarketCardModel;
  SuperMarketCardModel? get superMarketCardModel => _superMarketCardModel;

  void setSelectedSuperMarket({required SuperMarketCardModel supermarket}) {
    _superMarketCardModel = supermarket;
  }
}
