// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detected_object.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DetectedObjectAdapter extends TypeAdapter<_$_DetectedObject> {
  @override
  final int typeId = 135;

  @override
  _$_DetectedObject read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$_DetectedObject(
      name: fields[0] as String,
      confidence: fields[1] as double,
      width: fields[2] as double,
      height: fields[3] as double,
      x: fields[4] as double,
      y: fields[5] as double,
    );
  }

  @override
  void write(BinaryWriter writer, _$_DetectedObject obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.confidence)
      ..writeByte(2)
      ..write(obj.width)
      ..writeByte(3)
      ..write(obj.height)
      ..writeByte(4)
      ..write(obj.x)
      ..writeByte(5)
      ..write(obj.y);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DetectedObjectAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
