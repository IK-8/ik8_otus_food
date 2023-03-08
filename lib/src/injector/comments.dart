import 'package:get_it/get_it.dart';
import 'package:ik8_otus_food/src/data/datasources/assets/comments.dart';
import 'package:ik8_otus_food/src/domain/repositories/comment_repository.dart';
import '../data/repositories/recipe_comment_repository.dart';
import '../domain/usecase/recipe_comments/get_all_comments_by_recipe.dart';
import '../domain/usecase/recipe_comments/create_recipe_comment.dart';
import '../presentations/blocs/recipe/recipe_comments_cubit.dart';

Future<void> initializeRecipeComments(GetIt injector) async {
  try {
    injector.registerSingleton(AssetRecipeCommentsService());
    injector.registerSingleton<CommentRepository>(
        CommentRepositoryImpl(injector()));

    injector.registerSingleton(GetAllCommentsByRecipeUseCase(injector()));
    injector.registerSingleton(CreateRecipeCommentUseCase(injector()));

    injector.registerFactoryParam((dynamic recipeId, _) =>
        RecipeCommentsCubit(injector(), injector(), recipeId: recipeId));
  } catch (_) {

    print(_);
  }
}
