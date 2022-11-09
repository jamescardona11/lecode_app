import 'package:lepath_app/core/base/errors/value_failure.dart';

class NoInternetConnectionError extends ValueFailure {
  NoInternetConnectionError() : super('No Internet connection');

  @override
  String toString() {
    return Error.safeToString(valueFailure);
  }
}
