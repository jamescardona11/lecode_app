import 'package:lepath_app/app/path_content/model/entities/path_content.dart';
import 'package:lepath_app/core/base/remote/remote_app_response.dart';
import 'package:lepath_app/core/base/remote/remote_package.dart';
import 'package:lepath_app/core/remote/remote_repository.dart';
import 'package:pocket/pocket.dart';
import 'package:projectile/projectile.dart';

class PathContentDatabase
    with
        PocketDatabase<IPocketAdapter, PathContentModel>,
        RemoteRepository<Projectile> {
  PathContentDatabase(
    this.adapterDb,
    this.projectile,
  );

  @override
  final IPocketAdapter adapterDb;

  @override
  final Projectile projectile;

  @override
  PathContentModel fromJson(Map<String, dynamic> json) =>
      PathContentModel.fromJson(json);

  @override
  String get tableName => 'path_content_table';

  Future<RemoteAppResponse<Iterable<PathContentModel>>>
      fetchPathContentInformation() {
    return getMany<PathContentModel>(
      RemotePackage.get(
        '',
        queries: {'action': 'getLeetCode'},
      ),
      PathContentModel.fromJson,
    );
  }
}
