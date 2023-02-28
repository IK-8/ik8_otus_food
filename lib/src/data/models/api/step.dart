import 'package:ik8_otus_food/src/domain/entities/step.dart';

class RecipeStepModel extends RecipeStepData {
  RecipeStepModel({
    required super.id,
    required super.recipeId,
    required super.title,
    required super.seconds,
    super.isChecked,
  });

  @override
  RecipeStepModel copyWith({bool? isChecked}) {
    return RecipeStepModel(
      id: id,
      recipeId: recipeId,
      title: title,
      seconds: seconds,
      isChecked: isChecked ?? this.isChecked,
    );
  }

  static List<RecipeStepModel> fromRecipe(
      Map<String, dynamic> json, int localId) {
    List<RecipeStepModel> list = [];
    final recipeId = json['idMeal'];
    final values = (json['strInstructions'] as String? ?? '').split('\r\n');
    for (var value in values) {
      if (value.trim().isNotEmpty) {
        list.add(
          RecipeStepModel(
            id: ++localId,
            recipeId: recipeId,
            title: value,
            seconds: 60,
          ),
        );
      }
    }
    return list;
  }
}
