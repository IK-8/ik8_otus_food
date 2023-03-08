// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ingredient.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LocalRecipeIngredientAdapter extends TypeAdapter<LocalRecipeIngredient> {
  @override
  final int typeId = 132;

  @override
  LocalRecipeIngredient read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LocalRecipeIngredient(
      count: fields[0] as double,
      productName: fields[1] as String,
      productMeasureType: fields[2] as Measure?,
      productMeasureTitle: fields[3] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, LocalRecipeIngredient obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.count)
      ..writeByte(1)
      ..write(obj.productName)
      ..writeByte(2)
      ..write(obj.productMeasureType)
      ..writeByte(3)
      ..write(obj.productMeasureTitle);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LocalRecipeIngredientAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
