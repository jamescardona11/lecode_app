import 'package:lepath_app/core/core.dart';
import 'package:lepath_app/cross/cross.dart';

import 'package:pocket/pocket.dart';
import 'package:projectile/projectile.dart';

class DsaRepository
    with
        PocketMultiDataSourceMixin<IPocketAdapter>,
        RemoteRepositoryMixin<Projectile> {
  const DsaRepository(
    this.adapterDb,
    this.projectile,
  );

  String get tableDsaProblems => 'dsa_problems_table';

  String get tableDsaExercise => 'dsa_exercises_table';

  @override
  final IPocketAdapter adapterDb;

  @override
  final Projectile projectile;

  Future<RemoteAppResponse<DsaProblemsAggregateDto>>
      fetchDSAExercisesInformation() {
    return getSingle<DsaProblemsAggregateDto>(
      RemotePackage.get(
        'exec',
        queries: {'action': 'getLeetCode'},
      ),
      DsaProblemsAggregateDto.fromJson,
    );
  }

  Future<void> saveDsaProblems(DsaProblemsDto problems) async {
    await create(
      problems,
      tableDsaProblems,
    );
  }

  Future<void> saveDsaExercises(List<DsaExerciseDto> items) async {
    await createMany(
      items,
      tableDsaExercise,
    );
  }
}
