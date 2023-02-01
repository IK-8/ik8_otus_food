import 'package:flutter/material.dart';
import '../../../config/theme/main.dart';
import '../../../domain/repositories/recipe_repository.dart';
import '../../widgets/widgets.dart';

class RecipeListView extends StatelessWidget {
  final RecipeRepository _repository;

  const RecipeListView(this._repository, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final list = _repository.all;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        systemOverlayStyle: transparentSystemOverlayStyle,
        elevation: 0,
      ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: list.length,
          physics: const TopBouncingScrollPhysics(),
          padding: const EdgeInsets.all(16),
          itemBuilder: (BuildContext context, int index) {
            var item = list[index];
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              child: RecipeItem(item),
            );
          },
        ),
      ),
    );
  }
}
