// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'step.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LocalRecipeStepAdapter extends TypeAdapter<LocalRecipeStep> {
  @override
  final int typeId = 4;

  @override
  LocalRecipeStep read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LocalRecipeStep(
      id: fields[0] as dynamic,
      recipeId: fields[1] as dynamic,
      title: fields[2] as String,
      seconds: fields[3] as int,
      isChecked: fields[4] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, LocalRecipeStep obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.recipeId)
      ..writeByte(2)
      ..write(obj.title)
      ..writeByte(3)
      ..write(obj.seconds)
      ..writeByte(4)
      ..write(obj.isChecked);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LocalRecipeStepAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
