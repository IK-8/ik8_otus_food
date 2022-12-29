import 'package:get_it/get_it.dart';
import 'package:ik8_otus_food/src/data/datasources/assets/comments.dart';
import 'package:ik8_otus_food/src/domain/repositories/comment_repository.dart';
import '../data/repositories/assets/recipe_comment_repository.dart';
import '../domain/usecase/recipe_comments/by_recipe.dart';
import '../domain/usecase/recipe_comments/create_comment.dart';
import '../presentations/blocs/recipe/comments.dart';

Future<void> initializeRecipeComments(GetIt injector) async {
  try {
    injector.registerSingleton(AssetRecipeCommentsService());
    injector.registerSingleton<CommentRepository>(
        CommentRepositoryImpl(injector()));

    injector.registerSingleton(GetAllCommentsByRecipeUseCase(injector()));
    injector.registerSingleton(CreateRecipeCommentUseCase(injector()));

    injector.registerFactoryParam((int recipeId, _) =>
        RecipeCommentsCubit(injector(), injector(), recipeId: recipeId));
  } catch (_) {}
}
