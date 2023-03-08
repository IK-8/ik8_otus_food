import 'dart:async';
import 'package:ik8_otus_food/src/domain/usecase/recipe/get_all_recipe.dart';

import '../../../core/bloc/bloc.dart';
import '../../../domain/entities/recipe.dart';
import '../../../domain/usecase/recipe/subscribe_recipe_list.dart';

class RecipeListCubit extends RequestStateCubit<List<Recipe>> {
  final SubscribeRecipeListUseCase _subscribe;
  final GetAllRecipeUseCase _pull;
  StreamSubscription? _subscription;

  RecipeListCubit(this._subscribe, this._pull) : super();

  void pull() {
    emit(state.setLoading());
    _pull(
      onResponse: (list) {
        emit(state.setFull(list));
        _init();
      },
      onError: (e) {
        emit(state.setError(e));
      },
    );
  }

  _init() {
    _subscription?.cancel();
    _subscription = _subscribe(onData: (list) {
      emit(state.setFull(list));
    });
  }

  dispose() async {
    _subscription?.cancel();
  }
}
