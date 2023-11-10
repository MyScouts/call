enum StateStatus {
  ide,
  loading,
  success,
  error;

  bool get isIde => this == StateStatus.ide;

  bool get isLoading => this == StateStatus.loading;

  bool get isSuccess => this == StateStatus.success;

  bool get isError => this == StateStatus.error;
}

abstract class CoreState {
  final StateStatus status;

  CoreState({this.status = StateStatus.ide});
}
