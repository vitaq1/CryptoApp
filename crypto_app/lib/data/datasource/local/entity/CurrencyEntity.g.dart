// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'CurrencyEntity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CurrencyEntityAdapter extends TypeAdapter<CurrencyEntity> {
  @override
  final int typeId = 0;

  @override
  CurrencyEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CurrencyEntity()
      ..code = fields[0] as String
      ..name = fields[1] as String
      ..color = fields[2] as String
      ..sortIndex = fields[3] as int
      ..exchangeRates = (fields[4] as List).cast<double>()
      ..amount = fields[5] as double;
  }

  @override
  void write(BinaryWriter writer, CurrencyEntity obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.code)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.color)
      ..writeByte(3)
      ..write(obj.sortIndex)
      ..writeByte(4)
      ..write(obj.exchangeRates)
      ..writeByte(5)
      ..write(obj.amount);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CurrencyEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
