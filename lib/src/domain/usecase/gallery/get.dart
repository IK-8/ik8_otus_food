import 'package:ik8_otus_food/src/data/models/local/gallery_image.dart';
import 'package:ik8_otus_food/src/domain/repositories/gallery_repository.dart';

class GetImageByRecipeUseCase {
  final GalleryRepository _repository;

  GetImageByRecipeUseCase(this._repository);

  void call({
    required dynamic id,
    required Function(List<GalleryImage> list) onResponse,
  }) async {
    _repository.byRecipe(id).then((value) => onResponse(value));
  }
}
