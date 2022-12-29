import 'package:flutter_bloc/flutter_bloc.dart';

import 'request.dart';

abstract class RequestStateCubit<T> extends Cubit<RequestStateInfo<T>> {
  RequestStateCubit([RequestStateInfo<T>? initialState])
      : super(initialState ?? RequestStateInfo<T>());
}
