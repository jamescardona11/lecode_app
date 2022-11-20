import 'package:meta/meta.dart';

import 'app_either.dart';

@immutable
class AppRight<L, R> extends AppEither<L, R> {
  final R value;

  AppRight(this.value);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AppRight<L, R> && other.value == value;
  }

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => 'AppRight: $value';
}
