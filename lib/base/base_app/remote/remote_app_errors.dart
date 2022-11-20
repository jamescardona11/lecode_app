import 'package:lecode_app/base/base_app/errors/app_error.dart';

abstract class AppRemoteError extends AppError {}

class NoInternetConnection extends AppRemoteError {}

class RemoteResponseError extends AppRemoteError {}

class RemoteExceptionError extends AppRemoteError {}
