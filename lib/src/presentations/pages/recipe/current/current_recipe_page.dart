import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ik8_otus_food/l10n/extension.dart';
import 'package:ik8_otus_food/src/core/bloc/bloc.dart';
import 'package:ik8_otus_food/src/core/extension/focus.dart';
import 'package:ik8_otus_food/src/domain/entities/recipe.dart';
import 'package:ik8_otus_food/src/injector.dart';
import 'package:ik8_otus_food/src/presentations/blocs/recipe/recipe_comments_cubit.dart';
import 'package:ik8_otus_food/src/presentations/blocs/recipe/recipe_info_cubit.dart';
import 'package:ik8_otus_food/src/presentations/pages/recipe/current/step_list.dart';
import '../../../../config/theme/main.dart';
import '../../../blocs/recipe/recipe_timer_cubit.dart';
import '../../../widgets/widgets.dart';
import 'comment_field.dart';
import 'comment_list.dart';
import 'ingredients_list.dart';
import 'recipe_info_view.dart';
import 'started_timer_view.dart';

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
  RecipeTimerCubit? _timerCubit;

  @override
  void dispose() {
    _timerCubit?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {


    return MultiBlocProvider(
      providers: [
        BlocProvider<RecipeCommentsCubit>(
            create: (_) => injector(param1: widget.data.id)..update()),
        BlocProvider<RecipeInfoCubit>(
            create: (_) => injector(param1: widget.data)..refreshSteps()),
        BlocProvider<RecipeTimerCubit>(
          create: (_) {


            _timerCubit?.dispose();
            _timerCubit = injector(param1: widget.data.id)..initialize();
            return _timerCubit!;
          },
        ),
      ],
      child: CurrentRecipePageView(widget.data),
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

  var _commentFieldHasFocus = false;

  set commentFieldHasFocus(bool value) {
    if (value != _commentFieldHasFocus) {
      setState(() {
        _commentFieldHasFocus = value;
      });
    }
  }

  bool get commentFieldHasFocus => _commentFieldHasFocus;
  final commentFocusNode = FocusNode();
  final commentFieldKey = GlobalKey();
  final commentController = TextEditingController();

  final scrollController = ScrollController();

  @override
  void initState() {
    super.initState();


    commentFocusNode.addListener(() {
      commentFieldHasFocus = commentFocusNode.hasFocus;
    });

  }

  @override
  void dispose() {
    commentController.dispose();
    commentFocusNode.dispose();
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {


    final commentInputActive =
        commentFieldHasFocus || MediaQuery.of(context).viewInsets.bottom != 0.0;
    final isStarted = context.select(
        (RecipeInfoCubit value) => value.state.data?.recipe.isStarted ?? false);
    return Scaffold(
      appBar: AppBar(
        elevation: isStarted ? 0 : 2,
        leading: !commentInputActive
            ? null
            : IconButton(
                onPressed: () {
                  clearCurrentFocus(context);
                },
                icon: const Icon(Icons.done),
              ),
        systemOverlayStyle: isStarted
            ? const SystemUiOverlayStyle(
                statusBarColor: primaryColor,
                statusBarIconBrightness: Brightness.dark,
                statusBarBrightness: Brightness.light,
              )
            : null,
        bottom: isStarted
            ? const PreferredSize(
                preferredSize: Size.fromHeight(50.0),
                child: StartedTimeView(),
              )
            : null,
        backgroundColor: isStarted ? primaryColor : null,
        title: Text(AppLocalizations.of(context)!.recipeTitle),
      ),
      body: MaxWebWidthScrollbarView(
        scrollController: scrollController,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: ScrollConfiguration(
                behavior:
                    ScrollConfiguration.of(context).copyWith(scrollbars: false),
                child: SingleChildScrollView(
                  controller: scrollController,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        const RecipeInfoView(),
                        const IngredientsList(),
                        const StepList(),
                        const Center(
                          child: _StartButton(),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        const Divider(
                          color: greyColor,
                        ),
                        const CommentList(),
                        const SizedBox(
                          height: 16,
                        ),
                        if (!commentInputActive)
                          CommentField(
                            key: commentFieldKey,
                            controller: commentController,
                            focusNode: commentFocusNode,
                            create: createComment,
                          ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            if (commentInputActive)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CommentField(
                  key: commentFieldKey,
                  controller: commentController,
                  focusNode: commentFocusNode,
                  create: createComment,
                ),
              ),
          ],
        ),
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
    final stepsIsEmpty = context.select(
        (RecipeInfoCubit bloc) => (bloc.state.data?.steps ?? []).isEmpty);
    if (stepsIsEmpty) {
      return const SizedBox();
    }
    final isStarted = context.select(
        (RecipeInfoCubit value) => value.state.data?.recipe.isStarted == true);
    return ToggleOutlineFilledButton(
      outlinedLabel: 'Закончить готовить',
      filledLabel: 'Начать готовить',
      outlined: isStarted,
      onPressed: (bool value) => onStart(context, value),
    );
  }
}
