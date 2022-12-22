import 'package:get_it/get_it.dart';

import 'injector/recipe.dart';

final injector = GetIt.instance;

Future<void> initializeDependencies() async {
  try {
    await initializeRecipe(injector);
  } catch (_) {}
}
