import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ik8_otus_food/l10n/extension.dart';
import 'package:ik8_otus_food/src/core/extension/extension.dart';

import '../../../blocs/recipe/recipe_timer_cubit.dart';

class StartedTimeView extends StatelessWidget {
  const StartedTimeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final duration = context
        .select((RecipeTimerCubit timer) => timer.state ?? Duration.zero);
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            AppLocalizations.of(context)!.timerTitle,
            style: const TextStyle(color: Colors.white, fontSize: 15),
          ),
          Text(
            duration.hourMinuteSecondsTimerDurationFormat(),
            style: const TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
