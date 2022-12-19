import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
part 'price_model.g.dart';

@HiveType(typeId: 6)
class PriceModel extends Equatable {
  @HiveField(12)
  final String? storeId;
  @HiveField(13)
  final String? storeImagePath;
  @HiveField(14)
  final bool? isAvailable;
  @HiveField(15)
  final double? price;

  const PriceModel(
      {this.storeId = '',
      this.storeImagePath = '',
      this.isAvailable = false,
      this.price = 0});

  @override
  List<Object?> get props => [storeId, storeImagePath, isAvailable, price];
}
