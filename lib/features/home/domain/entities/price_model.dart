import 'package:equatable/equatable.dart';

class PriceModel extends Equatable {
  final String? storeId;
  final String? storeImagePath;
  final bool? isAvailable;
  final double? price;

  const PriceModel(
      {this.storeId = '',
      this.storeImagePath = '',
      this.isAvailable = false,
      this.price = 0});

  @override
  List<Object?> get props => [storeId, storeImagePath, isAvailable, price];
}
