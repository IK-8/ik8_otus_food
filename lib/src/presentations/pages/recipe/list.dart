import 'package:flutter/material.dart';
import 'package:ik8_otus_food/src/core/bloc/bloc.dart';
import 'package:ik8_otus_food/src/injector.dart';
import '../../../config/theme/main.dart';
import '../../blocs/recipe/list.dart';
import '../../widgets/widgets.dart';
import 'current/current.dart';

class RecipeListPage extends StatelessWidget {
  const RecipeListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RecipeListCubit>(
      create: (_) => injector(),
      child: const RecipeListView(),
    );
  }
}

class RecipeListView extends StatelessWidget {
  const RecipeListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final list = context.watch<RecipeListCubit>().state;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        systemOverlayStyle: transparentSystemOverlayStyle,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: list.length,
        // cacheExtent: 5000,
        addAutomaticKeepAlives: false,
        physics: const TopBouncingScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          var item = list[index];
          return AutomaticKeepAlive(
            child: InkWell(
              onTap: () {
                Navigator.push(context, CurrentRecipePage.route(item));
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 12.0, horizontal: 16.0),
                child: RecipeItem(item),
              ),
            ),
          );
        },
      ),
    );
  }
}
