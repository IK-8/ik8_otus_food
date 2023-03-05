import 'package:get_it/get_it.dart';

import 'injector/comments.dart';
import 'injector/core.dart';
import 'injector/gallery.dart';
import 'injector/recipe.dart';

final injector = GetIt.instance;

Future<void> initializeDependencies() async {
  try {
    await initializeCoreDependencies(injector);
    await initializeRecipe(injector);
    await initializeGalleryDependencies(injector);
    await initializeRecipeComments(injector);
  } catch (_) {}
}
