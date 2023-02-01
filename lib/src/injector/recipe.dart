import 'package:get_it/get_it.dart';
import 'package:ik8_otus_food/src/data/datasources/assets/recipe.dart';
import 'package:ik8_otus_food/src/data/datasources/assets/steps.dart';
import 'package:ik8_otus_food/src/data/repositories/assets/recipe_repository.dart';
import 'package:ik8_otus_food/src/domain/repositories/recipe_repository.dart';
import 'package:ik8_otus_food/src/domain/usecase/recipe/get_all_recipe.dart';
import 'package:ik8_otus_food/src/domain/usecase/recipe/subscribe_recipe_list.dart';
import 'package:ik8_otus_food/src/domain/usecase/recipe_steps/get_all_recipe_step.dart';

import '../core/service/recipe/recipe_timer_service.dart';
import '../domain/entities/recipe.dart';
import '../domain/usecase/recipe/get_recipe_info.dart';
import '../domain/usecase/recipe/subscribe_recipe_timer.dart';
import '../domain/usecase/recipe_steps/set_checked_step.dart';
import '../domain/usecase/recipe/set_favorite_recipe.dart';
import '../domain/usecase/recipe/start_recipe.dart';
import '../presentations/blocs/recipe/recipe_info_cubit.dart';
import '../presentations/blocs/recipe/recipe_list_cubit.dart';
import '../presentations/blocs/recipe/recipe_timer_cubit.dart';

Future<void> initializeRecipe(GetIt injector) async {
  try {
    injector.registerSingleton(AssetRecipeStepService());
    injector.registerSingleton(RecipeTimerService());
    injector.registerSingleton(AssetRecipeService(injector()));
    injector.registerSingleton<RecipeRepository>(
        RecipeRepositoryImpl(injector(), injector(), injector()));

    injector.registerSingleton(SubscribeRecipeListUseCase(injector()));
    injector.registerSingleton(GetAllRecipeUseCase(injector()));
    injector.registerSingleton(GetRecipeInfoUseCase(injector()));
    injector.registerSingleton(SetCheckedRecipeStepUseCase(injector()));
    injector.registerSingleton(SetFavoriteRecipeUseCase(injector()));
    injector.registerSingleton(StartRecipeUseCase(injector()));
    injector.registerSingleton(SubscribeRecipeTimerUseCase(injector()));
    injector.registerSingleton(GetAllRecipeStepUseCase(injector()));

    injector.registerFactory(() => RecipeListCubit(injector()));
    injector.registerFactoryParam((int id, _) => RecipeTimerCubit(injector(), id: id,));
    injector.registerFactoryParam((Recipe data, _) => RecipeInfoCubit(
        injector(), injector(), injector(), injector(),
        data: data));
  } catch (_) {}
}
