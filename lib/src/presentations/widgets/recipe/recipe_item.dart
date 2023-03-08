import 'package:flutter/material.dart';
import '../../../domain/entities/recipe.dart';
import '../image/food_error_builder.dart';
import 'duration_view.dart';

class RecipeItem extends StatelessWidget {
  final Recipe item;

  const RecipeItem(this.item, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
        boxShadow: const [
          BoxShadow(
            color: Color(0x1A959292),
            offset: Offset(0, 4),
            spreadRadius: 2,
            blurRadius: 4,
          ),
        ],
      ),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Flexible(
              fit: FlexFit.tight,
              flex: 4,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(4),
                    bottomLeft: Radius.circular(4)),
                child: AspectRatio(
                  aspectRatio: 1,
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      Image.network(
                        item.image,
                        fit: BoxFit.cover,
                        errorBuilder: foodErrorBuilder,
                      ),
                      if (item.isFavorite)
                        Positioned(
                          left: 5,
                          top: 5,
                          child: SizedBox(
                            width: 40,
                            height: 40,
                            child: Opacity(
                              opacity: 0.9,
                              child:
                                  Image.asset('assets/animation/checked.png'),
                            ),
                          ),
                        )
                    ],
                  ),
                ),
              ),
            ),
            Flexible(
              fit: FlexFit.tight,
              flex: 6,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(item.title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 22)),
                    const SizedBox(height: 10),
                    DurationView(item.seconds)
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
