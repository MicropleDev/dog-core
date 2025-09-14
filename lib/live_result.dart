import 'package:flutter/foundation.dart';
import 'live_state.dart';

class LiveResult<T> extends ValueNotifier<LiveState<T>?> {
  LiveResult() : super(null);

  void setLoading() => value = const LiveState.loading();

  void setSuccess(T data) => value = LiveState.ok(data);

  void setError(Exception e) => value = LiveState.error(e);

  void setErrorFrom(dynamic e) {
    value = LiveState.error(e is Exception ? e : Exception(e.toString()));
  }

  void clear() => value = null;

  bool get isLoading => value is Loading<T>;
  bool get isSuccess => value is Ok<T>;
  bool get isError => value is Error<T>;
}
