import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:ik8_otus_food/src/data/datasources/api/cache_service.dart';
import 'package:ik8_otus_food/src/data/models/local/ingredient.dart';
import 'package:path_provider/path_provider.dart';

import '../data/models/local/recipe.dart';
import '../data/models/local/step.dart';
import '../domain/entities/measure.dart';

Future<void> initializeCoreDependencies(GetIt injector) async {
  try {
    Hive.init(kIsWeb ? null : (await getTemporaryDirectory()).path);
    Hive.registerAdapter(LocalRecipeAdapter());
    Hive.registerAdapter(LocalRecipeIngredientAdapter());
    Hive.registerAdapter(MeasureAdapter());
    Hive.registerAdapter(LocalRecipeStepAdapter());
    injector.registerSingleton(Dio(BaseOptions(
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
      sendTimeout: const Duration(seconds: 10),
      baseUrl: 'https://www.themealdb.com/api/json/v1/1/',
    )));
    injector.registerSingleton(await ApiCacheService.init());
  } catch (_) {
    print(_);
  }
}
