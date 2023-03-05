import 'dart:io';
import 'dart:ui';

import 'package:image/image.dart' as img;
import 'package:flutter_tflite/flutter_tflite.dart';
import 'package:image_picker/image_picker.dart';

// import 'package:tflite/tflite.dart';
// import 'package:flutter_tflite/flutter_tflite.dart';
// import 'package:tflite_flutter_helper/tflite_flutter_helper.dart';
import '../../../core/bloc/bloc.dart';
// import 'package:tflite_flutter/tflite_flutter.dart';

class RecipeShotData {
  final XFile? image;
  final List<DetectedClass>? detection;

  RecipeShotData({this.image, this.detection});
}

class CreateRecipeShotCubit extends RequestStateCubit<RecipeShotData> {
  final _imagePicker = ImagePicker();
  final dynamic recipeId;

  CreateRecipeShotCubit(this.recipeId);

  Future<RecipeShotData?> createShot({
    ImageSource source = ImageSource.camera,
  }) async {
    final picked =
        await _imagePicker.pickImage(source: source, imageQuality: 100);
    if (picked != null) {
      final data = RecipeShotData(
        image: picked,
      );

      emit(
        state.copyWith(data: data),
      );
      _detect(picked);
      return data;
    }
    return null;
  }

  Future<void> _detect(XFile file) async {
    String? res = await Tflite.loadModel(
      model: "assets/tflite/detect.tflite",
      labels: "assets/tflite/labelmap.txt",
      numThreads: 1,
    );
    var recognitions = await Tflite.detectObjectOnImage(
      path: file.path,
      numResultsPerClass: 5,
    );
    print(recognitions);
    List<DetectedClass> detection = [];
    for (var item in recognitions ?? []) {
      final detected = DetectedClass.fromJson(item);
      if (detected.confidence >= 0.5) {
        detection.add(detected);
      }
    }
    if (state.data?.image == file) {
      emit(
        state.copyWith(
          data: RecipeShotData(
            image: file,
            detection: detection,
          ),
        ),
      );
    }
    var a = 2;
  }
}

//   {
//     rect:
//     {
//       w:
//       0.9605958461761475
// , x: 0.010876059532165527,
// h: 0.7227427959442139,
// y: 0.22690117359161377},
// confidenceInClass: 0.62109375,
// detectedClass: dining table}
class DetectedClass {
  final String name;
  final double confidence;
  final double width, height;
  final double x, y;

  const DetectedClass(
    this.name,
    this.confidence, {
    required this.width,
    required this.height,
    required this.x,
    required this.y,
  });

  factory DetectedClass.fromJson(Map<dynamic, dynamic> json) {
    return DetectedClass(
      json['detectedClass'],
      json['confidenceInClass'],
      width: json['rect']['w'],
      height: json['rect']['h'],
      x: json['rect']['x'],
      y: json['rect']['y'],
    );
  }
}
