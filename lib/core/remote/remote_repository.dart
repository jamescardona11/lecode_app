import 'package:lepath_app/core/base/misc/either/either.dart';
import 'package:lepath_app/core/base/remote/remote_package.dart';
import 'package:projectile/projectile.dart';

import '../base/remote/i_remote_repository.dart';
import '../base/remote/remote_app_errors.dart';
import '../base/remote/remote_app_response.dart';

abstract class RemoteRepository implements IRemoteRepository {
  RemoteRepository(this.projectile);

  final Projectile projectile;

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
  Future<RemoteAppResponse<Iterable<R>>> getMany<R>(
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
          ),
        )
        .fire();

    return response.fold(
      (error) => AppLeft(RemoteError(_mapFromFailureResult(error))),
      (success) {
        final data =
            (success.data as Map<String, dynamic>)['data'] as List<dynamic>;

        return AppRight(RemoteSuccess(data.map((e) => fromJson(e))));
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

  AppRemoteError _mapFromFailureResult(FailureResult error) {
    if (error.type == ProjectileErrorType.other) {
      return RemoteExceptionError();
    } else if (error.type == ProjectileErrorType.response) {
      return RemoteResponseError();
    }

    return NoInternetConnection();
  }
}
