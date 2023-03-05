import 'package:get_it/get_it.dart';

import '../presentations/blocs/recipe_gallery/create_recipe_shot.dart';

Future<void> initializeGalleryDependencies(GetIt injector) async {
  injector.registerFactoryParam((dynamic id, _) => CreateRecipeShotCubit(id));
}
