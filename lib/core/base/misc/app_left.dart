import 'package:meta/meta.dart';

import 'app_either.dart';

@immutable
class AppLeft<L, R> extends AppEither<L, R> {
  final L value;

  AppLeft(this.value);

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is AppLeft<L, R> && o.value == value;
  }

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => 'AppLeft: $value';
}
