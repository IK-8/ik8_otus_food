import 'package:ik8_otus_food/src/data/models/assets/recipe.dart';

class AssetRecipeService {
  static const _all = <AssetRecipe>[
    AssetRecipe(
      'assets/images/recipe_1.png',
      'Лосось в соусе терияки',
      45 * 60,
    ),
    AssetRecipe(
      'assets/images/recipe_2.png',
      'Поке боул с сыром тофу',
      30 * 60,
    ),
    AssetRecipe(
      'assets/images/recipe_3.png',
      'Стейк из говядины по-грузински с кукурузой',
      (60 +60 + 15) * 60,
    ),
    AssetRecipe(
      'assets/images/recipe_4.png',
      'Тосты с голубикой и бананом',
      45 * 60,
    ),
    AssetRecipe(
      'assets/images/recipe_5.png',
      'Паста с морепродуктами',
      25 * 60,
    ),
    AssetRecipe(
      'assets/images/recipe_6.png',
      'Бургер с двумя котлетами',
      60 * 60,
    ),
    AssetRecipe(
      'assets/images/recipe_7.png',
      'Пицца Маргарита домашняя',
      25 * 60,
    ),
  ];

  List<AssetRecipe> get all => _all;
}
