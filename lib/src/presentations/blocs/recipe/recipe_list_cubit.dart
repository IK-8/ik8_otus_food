import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/recipe.dart';
import '../../../domain/usecase/recipe/subscribe_recipe_list.dart';

class RecipeListCubit extends Cubit<List<Recipe>> {
  final SubscribeRecipeListUseCase _subscribe;
  StreamSubscription? _subscription;

  RecipeListCubit(this._subscribe) : super([]) {
    _init();
  }

  _init() {
    _subscription = _subscribe(onData: (list) {
      emit([...list]);
    });
  }

  dispose() async {
    _subscription?.cancel();
  }
}
