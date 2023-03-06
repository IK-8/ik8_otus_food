// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gallery_image.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class GalleryImageAdapter extends TypeAdapter<_$_GalleryImage> {
  @override
  final int typeId = 136;

  @override
  _$_GalleryImage read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$_GalleryImage(
      recipeId: fields[0] as dynamic,
      description: fields[1] as String?,
      data: fields[2] as Uint8List,
      detected: (fields[3] as List).cast<DetectedObject>(),
    );
  }

  @override
  void write(BinaryWriter writer, _$_GalleryImage obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.recipeId)
      ..writeByte(1)
      ..write(obj.description)
      ..writeByte(2)
      ..write(obj.data)
      ..writeByte(3)
      ..write(obj.detected);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GalleryImageAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
