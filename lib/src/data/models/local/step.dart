import 'package:hive/hive.dart';
import 'package:ik8_otus_food/src/domain/entities/step.dart';

part 'step.g.dart';

@HiveType(typeId: 4)
class LocalRecipeStep extends RecipeStep {
  @HiveField(0)
  @override
  dynamic id;
  @HiveField(1)
  @override
  dynamic recipeId;
  @HiveField(2)
  @override
  String title;
  @HiveField(3)
  @override
  int seconds;
  @HiveField(4)
  @override
  bool isChecked;

  LocalRecipeStep({
    required this.id,
    required this.recipeId,
    required this.title,
    required this.seconds,
    this.isChecked = false,
  });

  @override
  LocalRecipeStep copyWith({bool? isChecked}) {
    return LocalRecipeStep(
      id: id,
      recipeId: recipeId,
      title: title,
      seconds: seconds,
      isChecked: isChecked ?? this.isChecked,
    );
  }
}
