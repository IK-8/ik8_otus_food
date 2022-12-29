import 'package:get_it/get_it.dart';

import 'injector/comments.dart';
import 'injector/recipe.dart';

final injector = GetIt.instance;

Future<void> initializeDependencies() async {
  try {
    await initializeRecipe(injector);
    await initializeRecipeComments(injector);
  } catch (_) {}
}
