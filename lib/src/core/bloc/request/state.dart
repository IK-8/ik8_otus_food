import 'state_type.dart';

class RequestStateInfo<T> {
  final T? data;
  final RequestStateType state;

  const RequestStateInfo({
    this.data,
    this.state = RequestStateType.none,
  });

  const RequestStateInfo.full(
    T this.data,
  ) : state = RequestStateType.none;

  RequestStateInfo<T> copyWith({
    T? data,
    RequestStateType? state,
  }) {
    return RequestStateInfo<T>(
      data: data ?? this.data,
      state: state ?? this.state,
    );
  }

  RequestStateInfo<T> setFull(T data) => copyWith(
        data: data,
        state: RequestStateType.full,
      );

  RequestStateInfo<T> setLoading() => copyWith(
        state: RequestStateType.loading,
      );

  RequestStateInfo<T> setOperationLoading() => copyWith(
        state: RequestStateType.operationLoading,
      );

  RequestStateInfo<T> recreate(
          RequestStateInfo<T> Function(RequestStateInfo<T> state) create) =>
      create(this);

  RequestStateInfo<T> updateData(
    T? Function(T? data) create, {
    RequestStateType? state,
  }) {
    return copyWith(
      data: create(data),
      state: state,
    );
  }
}

extension RequestStateInfoEx on RequestStateInfo {
  bool get isLoading => state.isLoading;

  bool get isOperationLoading => state.isOperationLoading;

  bool get isNone => state.isNone;

  bool get isFull => state.isFull;
}
