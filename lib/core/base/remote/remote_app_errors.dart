import 'package:lepath_app/core/base/errors/app_error.dart';

abstract class AppRemoteError extends AppError {}

class NoInternetConnection extends AppRemoteError {}

class RemoteResponseError extends AppRemoteError {}

class RemoteExceptionError extends AppRemoteError {}
