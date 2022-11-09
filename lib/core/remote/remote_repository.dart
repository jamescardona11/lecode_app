import 'package:lepath_app/core/remote/remote_package.dart';
import 'package:projectile/projectile.dart';

abstract class IBaseModel<T> {
  T fromJson(Map<String, dynamic> json);
}

abstract class IRemoteRepository<R extends IBaseModel> {
  Future<RemoteResponse<R>> getSingle(RemotePackage package);

  Future<RemoteResponse<Iterable<R>>> getMany(RemotePackage package);

  Future<RemoteResponse<bool>> post(RemotePackage package);

  R fromJson(Map<String, dynamic> json);
}

abstract class RemoteRepository<R extends IBaseModel>
    implements IRemoteRepository<R> {
  RemoteRepository(this.projectile);

  final Projectile projectile;

  @override
  Future<RemoteResponse<R>> getSingle(RemotePackage package) async {
    final response = await projectile
        .request(
          ProjectileRequest(
            target: package.url,
            method: Method.GET,
            query: package.queries,
            urlParams: package.urlParams,
            headers: package.headers,
          ),
        )
        .fire();

    return response.fold(
      (error) => RemoteError(),
      (success) {
        final data = (success.data as Map<String, dynamic>)['data'];

        fromJson(data);

        return RemoteSuccess();
      },
    );
  }

  @override
  Future<RemoteResponse<Iterable<R>>> getMany(RemotePackage package) async {
    final response = await projectile
        .request(
          ProjectileRequest(
            target: package.url,
            method: Method.GET,
            query: package.queries,
            urlParams: package.urlParams,
            headers: package.headers,
          ),
        )
        .fire();

    return response.fold(
      (error) => RemoteError(),
      (success) {
        final data = (success.data as Map<String, dynamic>)['data'];

        fromJson(data);

        return RemoteSuccess();
      },
    );
  }

  @override
  Future<RemoteResponse<bool>> post(RemotePackage package) async {
    final response = await projectile
        .request(
          ProjectileRequest(
            target: package.url,
            method: Method.POST,
            headers: package.headers,
            query: package.queries,
            urlParams: package.urlParams,
            data: package.data,
          ),
        )
        .fire();

    return response.fold(
      (error) => RemoteError(),
      (success) => RemoteSuccess<bool>(),
    );
  }
}

typedef Err<T, R> = R Function(T error);
typedef Completion<T, R> = R Function(T success);

abstract class RemoteResponse<T> {
  /// Returns true if [Result] is [Error].
  bool get isError => this is RemoteError;

  /// Returns true if [Result] is [Success].
  bool get isSuccess => this is RemoteSuccess;

  /// Returns a new value of [Failure] result.
  ///
  RemoteError get failure {
    if (isError) {
      return (this as RemoteError);
    }

    throw Exception(
      'Make sure that result [isError] before accessing [error properties]',
    );
  }

  /// Returns a new value of [Success] result.
  RemoteSuccess get success {
    if (isSuccess) {
      return (this as RemoteSuccess);
    }

    throw Exception(
      'Make sure that result [isSuccess] before accessing [success]',
    );
  }

  /// Returns a new value of [Result] from closure
  R fold<R>(Err<RemoteError, R> failure, Completion<RemoteSuccess, R> success) {
    if (isSuccess) {
      final right = this as RemoteSuccess<R>;
      return success(right);
    } else {
      final left = this as RemoteError;
      return failure(left);
    }
  }
}

class RemoteSuccess<R> extends RemoteResponse<R> {}

class RemoteError<R> extends RemoteResponse<R> {}
