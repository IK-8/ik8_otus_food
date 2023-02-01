import 'package:flutter/material.dart';
import 'package:ik8_otus_food/src/core/bloc/bloc.dart';
import '../../../blocs/recipe/recipe_comments_cubit.dart';
import '../../../widgets/recipe_comment/recipe_comment_item.dart';

class CommentList extends StatelessWidget {
  const CommentList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final list = context
        .select((RecipeCommentsCubit bloc) => bloc.state.data ?? const []);
    if (list.isEmpty) {
      return const SizedBox();
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        for (var comment in list)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0),
            child: RecipeCommentItem(comment),
          )
      ],
    );
  }
}
