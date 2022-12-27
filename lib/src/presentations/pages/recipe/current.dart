import 'package:flutter/material.dart';
import 'package:ik8_otus_food/src/domain/entities/recipe.dart';
import 'package:ik8_otus_food/src/injector.dart';
import 'package:ik8_otus_food/src/presentations/widgets/recipe_step/item.dart';
import '../../../domain/usecase/recipe/set_favorite.dart';
import '../../../domain/usecase/recipe/start.dart';
import '../../widgets/ingredient/table.dart';
import '../../widgets/widgets.dart';

class CurrentRecipePage extends StatefulWidget {
  final Recipe data;

  const CurrentRecipePage(this.data, {Key? key}) : super(key: key);

  static Route route(Recipe data) {
    return MaterialPageRoute(builder: (_) => CurrentRecipePage(data));
  }

  @override
  State<CurrentRecipePage> createState() => _CurrentRecipePageState();
}

class _CurrentRecipePageState extends State<CurrentRecipePage> {
  late Recipe data = widget.data;

  onChangeFavorite(bool isFavorite) {
    injector<SetFavoriteRecipeUseCase>().call(
        id: data.id,
        isFavorite: isFavorite,
        onChange: (data) {
          setState(() {
            this.data = data;
          });
        });
  }

  onStart(bool isStarted) {
    injector<StartRecipeUseCase>().call(
        id: data.id,
        isStarted: isStarted,
        onChange: (data) {
          setState(() {
            this.data = data;
          });
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Рецепт'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                fit: FlexFit.tight,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 16.0, top: 8),
                      child: Text(widget.data.title,
                          style: const TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 24)),
                    ),
                    DurationView(widget.data.seconds),
                  ],
                ),
              ),
              FavoriteButton(
                onChanged: onChangeFavorite,
                value: data.isFavorite,
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: AspectRatio(
                aspectRatio: 2,
                child: Image.asset(
                  widget.data.image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          if (data.ingredients.isNotEmpty) ...[
            Text(
              'Ингредиенты',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: IngredientTable(
                list: data.ingredients,
              ),
            )
          ],
          if (data.steps.isNotEmpty) ...[
            Text(
              'Шаги приготовления',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(
              height: 16,
            ),
            for (int i = 0; i < data.steps.length; i++)
              RecipeStepItem(
                index: i + 1,
                enabled: data.isStarted,
                onSelect: (isSelect) {
                  // setState(() {
                  //   if (isSelect) {
                  //     stepList[i] = selected;
                  //   } else {
                  //     stepList[i] = unselected;
                  //   }
                  // });
                },
                item: data.steps[i],
              ),
          ],
          Center(
            child: ToggleOutlineFilledButton(
              outlinedLabel: 'Закончить готовить',
              filledLabel: 'Начать готовить',
              outlined: data.isStarted,
              onPressed: (bool value) {
                onStart(value);
              },
            ),
          )
        ],
      ),
    );
  }

}
