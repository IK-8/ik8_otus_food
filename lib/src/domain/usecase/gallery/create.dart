import 'package:ik8_otus_food/src/data/models/local/gallery_image.dart';
import 'package:ik8_otus_food/src/domain/repositories/gallery_repository.dart';

class SaveImageByRecipeUseCase {
  final GalleryRepository _repository;

  SaveImageByRecipeUseCase(this._repository);

  void call({
    required dynamic id,
    required GalleryImage image,
    required Function(List<GalleryImage> list) onResponse,
  }) async {
    _repository.addToRecipe(id, image).then((value) => onResponse(value));
  }
}
