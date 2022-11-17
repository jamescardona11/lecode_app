import 'dart:async';

import 'package:lepath_app/core/core.dart';
import 'package:lepath_app/cross/cross.dart';
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
    repository.readAllDsaExercisesStream.listen((event) {
      _dsaExercisesListStream.add(event);
    });
  }

  // review this don't sent iterable
  @override
  Stream<Iterable<DsaExerciseModel>> call(ReadAllDsaExercisesData data) {
    return _dsaExercisesListStream.stream;
  }
}
