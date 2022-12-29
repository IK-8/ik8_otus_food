import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/recipe/info.dart';
import '../../../widgets/widgets.dart';

class RecipeInfoView extends StatelessWidget {
  const RecipeInfoView({Key? key}) : super(key: key);

  onChangeFavorite(BuildContext context, bool isFavorite) {
    context.read<RecipeInfoCubit>().changeFavorite(isFavorite);
  }

  @override
  Widget build(BuildContext context) {
    final data =
        context.select((RecipeInfoCubit value) => value.state.data?.recipe);
    if (data == null) {
      return const SizedBox();
    }
    return Column(
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
                    child: Text(data.title,
                        style: const TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 24)),
                  ),
                  DurationView(data.seconds),
                ],
              ),
            ),
            FavoriteButton(
              onChanged: (isSelect) => onChangeFavorite(context, isSelect),
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
                data.image,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
