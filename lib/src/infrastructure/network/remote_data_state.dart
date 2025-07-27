import 'api_error.dart';

abstract class RemoteDataState<T> {
  final T? data;
  final ApiError? error;

  const RemoteDataState(this.data, this.error);
}

class RemoteDataSuccess<T> extends RemoteDataState<T> {
  const RemoteDataSuccess(T data) : super(data, null);
}

class RemoteDataFailed<T> extends RemoteDataState<T> {
  const RemoteDataFailed(ApiError? error) : super(null, error);
}
