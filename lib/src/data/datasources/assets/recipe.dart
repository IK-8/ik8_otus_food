import 'package:ik8_otus_food/src/data/models/assets/recipe.dart';
import 'package:ik8_otus_food/src/domain/entities/measure.dart';
import 'package:ik8_otus_food/src/domain/entities/recipe.dart';

import '../../models/assets/ingredient.dart';
import '../../models/assets/product.dart';
import '../../models/assets/step.dart';

class AssetRecipeService {
  static final _all = <AssetRecipe>[
    AssetRecipe(
        id: 0,
        image: 'assets/images/recipe_1.png',
        title: 'Лосось в соусе терияки',
        seconds: 45 * 60,
        ingredients: [
          AssetIngredient(
              count: 8,
              product: AssetProduct(
                  measure: const IngredientMeasure(Measure.tbs),
                  name: 'Соевый соус')),
          AssetIngredient(
              count: 8,
              product: AssetProduct(
                  measure: const IngredientMeasure(Measure.tbs), name: 'Вода')),
          AssetIngredient(
              count: 3,
              product: AssetProduct(
                  measure: const IngredientMeasure(Measure.tbs), name: 'Мёд')),
          AssetIngredient(
              count: 2,
              product: AssetProduct(
                  measure: const IngredientMeasure(Measure.tbs),
                  name: 'Коричневый сахар')),
          AssetIngredient(
              count: 3,
              product: AssetProduct(
                  measure: const IngredientMeasure(Measure.clove),
                  name: 'Чеснок')),
          AssetIngredient(
              count: 1,
              product: AssetProduct(
                  measure: const IngredientMeasure(Measure.tbs),
                  name: 'Тёртый свежий имбирь')),
          AssetIngredient(
              count: 1.5,
              product: AssetProduct(
                  measure: const IngredientMeasure(Measure.tbs),
                  name: 'Лимонный сок')),
          AssetIngredient(
              count: 1,
              product: AssetProduct(
                  measure: const IngredientMeasure(Measure.tbs),
                  name: 'Кукурузный крахмал')),
          AssetIngredient(
              count: 1,
              product: AssetProduct(
                  measure: const IngredientMeasure(Measure.tsp),
                  name: 'Растительное масло')),
          AssetIngredient(
              count: 0.68,
              product: AssetProduct(
                  measure: const IngredientMeasure(Measure.wt),
                  name: 'Филе лосося или сёмги')),
          AssetIngredient(
              product: AssetProduct(
                  measure: const IngredientMeasure(null), name: 'Кунжут')),
        ],
        steps: [
          const AssetRecipeStep(
            id: 0,
            title:
                'В маленькой кастрюле соедините соевый соус, 6 столовых ложек воды, мёд, сахар, измельчённый чеснок, имбирь и лимонный сок.',
            seconds: 60 * 6,
          ),
          const AssetRecipeStep(
            id: 1,
            title:
                'Поставьте на средний огонь и, помешивая, доведите до лёгкого кипения.',
            seconds: 60 * 7,
          ),
          const AssetRecipeStep(
            id: 2,
            title:
                'Смешайте оставшуюся воду с крахмалом. Добавьте в кастрюлю и перемешайте.',
            seconds: 60 * 6,
          ),
          const AssetRecipeStep(
            id: 3,
            title:
                'Готовьте, непрерывно помешивая венчиком, 1 минуту. Снимите с огня и немного остудите.',
            seconds: 60 * 1,
          ),
          const AssetRecipeStep(
            id: 4,
            title:
                'Смажьте форму маслом и выложите туда рыбу. Полейте её соусом.',
            seconds: 60 * 6,
          ),
          const AssetRecipeStep(
            id: 5,
            title:
                'Поставьте в разогретую до 200 °C духовку примерно на 15 минут.',
            seconds: 60 * 15,
          ),
          const AssetRecipeStep(
            id: 6,
            title: 'Перед подачей полейте соусом из формы и посыпьте кунжутом.',
            seconds: 60 * 4,
          ),
        ]),
    const AssetRecipe(
      id: 1,
      image: 'assets/images/recipe_2.png',
      title: 'Поке боул с сыром тофу',
      seconds: 30 * 60,
    ),
    const AssetRecipe(
      id: 2,
      image: 'assets/images/recipe_3.png',
      title: 'Стейк из говядины по-грузински с кукурузой',
      seconds: (60 + 60 + 15) * 60,
    ),
    const AssetRecipe(
      id: 3,
      image: 'assets/images/recipe_4.png',
      title: 'Тосты с голубикой и бананом',
      seconds: 45 * 60,
    ),
    const AssetRecipe(
      id: 4,
      image: 'assets/images/recipe_5.png',
      title: 'Паста с морепродуктами',
      seconds: 25 * 60,
    ),
    const AssetRecipe(
      id: 5,
      image: 'assets/images/recipe_6.png',
      title: 'Бургер с двумя котлетами',
      seconds: 60 * 60,
    ),
    const AssetRecipe(
      id: 6,
      image: 'assets/images/recipe_7.png',
      title: 'Пицца Маргарита домашняя',
      seconds: 25 * 60,
    ),
  ];

  List<AssetRecipe> get all => _all;

  void setFavorite(int id,
      {required bool isFavorite,
      required Function(AssetRecipe recipe) onChange}) {
    final find = _all.firstWhere((element) => element.id == id);
    final index = _all.indexOf(find);
    final copy = find.copyWith(isFavorite: isFavorite);
    _all[index] = copy;
    onChange(copy);
  }

  void start(int id,
      {required bool isStarted, required Function(Recipe recipe) onChange}) {
    final find = _all.firstWhere((element) => element.id == id);
    final index = _all.indexOf(find);
    final copy = find.copyWith(isStarted: isStarted);
    _all[index] = copy;
    onChange(copy);
  }
}
