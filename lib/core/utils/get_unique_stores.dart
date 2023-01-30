import '../../features/home/domain/entities/store.dart';

List<Store> getUniqueStores(List<Store> stores) {
  var seen = <int>{};

  List<Store> uniqueStores =
      stores.where((element) => seen.add(element.id!)).toList();

  return uniqueStores;
}
