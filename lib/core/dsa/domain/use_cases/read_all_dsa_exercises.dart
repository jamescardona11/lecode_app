import 'dart:async';

import 'package:lepath_app/base/base.dart';
import 'package:lepath_app/core/core.dart';
import 'package:rxdart/rxdart.dart';

class ReadAllDsaExercisesData implements CommandData {
  const ReadAllDsaExercisesData();
}

class ReadAllDsaExercises
    implements
        StreamQueryUseCase<Iterable<DsaExerciseModel>,
            ReadAllDsaExercisesData> {
  ReadAllDsaExercises(this.repository) {
    _listenElements();
  }

  final DsaRepository repository;
  final BehaviorSubject<Iterable<DsaExerciseModel>> _dsaExercisesListStream =
      BehaviorSubject<Iterable<DsaExerciseModel>>.seeded([]);

  void _listenElements() {
    repository.readAllDsaExercisesStream.listen((items) {
      _dsaExercisesListStream.add(items);
    });
  }

  // review this don't sent iterable
  @override
  Stream<Iterable<DsaExerciseModel>> call(ReadAllDsaExercisesData data) =>
      _dsaExercisesListStream;
}
