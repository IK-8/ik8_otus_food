import 'package:ik8_otus_food/src/data/datasources/local/gallery_service.dart';

import '../../data/models/local/gallery_image.dart';
import '../../domain/repositories/gallery_repository.dart';

class GalleryRepositoryImpl extends GalleryRepository {
  final GalleryService _service;

  GalleryRepositoryImpl(this._service);

  @override
  Future<List<GalleryImage>> byRecipe(dynamic id) {
    return _service.byRecipe(id);
  }

  @override
  Future<List<GalleryImage>> addToRecipe(dynamic id, GalleryImage image) {
    return _service.addToRecipe(id, image);
  }
}
