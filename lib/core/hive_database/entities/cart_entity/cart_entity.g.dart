// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CartEntityAdapter extends TypeAdapter<CartEntity> {
  @override
  final int typeId = 1;

  @override
  CartEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CartEntity(
      id: fields[0] as String?,
      imageUrl: fields[1] as String,
      productName: fields[2] as String,
      height: fields[3] as String,
      price: fields[4] as double,
      quantity: fields[5] as int,
    );
  }

  @override
  void write(BinaryWriter writer, CartEntity obj) {
    writer
      ..writeByte(6)
      ..writeByte(1)
      ..write(obj.imageUrl)
      ..writeByte(2)
      ..write(obj.productName)
      ..writeByte(3)
      ..write(obj.height)
      ..writeByte(4)
      ..write(obj.price)
      ..writeByte(5)
      ..write(obj.quantity)
      ..writeByte(0)
      ..write(obj.id);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CartEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
