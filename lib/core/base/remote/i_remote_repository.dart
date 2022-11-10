import 'package:lepath_app/core/base/remote/remote_package.dart';
import 'remote_app_response.dart';

typedef FromJson<R> = R Function(Map<String, dynamic> json);

abstract class IRemoteRepository {
  Future<RemoteAppResponse<T>> getSingle<T>(
    RemotePackage package,
    FromJson<T> fromJson,
  );

  Future<RemoteAppResponse<Iterable<T>>> getMany<T>(
    RemotePackage package,
    FromJson<T> fromJson,
  );

  Future<RemoteAppResponse<bool>> post(RemotePackage package);

  // R fromJson(Map<String, dynamic> json);
}