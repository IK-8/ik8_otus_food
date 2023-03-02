enum RequestStateType {
  none,
  loading,
  full,
  operationLoading,
  error,
}

extension RequestStateTypeEx on RequestStateType {
  bool get isLoading => this == RequestStateType.loading;

  bool get isOperationLoading => this == RequestStateType.operationLoading;

  bool get isNone => this == RequestStateType.none;

  bool get isFull => this == RequestStateType.full;

  bool get isError => this == RequestStateType.error;
}
