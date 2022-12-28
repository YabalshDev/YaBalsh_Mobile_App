// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProductAdapter extends TypeAdapter<Product> {
  @override
  final int typeId = 3;

  @override
  Product read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Product(
      id: fields[18] as int?,
      name: fields[9] as String?,
      imagePath: fields[10] as String?,
      size: fields[19] as String?,
      prices: (fields[13] as Map?)?.cast<String, PriceModel>(),
    );
  }

  @override
  void write(BinaryWriter writer, Product obj) {
    writer
      ..writeByte(5)
      ..writeByte(18)
      ..write(obj.id)
      ..writeByte(9)
      ..write(obj.name)
      ..writeByte(10)
      ..write(obj.imagePath)
      ..writeByte(19)
      ..write(obj.size)
      ..writeByte(13)
      ..write(obj.prices);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
