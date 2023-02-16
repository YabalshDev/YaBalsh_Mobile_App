import '../../features/home/domain/entities/product.dart';

List<Product> filterPricedProducts(List<Product> products) {
  return products.where((element) => element.prices!.isNotEmpty).toList();
}
