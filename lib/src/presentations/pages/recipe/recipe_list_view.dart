import 'package:flutter/material.dart';
import 'package:ik8_otus_food/src/core/bloc/bloc.dart';
import 'package:ik8_otus_food/src/injector.dart';
import '../../../config/theme/main.dart';
import '../../blocs/recipe/recipe_list_cubit.dart';
import '../../widgets/widgets.dart';
import 'current/current_recipe_page.dart';

class RecipeListPage extends StatelessWidget {
  const RecipeListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const RecipeListProvider(
      child: RecipeListView(),
    );
  }
}

class RecipeListProvider extends StatefulWidget {
  final Widget child;

  const RecipeListProvider({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  State<RecipeListProvider> createState() => _RecipeListProviderState();
}

class _RecipeListProviderState extends State<RecipeListProvider> {
  RecipeListCubit? _bloc;

  @override
  void dispose() {
    _bloc?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RecipeListCubit>(
      create: (_) {
        _bloc?.dispose();
        _bloc = injector()..pull();
        return _bloc!;
      },
      child: widget.child,
    );
  }
}

class RecipeListView extends StatelessWidget {
  const RecipeListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = context.watch<RecipeListCubit>().state;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        systemOverlayStyle: transparentSystemOverlayStyle,
        elevation: 0,
      ),
      backgroundColor: backgroundColor,
      body: state.when(
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
        full: () => SafeArea(
          child: ListView.builder(
            itemCount: state.list.length,
            addAutomaticKeepAlives: false,
            physics: const TopBouncingScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              var item = state.list[index];
              return InkWell(
                onTap: () {
                  Navigator.push(context, CurrentRecipePage.route(item));
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 12.0, horizontal: 16.0),
                  child: RecipeItem(item),
                ),
              );
            },
          ),
        ),
        error: () => Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                state.error ?? 'Ошибка',
                maxLines: 4,
                overflow: TextOverflow.ellipsis,
              ),
              ElevatedButton.icon(
                onPressed: () {
                  context.read<RecipeListCubit>().pull();
                },
                icon: const Icon(Icons.refresh),
                label: const Text('Перезагрузить'),
              ),
            ],
          ),
        ),
        other: () => const SizedBox(),
      ),
    );
  }
}
