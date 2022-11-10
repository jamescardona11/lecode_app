import 'package:lepath_app/core/base/remote/remote_package.dart';
import 'remote_app_response.dart';

typedef FromJson<R> = R Function(Map<String, dynamic> json);

abstract class IRemoteRepository {
  Future<RemoteAppResponse<R>> getSingle<R>(
    RemotePackage package,
    FromJson<R> fromJson,
  );

  Future<RemoteAppResponse<Iterable<R>>> getMany<R>(
    RemotePackage package,
    FromJson<R> fromJson,
  );

  Future<RemoteAppResponse<bool>> post(RemotePackage package);

  // R fromJson(Map<String, dynamic> json);
}
