import 'package:ik8_otus_food/src/data/models/assets/comment.dart';

class AssetRecipeCommentsService {
  static var currentId = 0;
  static final _all = <AssetRecipeComment>[];

  static AssetRecipeComment _byId(int id) =>
      _all.firstWhere((element) => element.id == id);

  void create({required int recipeId, required String text}) {
    _all.add(AssetRecipeComment(
        id: currentId, recipeId: recipeId, text: text, time: DateTime.now()));
    currentId++;
  }

  List<AssetRecipeComment> byRecipe(int recipeId) =>
      _all.where((element) => element.recipeId == recipeId).toList();
}
