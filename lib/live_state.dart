sealed class LiveState<T> {
  const LiveState();

  const factory LiveState.ok(T value) = Ok._;
  const factory LiveState.error(Exception error) = Error._;
  const factory LiveState.loading() = Loading._;
}

final class Ok<T> extends LiveState<T> {
  const Ok._(this.value);
  final T value;

  @override
  String toString() => 'LiveState<$T>.ok($value)';
}

final class Error<T> extends LiveState<T> {
  const Error._(this.error);
  final Exception error;

  @override
  String toString() => 'LiveState<$T>.error($error)';
}

final class Loading<T> extends LiveState<T> {
  const Loading._();
  @override
  String toString() => 'LiveState<$T>.loading()';
}
