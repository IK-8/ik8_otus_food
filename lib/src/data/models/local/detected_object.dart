import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'detected_object.freezed.dart';

part 'detected_object.g.dart';

@freezed
class DetectedObject with _$DetectedObject {
  const DetectedObject._();

  @HiveType(typeId: 135)
  const factory DetectedObject({
    @HiveField(0) required String name,
    @HiveField(1) required double confidence,
    @HiveField(2) required double width,
    @HiveField(3) required double height,
    @HiveField(4) required double x,
    @HiveField(5) required double y,
  }) = _DetectedObject;

  factory DetectedObject.fromJson(Map<dynamic, dynamic> json) {
    return DetectedObject(
      name: json['detectedClass'],
      confidence: json['confidenceInClass'],
      width: json['rect']['w'],
      height: json['rect']['h'],
      x: json['rect']['x'],
      y: json['rect']['y'],
    );
  }
}
