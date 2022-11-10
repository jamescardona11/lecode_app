import 'package:lepath_app/core/base/misc/either/either.dart';

import 'remote_app_errors.dart';

typedef RemoteAppResponse<T> = AppEither<RemoteError, RemoteSuccess<T>>;

class RemoteSuccess<T> {
  RemoteSuccess(this.value);

  T value;
}

class RemoteError {
  RemoteError(this.error);

  AppRemoteError error;
}
