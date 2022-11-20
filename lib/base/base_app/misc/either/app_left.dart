import 'package:meta/meta.dart';

import 'app_either.dart';

@immutable
class AppLeft<L, R> extends AppEither<L, R> {
  final L value;

  AppLeft(this.value);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AppLeft<L, R> && other.value == value;
  }

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => 'AppLeft: $value';
}
