import 'package:lepath_app/core/base/misc/app_either.dart';

import 'remote_app_errors.dart';

typedef RemoteAppResponse<R> = AppEither<RemoteError, R>;

class RemoteSuccess<R> extends RemoteAppResponse<R> {}

class RemoteError<R> {
  RemoteError(this.error);

  final AppRemoteError error;
}
