import 'package:ik8_otus_food/src/data/models/assets/recipe.dart';
import 'package:ik8_otus_food/src/domain/entities/step.dart';

class AssetRecipeService {
  static const _all = <AssetRecipe>[
    AssetRecipe(
      image: 'assets/images/recipe_1.png',
      title: 'Лосось в соусе терияки',
      seconds: 45 * 60,
      steps: []
    ),
    AssetRecipe(
      image: 'assets/images/recipe_2.png',
      title: 'Поке боул с сыром тофу',
      seconds: 30 * 60,
    ),
    AssetRecipe(
      image: 'assets/images/recipe_3.png',
      title: 'Стейк из говядины по-грузински с кукурузой',
      seconds: (60 + 60 + 15) * 60,
    ),
    AssetRecipe(
      image: 'assets/images/recipe_4.png',
      title: 'Тосты с голубикой и бананом',
      seconds: 45 * 60,
    ),
    AssetRecipe(
      image: 'assets/images/recipe_5.png',
      title: 'Паста с морепродуктами',
      seconds: 25 * 60,
    ),
    AssetRecipe(
      image: 'assets/images/recipe_6.png',
      title: 'Бургер с двумя котлетами',
      seconds: 60 * 60,
    ),
    AssetRecipe(
      image: 'assets/images/recipe_7.png',
      title: 'Пицца Маргарита домашняя',
      seconds: 25 * 60,
    ),
  ];

  List<AssetRecipe> get all => _all;
}
