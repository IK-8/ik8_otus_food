// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LocalRecipeAdapter extends TypeAdapter<LocalRecipe> {
  @override
  final int typeId = 131;

  @override
  LocalRecipe read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LocalRecipe(
      id: fields[0] as dynamic,
      image: fields[1] as String,
      title: fields[2] as String,
      seconds: fields[3] as int,
      ingredients: (fields[6] as List).cast<LocalRecipeIngredient>(),
      isStarted: fields[5] as bool,
      isFavorite: fields[4] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, LocalRecipe obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.image)
      ..writeByte(2)
      ..write(obj.title)
      ..writeByte(3)
      ..write(obj.seconds)
      ..writeByte(4)
      ..write(obj.isFavorite)
      ..writeByte(5)
      ..write(obj.isStarted)
      ..writeByte(6)
      ..write(obj.ingredients);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LocalRecipeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
