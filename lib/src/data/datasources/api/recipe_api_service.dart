import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:ik8_otus_food/src/data/models/api/recipe.dart';

import '../../../core/service/stream_value.dart';
import '../../../domain/entities/recipe.dart';

class RecipeApiService {
  final Dio _dio;

  RecipeApiService(this._dio);

  void _pull() {
    // getRecipeList();
  }

  Future<void> getRecipeList({
    required Function(List<Recipe> list) onResponse,
    required Function()? onConnectionError,
  }) async {
    try {
      // _streamControllerIsInit = true;
      // www.themealdb.com/api/json/v1/1/
      final response = await _dio.get('search.php?s=A');

      List<dynamic> data = (response.data as Map)['meals'];
      final list = data.map((e) => RecipeModel.fromJson(e)).toList();
      print(data);
      onResponse(list);
      _streamController().add(list);
    } on SocketException catch (e) {
      print('Инета нет');
    }
  }

  StreamSubscription<List<Recipe>> subscribeList(
      {required Function(List<Recipe> list) onData}) {
    // if (!_streamControllerIsInit) {
    //   _pull();
    //   _streamControllerIsInit = true;
    // } else {
    //   onData(_streamController.value);
    // }
    return _streamController().stream.listen((event) {
      onData(event);
    });
  }

  late final _streamController = StreamValue<List<Recipe>>([]);
  bool _streamControllerIsInit = false;

// refresh() {
//   _streamController.add([]);
//   getRecipeList();
// }
}
