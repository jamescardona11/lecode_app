import 'package:lepath_app/core/base/misc/app_either.dart';
import 'package:meta/meta.dart';

@immutable
class AppRight<L, R> extends AppEither<L, R> {
  final R value;

  AppRight(this.value);

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is AppRight<L, R> && o.value == value;
  }

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => 'AppRight: $value';
}
