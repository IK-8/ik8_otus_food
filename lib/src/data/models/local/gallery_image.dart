import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:ik8_otus_food/src/data/models/local/detected_object.dart';

part 'gallery_image.freezed.dart';
part 'gallery_image.g.dart';

@freezed
class GalleryImage with _$GalleryImage {

  @HiveType(typeId: 136)
  const factory GalleryImage({
    @HiveField(0) dynamic recipeId,
    @HiveField(1) String? description,
    @HiveField(2) required Uint8List data,
    @HiveField(3) required List<DetectedObject> detected,
  }) = _GalleryImage;

}
