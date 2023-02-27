import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/service/timer_service.dart';
import '../../../domain/usecase/recipe/subscribe_recipe_timer.dart';

class RecipeTimerCubit extends Cubit<Duration?> {
  final int id;
  final SubscribeRecipeTimerUseCase _subscribeRecipeTimer;

  RecipeTimerCubit(
    this._subscribeRecipeTimer, {
    required this.id,
  }) : super(null);
  StreamSubscription<bool>? _timerSubscription;
  StreamSubscription<Duration>? _durationSubscription;

  void initialize() {
    _timerSubscription = _subscribeRecipeTimer(
        recipeId: id,
        onChange: (timer) {
          _durationSubscription?.cancel();
          if (timer != null) {
            _subscribeTimer(timer);
          } else {
            emit(null);
          }
        });
  }

  void _subscribeTimer(TimerService timer) {
    emit(timer.currentDuration);
    _durationSubscription = timer.stream().listen((duration) {
      emit(duration);
    });
  }

  dispose() {
    _timerSubscription?.cancel();
    _durationSubscription?.cancel();
  }
}
