import '../../features/home/domain/entities/store.dart';

class StoreService {
  List<Store> _nearStores = [];
  List<Store> get nearStores => _nearStores;

  void setNearStores(List<Store> stores) => _nearStores = stores;
}
