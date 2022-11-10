import 'package:lepath_app/core/base/misc/either/either.dart';
import 'package:lepath_app/core/base/remote/remote_package.dart';
import 'package:projectile/projectile.dart';

import '../base/remote/i_remote_repository.dart';
import '../base/remote/remote_app_errors.dart';
import '../base/remote/remote_app_response.dart';

abstract class RemoteRepository<P extends Projectile>
    implements IRemoteRepository {
  P get projectile;

  @override
  Future<RemoteAppResponse<R>> getSingle<R>(
    RemotePackage package,
    FromJson<R> fromJson,
  ) async {
    final response = await projectile
        .request(
          ProjectileRequest(
            target: package.url,
            method: Method.GET,
            queries: package.queries,
            urlParams: package.urlParams,
            headers: package.headers,
            customSuccess: _customSuccess,
          ),
        )
        .fire();

    return response.fold(
      (error) => AppLeft(RemoteError(_mapFromFailureResult(error))),
      (success) {
        final data = (success.data as Map<String, dynamic>)['data'];

        return AppRight(RemoteSuccess(fromJson(data)));
      },
    );
  }

  @override
  Future<RemoteAppResponse<bool>> post(RemotePackage package) async {
    final response = await projectile
        .request(
          ProjectileRequest(
            target: package.url,
            method: Method.POST,
            headers: package.headers,
            queries: package.queries,
            urlParams: package.urlParams,
            data: package.data,
          ),
        )
        .fire();

    return response.fold(
      (error) => AppLeft(RemoteError(_mapFromFailureResult(error))),
      (success) => AppRight(RemoteSuccess(true)),
    );
  }

  bool _customSuccess(json) {
    if (json is Map<String, dynamic>) {
      return json['success'];
    }

    return false;
  }

  AppRemoteError _mapFromFailureResult(FailureResult error) {
    if (error.type == ProjectileErrorType.other) {
      return RemoteExceptionError();
    } else if (error.type == ProjectileErrorType.response) {
      return RemoteResponseError();
    }

    return NoInternetConnection();
  }
}
