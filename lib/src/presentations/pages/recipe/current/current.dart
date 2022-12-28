import 'package:flutter/material.dart';
import 'package:ik8_otus_food/src/domain/entities/recipe.dart';
import 'package:ik8_otus_food/src/injector.dart';
import 'package:ik8_otus_food/src/presentations/widgets/recipe_step/item.dart';
import '../../../../../l10n/extension.dart';
import '../../../../domain/entities/recipe_info.dart';
import '../../../../domain/usecase/recipe/create_comment.dart';
import '../../../../domain/usecase/recipe/info.dart';
import '../../../../domain/usecase/recipe/set_checked_step.dart';
import '../../../../domain/usecase/recipe/set_favorite.dart';
import '../../../../domain/usecase/recipe/start.dart';
import '../../../widgets/ingredient/table.dart';
import '../../../widgets/widgets.dart';
import 'comment_field.dart';

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
  late RecipeInfo data = getInfo();

  RecipeInfo getInfo() {
    return injector<GetRecipeInfoUseCase>().call(widget.data.id);
  }

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

  onCheckedStep(int stepId, bool isChecked) {
    injector<SetCheckedRecipeStepUseCase>().call(
        id: stepId,
        recipeId: data.id,
        isChecked: isChecked,
        onChange: (data) {
          setState(() {
            this.data = data;
          });
        });
  }

  createComment(String text) {
    injector<CreateRecipeCommentUseCase>().call(
        recipeId: data.id,
        text: text,
        onChange: (data) {
          setState(() {
            this.data = data;
          });
        });
  }

  bool setFocused = false;
  //
  // @override
  // void initState() {
  //   super.initState();
  //   commentFocus.addListener(() {
  //     if (commentFocus.hasFocus) {
  //       setFocused = true;
  //     } else if (setFocused) {
  //       setFocused = false;
  //     }
  //   });
  // }

  GlobalKey commentFieldKey = GlobalKey();
  final commentController = TextEditingController();
  // final commentFocus = FocusNode();
  // var scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    var bottom = MediaQuery.of(context).viewInsets.bottom;
    final keyboardIsOpened = bottom != 0.0;
    return Scaffold(
      appBar: AppBar(
        leading: !keyboardIsOpened
            ? null
            : IconButton(
                onPressed: () {
                  FocusScopeNode currentFocus = FocusScope.of(context);
                  if (!currentFocus.hasPrimaryFocus) {
                    currentFocus.unfocus();
                  }
                },
                icon: const Icon(Icons.done),
              ),
        title: const Text('Рецепт'),
      ),
      body: Column(
        children: [
          Expanded(
              child: ListView(
            // physics: const ClampingScrollPhysics(),
            // controller: scrollController,

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
                    value: data.recipe.isFavorite,
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
              if (data.recipe.ingredients.isNotEmpty) ...[
                Text(
                  AppLocalizations.of(context)!.ingredientsTitle,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: IngredientTable(
                    list: data.recipe.ingredients,
                  ),
                )
              ],
              if (data.steps.isNotEmpty) ...[
                Text(
                  AppLocalizations.of(context)!.cookingStepsTitle,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(
                  height: 16,
                ),
                for (int i = 0; i < data.steps.length; i++)
                  RecipeStepItem(
                    index: i + 1,
                    enabled: data.recipe.isStarted,
                    onSelect: (isSelect) {
                      onCheckedStep(data.steps[i].id, isSelect);
                    },
                    item: data.steps[i],
                  ),
              ],
              Center(
                child: ToggleOutlineFilledButton(
                  outlinedLabel: 'Закончить готовить',
                  filledLabel: 'Начать готовить',
                  outlined: data.recipe.isStarted,
                  onPressed: (bool value) {
                    onStart(value);
                  },
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              const Divider(
                color: Color(0xff797676),
              ),
              for (var comment in data.comments)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppLocalizations.of(context)!
                            .ddMMyyFormat(comment.time),
                        style: const TextStyle(
                            color: Color(0xffC2C2C2),
                            fontSize: 16,
                            fontWeight: FontWeight.w400),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        comment.text,
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ),
              const SizedBox(
                height: 16,
              ),
              if (!keyboardIsOpened)
                CommentField(
                  key: commentFieldKey,
                  controller: commentController,
                  create: createComment,
                ),
            ],
          )),
          if (keyboardIsOpened)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CommentField(
                key: commentFieldKey,
                controller: commentController,
                create: createComment,
              ),
            ),
        ],
      ),
    );
  }

}
