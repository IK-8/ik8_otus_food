import 'package:hive/hive.dart';
import 'package:ik8_otus_food/src/data/models/local/gallery_image.dart';

class GalleryService {
  final LazyBox _box;

  GalleryService(this._box);

  Future<List<GalleryImage>> byRecipe(dynamic id) async {
    var data = (await _box.get(id) as List<dynamic>?) ?? [];
    List<GalleryImage> list = [];

    for(var item in data){
      if(item is GalleryImage) {
        list.add(item);
      }
    }
    return list;
    // return data?.map((e) => e as GalleryImage).toList() ?? [];
  }

  Future<List<GalleryImage>> addToRecipe(dynamic id, GalleryImage image) async {
    final existed = (await byRecipe(id));
    final list = [...existed, image];
    _box.put(id, list);
    return list;
  }
}
