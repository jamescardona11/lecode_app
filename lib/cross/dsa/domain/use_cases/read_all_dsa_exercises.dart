import 'dart:async';

import 'package:lepath_app/core/core.dart';
import 'package:lepath_app/cross/cross.dart';
import 'package:rxdart/rxdart.dart';

class ReadAllDsaExercisesData implements CommandData {
  const ReadAllDsaExercisesData([
    this.topics = const [],
    this.takeX = 20,
  ]);

  final Iterable<String> topics;
  final int takeX;
}

class ReadAllDsaExercises
    implements
        StreamQueryUseCase<Iterable<DsaExerciseModel>,
            ReadAllDsaExercisesData> {
  final DsaListRepository _repository;

  ReadAllDsaExercises(this._repository) {
    _listenDsaExercises();
  }

  final BehaviorSubject<Iterable<DsaExerciseModel>> elementsStream =
      BehaviorSubject<Iterable<DsaExerciseModel>>();

  // Iterable<DsaExerciseModel> elements = [];

  void _listenDsaExercises() {
    _repository.readAllDsaExercises.asBroadcastStream().listen((items) {
      elementsStream.add(items);
    });
  }

  @override
  Stream<Iterable<DsaExerciseModel>> call(ReadAllDsaExercisesData data) async* {
    final items = await elementsStream.first;

    if (data.topics.isEmpty) {
      yield* Stream.value(items.take(data.takeX));
    }

    yield* Stream.value(items
        .where(
          (item) => data.topics.any(
            (element) => item.topics.contains(element),
          ),
        )
        .take(data.takeX));
  }
}
