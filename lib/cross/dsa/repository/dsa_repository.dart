import 'dart:math';

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

  Future<void> markAsComplete(String id) async {
    final dto = await adapterDb.read(table: tableDsaExercise, id: id);
    if (dto == null) return;

    DsaExerciseDto exercise = DsaExerciseDto.fromJson(dto.data);
    final r = randomDate();
    print('randomDate() $r');
    print('randomDate() ${exercise}');

    exercise = exercise.copyWith(
        completedDate: exercise.completedDate == null ? r : null);

    print('randomDate() ${exercise.toJson()}');

    await adapterDb.update(
        table: tableDsaExercise, item: AdapterDto(id, exercise.toJson()));
  }

  DateTime randomDate() {
    final i = Random(DateTime.now().millisecondsSinceEpoch).nextInt(1000);
    final m = Random(DateTime.now().millisecondsSinceEpoch).nextInt(12) + 1;
    final d = Random(DateTime.now().millisecondsSinceEpoch).nextInt(30) + 1;

    if (i < 50) {
      return DateTime(2022, 11, 12);
    } else if (i < 150) {
      return DateTime(2022, 11, 11);
    } else if (i < 200) {
      return DateTime(2022, 11, 10);
    } else if (i < 250) {
      return DateTime(2022, 11, 9);
    } else if (i < 350) {
      return DateTime(2022, 11, 8);
    } else if (i < 450) {
      return DateTime(2022, 11, 7);
    } else if (i < 550) {
      return DateTime(2022, 11, 6);
    } else if (i < 650) {
      return DateTime(2022, 11, 1);
    } else if (i < 750) {
      return DateTime(2022, 10, 30);
    } else if (i < 900) {
      return DateTime(2022, 10, 16);
    }

    return DateTime(2022, m, d);
  }
}
