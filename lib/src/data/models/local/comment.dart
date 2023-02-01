import 'package:hive/hive.dart';

import '../../../domain/entities/comment.dart';

class LocalRecipeComment extends RecipeComment with HiveObjectMixin {
  LocalRecipeComment(
      {required super.id,
      required super.recipeId,
      required super.text,
      required super.time});
}
