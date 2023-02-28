// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'measure.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MeasureAdapter extends TypeAdapter<Measure> {
  @override
  final int typeId = 133;

  @override
  Measure read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return Measure.wt;
      case 1:
        return Measure.pcs;
      case 2:
        return Measure.tsp;
      case 3:
        return Measure.tbs;
      case 4:
        return Measure.clove;
      case 5:
        return Measure.cup;
      default:
        return Measure.wt;
    }
  }

  @override
  void write(BinaryWriter writer, Measure obj) {
    switch (obj) {
      case Measure.wt:
        writer.writeByte(0);
        break;
      case Measure.pcs:
        writer.writeByte(1);
        break;
      case Measure.tsp:
        writer.writeByte(2);
        break;
      case Measure.tbs:
        writer.writeByte(3);
        break;
      case Measure.clove:
        writer.writeByte(4);
        break;
      case Measure.cup:
        writer.writeByte(5);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MeasureAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
