import 'app_error.dart';

class UnexpectedValueError extends AppError {
  UnexpectedValueError();

  @override
  String toString() {
    const explanation =
        'Encountered a Unexpected at an unrecoverable point. Terminating.';
    return Error.safeToString(explanation);
  }
}
