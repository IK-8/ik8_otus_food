import '../../data/models/local/gallery_image.dart';

abstract class GalleryRepository {
  Future<List<GalleryImage>> byRecipe(dynamic id);

  Future<List<GalleryImage>> addToRecipe(dynamic id, GalleryImage image);
}
