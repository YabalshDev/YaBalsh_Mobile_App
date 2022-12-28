import 'package:equatable/equatable.dart';

class StorePrice extends Equatable {
  final double? price;
  final int? isAvailable;

  const StorePrice({this.price, this.isAvailable});

  StorePrice copyWith({double? price, int? isAvailable}) {
    return StorePrice(
        isAvailable: isAvailable ?? this.isAvailable,
        price: price ?? this.price);
  }

  @override
  List<Object?> get props => [price, isAvailable];
}
