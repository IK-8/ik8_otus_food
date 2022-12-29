import 'package:ik8_otus_food/src/data/models/assets/comment.dart';

class AssetRecipeCommentsService {
  static var currentId = 0;
  static final _all = <AssetRecipeComment>[];

  static AssetRecipeComment _byId(int id) =>
      _all.firstWhere((element) => element.id == id);

  void create(
      {required int recipeId,
      required String text,
      required Function(AssetRecipeComment created) onCreate}) {
    final created = AssetRecipeComment(
        id: currentId, recipeId: recipeId, text: text, time: DateTime.now());
    _all.add(created);
    currentId++;
    onCreate(created);
  }

  List<AssetRecipeComment> byRecipe(int recipeId) =>
      _all.where((element) => element.recipeId == recipeId).toList();
}
