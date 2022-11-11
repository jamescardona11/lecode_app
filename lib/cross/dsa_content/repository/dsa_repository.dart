import 'package:lepath_app/core/core.dart';
import 'package:lepath_app/cross/cross.dart';

import 'package:pocket/pocket.dart';
import 'package:projectile/projectile.dart';

class DsaRepository
    with
        PocketMultiDataSourceMixin<IPocketAdapter, DsaExerciseModel>,
        RemoteRepositoryMixin<Projectile> {
  DsaRepository(
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

  String get tableDsaName => 'dsa_exercises_table';

  Future<RemoteAppResponse<DsaExerciseModel>> fetchDSAExercisesInformation() {
    return getSingle<DsaExerciseModel>(
      RemotePackage.get(
        'exec',
        queries: {'action': 'getLeetCode'},
      ),
      DsaExerciseModel.fromJson,
    );
  }

  Future<void> saveDsaExercises(List<DsaExerciseModel> items) async {}

  Future<void> saveDsaProblems(DsaProblemsModel problems) async {}
}
