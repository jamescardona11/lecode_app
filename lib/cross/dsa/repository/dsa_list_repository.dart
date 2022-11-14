import 'dart:async';

import 'package:lepath_app/cross/cross.dart';

import 'package:pocket/pocket.dart';

class DsaListRepository with PocketMultiDataSourceMixin<IPocketAdapter> {
  DsaListRepository(
    this.adapterDb,
    // this._readAllDsaExercises,
  ) {
    _listenElements();
  }

  late final Stream<Iterable<DsaExerciseModel>> _dsaExercisesListStream;

  @override
  final IPocketAdapter adapterDb;

  String get tableDsaExercise => 'dsa_exercises_table';

  Stream<Iterable<DsaExerciseModel>> get readAllDsaExercises =>
      _dsaExercisesListStream;

  void _listenElements() {
    _dsaExercisesListStream = readWhere<DsaExerciseModel>(
        tableDsaExercise, DsaExerciseDto.toEntityByJson);
  }
}
