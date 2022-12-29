import 'package:get_it/get_it.dart';
import 'package:ik8_otus_food/src/data/datasources/assets/recipe.dart';
import 'package:ik8_otus_food/src/data/datasources/assets/steps.dart';
import 'package:ik8_otus_food/src/data/repositories/assets/recipe_repository.dart';
import 'package:ik8_otus_food/src/domain/repositories/recipe_repository.dart';
import 'package:ik8_otus_food/src/domain/usecase/recipe/all.dart';
import 'package:ik8_otus_food/src/domain/usecase/recipe_steps/by_recipe.dart';

import '../domain/entities/recipe.dart';
import '../domain/usecase/recipe/info.dart';
import '../domain/usecase/recipe_steps/set_checked_step.dart';
import '../domain/usecase/recipe/set_favorite.dart';
import '../domain/usecase/recipe/start.dart';
import '../presentations/blocs/recipe/info.dart';

Future<void> initializeRecipe(GetIt injector) async {
  try {
    injector.registerSingleton(AssetRecipeStepService());
    injector.registerSingleton(AssetRecipeService(injector()));
    injector.registerSingleton<RecipeRepository>(
        RecipeRepositoryImpl(injector(), injector()));

    injector.registerSingleton(GetAllRecipeUseCase(injector()));
    injector.registerSingleton(GetRecipeInfoUseCase(injector()));
    injector.registerSingleton(SetCheckedRecipeStepUseCase(injector()));
    injector.registerSingleton(SetFavoriteRecipeUseCase(injector()));
    injector.registerSingleton(StartRecipeUseCase(injector()));
    injector.registerSingleton(GetAllRecipeStepUseCase(injector()));

    injector.registerFactoryParam((Recipe data, _) => RecipeInfoCubit(
        injector(), injector(), injector(), injector(),
        data: data));
  } catch (_) {}
}
