import 'dart:async';

import 'package:lepath_app/cross/cross.dart';

import 'package:pocket/pocket.dart';
import 'package:rxdart/rxdart.dart';

class DsaListRepository with PocketMultiDataSourceMixin<IPocketAdapter> {
  DsaListRepository(
    this.adapterDb,
    // this._readAllDsaExercises,
  ) {
    _listenElements();
  }

  String get tableDsaExercise => 'dsa_exercises_table';

  final BehaviorSubject<Iterable<DsaExerciseDto>> _dsaExercisesListStream =
      BehaviorSubject<Iterable<DsaExerciseDto>>.seeded([]);

  @override
  final IPocketAdapter adapterDb;

  Stream<Iterable<DsaExerciseDto>> get readAllDsaExercises =>
      _dsaExercisesListStream;

  void _listenElements() {
    adapterDb
        .readWhere(
          table: tableDsaExercise,
          pocketQueries: [],
        )
        .map((items) => items.map((item) => DsaExerciseDto.fromJson(item.data)))
        .listen((items) {
          _dsaExercisesListStream.value = items;
        });
  }
}
