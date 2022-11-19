import 'dart:async';

import 'package:lepath_app/base/base.dart';
import 'package:lepath_app/core/core.dart';
import 'package:rxdart/rxdart.dart';

class ReadAllDsaExercisesWithPaginationData implements CommandData {
  const ReadAllDsaExercisesWithPaginationData([
    this.topics = const [],
    this.takeX = 20,
  ]);

  final Iterable<String> topics;
  final int takeX;
}

class ReadAllDsaExercisesWithPagination
    implements
        StreamQueryUseCase<Iterable<DsaExerciseModel>,
            ReadAllDsaExercisesWithPaginationData> {
  ReadAllDsaExercisesWithPagination(
    this.dsaFacade,
    this.repository,
  );

  final DsaUseCasesFacade dsaFacade;
  final DsaRepository repository;

  // review this don't sent iterable
  @override
  Stream<Iterable<DsaExerciseModel>> call(
      ReadAllDsaExercisesWithPaginationData data) {
    return dsaFacade.readAllDsaExercises
        .call(const ReadAllDsaExercisesData())
        .switchMap((items) => data.topics.isEmpty
            ? _allElementsStream(items, data)
            : _filteringStream(items, data));
  }

  Stream<Iterable<DsaExerciseModel>> _allElementsStream(
    Iterable<DsaExerciseModel> items,
    ReadAllDsaExercisesWithPaginationData data,
  ) =>
      Stream.value(items.take(data.takeX));

  Stream<Iterable<DsaExerciseModel>> _filteringStream(
    Iterable<DsaExerciseModel> items,
    ReadAllDsaExercisesWithPaginationData data,
  ) =>
      Stream.value(items
          .where(
            (item) => data.topics.any(
              (element) => item.topics.contains(element),
            ),
          )
          .take(data.takeX));
}
