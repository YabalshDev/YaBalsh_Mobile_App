// ignore_for_file: unused_field, prefer_final_fields

import '../../features/home/domain/entities/store.dart';

abstract class StoreService {
  List<Store> _nearStores = [];
  List<Store> get nearStores;
  void setNearStores(List<Store> stores);
}

class StoreServiceImpl implements StoreService {
  @override
  List<Store> get nearStores => _nearStores;

  @override
  void setNearStores(List<Store> stores) => _nearStores = stores;

  @override
  List<Store> _nearStores = [];
}
