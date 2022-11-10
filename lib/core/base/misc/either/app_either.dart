// typedef Err<T, R> = R Function(T error);

import 'app_left.dart';
import 'app_right.dart';

typedef Completion<V, T> = T Function(V value);

abstract class AppEither<L, R> {
  /// Returns true if [AppEither] is [AppLeft].
  bool get isLeft => this is AppLeft<L, R>;

  /// Returns true if [AppEither] is [AppRight].
  bool get isRight => this is AppRight<L, R>;

  /// Returns a new value of [AppLeft] result.
  L get error {
    if (isLeft) {
      return (this as AppLeft<L, R>).value;
    }

    throw Exception(
      'Make sure that result [isError] before accessing [error properties]',
    );
  }

  /// Returns a new value of [AppRight] result.
  R get right {
    if (isRight) {
      return (this as AppRight<L, R>).value;
    }

    throw Exception(
      'Make sure that result [isSuccess] before accessing [success]',
    );
  }

  /// Returns a new value of [Result] from closure
  T fold<T>(Completion<L, T> failure, Completion<R, T> success) {
    if (isRight) {
      final right = this as AppRight<L, R>;
      return success(right.value);
    } else {
      final left = this as AppLeft<L, R>;
      return failure(left.value);
    }
  }
}
