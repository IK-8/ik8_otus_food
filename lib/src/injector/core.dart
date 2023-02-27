import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

Future<void> initializeCoreDependencies(GetIt injector) async {
  try {
    injector.registerSingleton(Dio(BaseOptions(
      connectTimeout: const Duration(seconds: 30),
      baseUrl: 'https://www.themealdb.com/api/json/v1/1/',
    )));
  } catch (_) {
    print(_);
  }
}
