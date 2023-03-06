import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:ik8_otus_food/src/data/datasources/local/gallery_service.dart';

import '../data/repositories/gallery_repository.dart';
import '../domain/repositories/gallery_repository.dart';
import '../domain/usecase/gallery/create.dart';
import '../domain/usecase/gallery/get.dart';
import '../presentations/blocs/recipe_gallery/create_recipe_shot.dart';
import '../presentations/blocs/recipe_gallery/gallery_by_recipe.dart';

Future<void> initializeGalleryDependencies(GetIt injector) async {
  injector.registerSingleton(GalleryService(await Hive.openLazyBox('gallery')));
  injector
      .registerSingleton<GalleryRepository>(GalleryRepositoryImpl(injector()));
  injector.registerSingleton(SaveImageByRecipeUseCase(injector()));
  injector.registerSingleton(GetImageByRecipeUseCase(injector()));
  injector.registerFactoryParam((dynamic id, _) => CreateRecipeShotCubit(id));
  injector.registerFactoryParam(
    (dynamic id, _) => GalleryListByRecipeCubit(
      injector(),
      injector(),
      recipeId: id,
    ),
  );
}
