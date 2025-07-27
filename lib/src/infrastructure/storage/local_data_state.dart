abstract class LocalDataState<T> {
  final T? data;
  final String? error;

  const LocalDataState(this.data, this.error);
}

class LocalDataSuccess<T> extends LocalDataState<T> {
  const LocalDataSuccess(T data) : super(data, null);
}

class LocalDataFailed<T> extends LocalDataState<T> {
  const LocalDataFailed(String? error) : super(null, error);
}