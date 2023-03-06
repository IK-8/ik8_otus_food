import 'package:flutter/foundation.dart';
import 'package:ik8_otus_food/src/data/models/local/detected_object.dart';
import 'package:ik8_otus_food/src/data/models/local/gallery_image.dart';
import '../../../core/bloc/bloc.dart';
import '../../../domain/usecase/gallery/create.dart';
import '../../../domain/usecase/gallery/get.dart';

class GalleryListByRecipeCubit extends RequestStateCubit<List<GalleryImage>> {
  final dynamic recipeId;

  final SaveImageByRecipeUseCase _save;
  final GetImageByRecipeUseCase _get;

  GalleryListByRecipeCubit(this._save, this._get, {required this.recipeId});

  void pull() async {
    emit(state.setLoading());
    _get.call(
      id: recipeId,
      onResponse: (list) {
        emit(state.setFull(list));
      },
    );
  }

  void save({
    required Uint8List data,
    required List<DetectedObject> detected,
  }) async {
    emit(state.setLoading());
    _save.call(
      id: recipeId,
      image: GalleryImage(
        recipeId: recipeId,
        data: data,
        detected: detected,
      ),
      onResponse: (list) {
        emit(state.setFull(list));
      },
    );
  }
}
