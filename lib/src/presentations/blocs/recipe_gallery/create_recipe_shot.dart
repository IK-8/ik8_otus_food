import 'package:ik8_otus_food/src/data/models/local/detected_object.dart';
import 'package:flutter_tflite/flutter_tflite.dart';
import 'package:image_picker/image_picker.dart';
import '../../../core/bloc/bloc.dart';

class RecipeShotData {
  final XFile? image;
  final List<DetectedObject>? detection;

  RecipeShotData({this.image, this.detection});
}

class CreateRecipeShotCubit extends RequestStateCubit<RecipeShotData> {
  final _imagePicker = ImagePicker();
  final dynamic recipeId;

  CreateRecipeShotCubit(this.recipeId);

  void clear() {
    emit(const RequestStateInfo());
  }

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
    await Tflite.loadModel(
      model: "assets/tflite/detect.tflite",
      labels: "assets/tflite/labelmap.txt",
      numThreads: 1,
    );
    var recognitions = await Tflite.detectObjectOnImage(
      path: file.path,
      numResultsPerClass: 5,
    );
    List<DetectedObject> detection = [];
    for (var item in recognitions ?? []) {
      final detected = DetectedObject.fromJson(item);
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
  }
}