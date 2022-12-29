import 'package:flutter/material.dart';
import 'package:ik8_otus_food/src/core/bloc/bloc.dart';
import 'package:ik8_otus_food/src/core/extension/focus.dart';
import 'package:ik8_otus_food/src/domain/entities/recipe.dart';
import 'package:ik8_otus_food/src/injector.dart';
import 'package:ik8_otus_food/src/presentations/blocs/recipe/comments.dart';
import 'package:ik8_otus_food/src/presentations/blocs/recipe/info.dart';
import 'package:ik8_otus_food/src/presentations/pages/recipe/current/steps.dart';
import '../../../widgets/widgets.dart';
import 'comment_field.dart';
import 'comments.dart';
import 'ingredients.dart';
import 'recipe_info.dart';

class CurrentRecipePage extends StatelessWidget {
  final Recipe data;

  const CurrentRecipePage(this.data, {Key? key}) : super(key: key);

  static Route route(Recipe data) {
    return MaterialPageRoute(builder: (_) => CurrentRecipePage(data));
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<RecipeCommentsCubit>(
            create: (_) =>
            injector(param1: data.id)
              ..update()),
        BlocProvider<RecipeInfoCubit>(
            create: (_) =>
            injector(param1: data)
              ..refreshSteps()),
      ],
      child: CurrentRecipePageView(data),
    );
  }
}

class CurrentRecipePageView extends StatefulWidget {
  final Recipe data;

  const CurrentRecipePageView(this.data, {Key? key}) : super(key: key);

  @override
  State<CurrentRecipePageView> createState() => _CurrentRecipePageViewState();
}

class _CurrentRecipePageViewState extends State<CurrentRecipePageView> {

  createComment(String text) {
    context.read<RecipeCommentsCubit>().createComment(text);
  }

  final commentFieldKey = GlobalKey();
  final commentController = TextEditingController();

  @override
  void dispose() {
    commentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var bottom = MediaQuery
        .of(context)
        .viewInsets
        .bottom;
    final keyboardIsOpened = bottom != 0.0;
    return Scaffold(
      appBar: AppBar(
        leading: !keyboardIsOpened
            ? null
            : IconButton(
          onPressed: () {
            clearCurrentFocus(context);
          },
          icon: const Icon(Icons.done),
        ),
        title: const Text('Рецепт'),
      ),
      body: Column(
        children: [
          Expanded(
              child: ListView(
                padding: const EdgeInsets.all(16),
                children: [
                  const RecipeInfoView(),
                  const IngredientsList(),
                  const StepList(),
                  const Center(
                    child:_StartButton(),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const Divider(
                    color: Color(0xff797676),
                  ),
                  const CommentList(),
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

class _StartButton extends StatelessWidget {
  const _StartButton({Key? key}) : super(key: key);

  onStart(BuildContext context, bool isStarted) {
    context.read<RecipeInfoCubit>().start(isStarted);
  }

  @override
  Widget build(BuildContext context) {
    final isStarted = context.select((RecipeInfoCubit value) =>
    value.state.data?.recipe.isStarted == true);
    return ToggleOutlineFilledButton(
      outlinedLabel: 'Закончить готовить',
      filledLabel: 'Начать готовить',
      outlined: isStarted,
      onPressed: (bool value) => onStart(context, value),
    );
  }
}
