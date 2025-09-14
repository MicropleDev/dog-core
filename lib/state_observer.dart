import 'package:flutter/material.dart';
import 'live_state.dart';

class StateObserver<T> extends StatelessWidget {
  final LiveState<T>? result;
  final Widget Function(T data)? onSuccess;
  final Widget Function()? onLoading;
  final Widget Function(Exception error)? onError;
  final Widget Function()? orElse;

  const StateObserver({
    super.key,
    required this.result,
    this.onSuccess,
    this.onLoading,
    this.onError,
    this.orElse,
  });

  @override
  Widget build(BuildContext context) {
    return switch (result) {
      Loading<T>() => onLoading?.call() ?? const Center(child: CircularProgressIndicator()),
      Ok<T>(:final value) => onSuccess?.call(value) ?? const SizedBox.shrink(),
      Error<T>(:final error) => onError?.call(error) ?? const SizedBox.shrink(),
      _ => orElse?.call() ?? const SizedBox.shrink(),
    };
  }
}
