

import 'request.dart';

typedef ValueStateNullable<T> = T Function()?;

T stateWhen<T>(
  RequestStateInfo state, {
  ValueStateNullable<T> none,
  ValueStateNullable<T> loading,
  ValueStateNullable<T> full,
  ValueStateNullable<T> operationLoading,
  ValueStateNullable<T> error,
  ValueStateNullable<T> other,
}) {
  switch (state.state) {
    case RequestStateType.none:
      if (none != null) {
        return none();
      }
      break;
    case RequestStateType.loading:
      if (loading != null) {
        return loading();
      }
      break;
    case RequestStateType.full:
      if (full != null) {
        return full();
      }
      break;
    case RequestStateType.operationLoading:
      if (operationLoading != null) {
        return operationLoading();
      }
      break;
    case RequestStateType.error:
      if (error != null) {
        return error();
      }
      break;
  }
  return other!();
}

extension WhenRequestStateInfoEx on RequestStateInfo {
  T when<T>({
    ValueStateNullable<T> none,
    ValueStateNullable<T> loading,
    ValueStateNullable<T> full,
    ValueStateNullable<T> operationLoading,
    ValueStateNullable<T> error,
    ValueStateNullable<T> other,
  }) =>
      stateWhen(
        this,
        none: none,
        loading: loading,
        full: full,
        operationLoading: operationLoading,
        error: error,
        other: other,
      );
}
