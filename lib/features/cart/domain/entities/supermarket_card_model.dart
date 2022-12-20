import 'package:equatable/equatable.dart';

import '../../../home/domain/entities/store.dart';

class SuperMarketCardModel extends Equatable {
  final Store? store;
  final double? price;
  final double? saving;

  const SuperMarketCardModel({this.store, this.price, this.saving});
  @override
  // TODO: implement props
  List<Object?> get props => [store, saving, price];
}
