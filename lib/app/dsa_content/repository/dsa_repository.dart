import 'package:lepath_app/app/dsa_content/model/entities/dsa_exercise.dart';
import 'package:lepath_app/core/base/remote/remote_app_response.dart';
import 'package:lepath_app/core/base/remote/remote_package.dart';
import 'package:lepath_app/core/remote/remote_repository.dart';
import 'package:pocket/pocket.dart';
import 'package:projectile/projectile.dart';

class PathContentDatabase
    with
        PocketDatabase<IPocketAdapter, DsaExerciseModel>,
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
  DsaExerciseModel fromJson(Map<String, dynamic> json) =>
      DsaExerciseModel.fromJson(json);

  @override
  String get tableName => 'dsa_exercises_table';

  Future<RemoteAppResponse<DsaExerciseModel>> fetchDSAExercisesInformation() {
    return getSingle<DsaExerciseModel>(
      RemotePackage.get(
        '',
        queries: {'action': 'getLeetCode'},
      ),
      DsaExerciseModel.fromJson,
    );
  }
}
