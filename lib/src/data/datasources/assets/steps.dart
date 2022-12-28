import '../../models/assets/step.dart';

class AssetRecipeStepService {
  static final _all = <AssetRecipeStep>[
    const AssetRecipeStep(
      id: 0,
      recipeId: 0,
      title:
          'В маленькой кастрюле соедините соевый соус, 6 столовых ложек воды, мёд, сахар, измельчённый чеснок, имбирь и лимонный сок.',
      seconds: 60 * 6,
    ),
    const AssetRecipeStep(
      id: 1,
      recipeId: 0,
      title:
          'Поставьте на средний огонь и, помешивая, доведите до лёгкого кипения.',
      seconds: 60 * 7,
    ),
    const AssetRecipeStep(
      id: 2,
      recipeId: 0,
      title:
          'Смешайте оставшуюся воду с крахмалом. Добавьте в кастрюлю и перемешайте.',
      seconds: 60 * 6,
    ),
    const AssetRecipeStep(
      id: 3,
      recipeId: 0,
      title:
          'Готовьте, непрерывно помешивая венчиком, 1 минуту. Снимите с огня и немного остудите.',
      seconds: 60 * 1,
    ),
    const AssetRecipeStep(
      id: 4,
      recipeId: 0,
      title: 'Смажьте форму маслом и выложите туда рыбу. Полейте её соусом.',
      seconds: 60 * 6,
    ),
    const AssetRecipeStep(
      id: 5,
      recipeId: 0,
      title: 'Поставьте в разогретую до 200 °C духовку примерно на 15 минут.',
      seconds: 60 * 15,
    ),
    const AssetRecipeStep(
      id: 6,
      recipeId: 0,
      title: 'Перед подачей полейте соусом из формы и посыпьте кунжутом.',
      seconds: 60 * 4,
    ),
  ];

  static AssetRecipeStep _byId(int id) =>
      _all.firstWhere((element) => element.id == id);

  void setCheckedByRecipe(int recipeId, bool isChecked) {
    for (var i = 0; i < _all.length; i++) {
      var item = _all[i];
      if (item.recipeId == recipeId) {
        _all[i] = item.copyWith(isChecked: isChecked);
      }
    }
  }

  void setChecked(int id, bool isChecked) {
    for (var i = 0; i < _all.length; i++) {
      var item = _all[i];
      if (item.id == id) {
        _all[i] = item.copyWith(isChecked: isChecked);
        return;
      }
    }
  }

  List<AssetRecipeStep> byRecipe(int recipeId) =>
      _all.where((element) => element.recipeId == recipeId).toList();
}
