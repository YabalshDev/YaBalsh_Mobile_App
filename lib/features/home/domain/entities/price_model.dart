import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
part 'price_model.g.dart';

@HiveType(typeId: 6)
class PriceModel extends Equatable {
  @HiveField(20)
  final int? storeId;
  @HiveField(16)
  final String? storeImagePath;
  @HiveField(5)
  final bool? isAvailable;
  @HiveField(15)
  final double? price;

  const PriceModel(
      {this.storeId = 0,
      this.storeImagePath = '',
      this.isAvailable = false,
      this.price = 0});

  factory PriceModel.fromJson(Map<String, dynamic> json) => PriceModel(
      isAvailable: json['isAvailable'] ?? false,
      price: json['price'].toDouble() ?? 0,
      storeId: json['storeId'] ?? 0,
      storeImagePath: json['cardImagePath'] ?? '');

  @override
  List<Object?> get props => [storeId, storeImagePath, isAvailable, price];
}
