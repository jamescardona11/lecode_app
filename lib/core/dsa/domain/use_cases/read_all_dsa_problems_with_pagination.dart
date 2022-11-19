import 'dart:async';

import 'package:lepath_app/base/base.dart';
import 'package:lepath_app/core/core.dart';
import 'package:rxdart/rxdart.dart';

class ReadAllDsaProblemsWithPaginationData implements CommandData {
  const ReadAllDsaProblemsWithPaginationData([
    this.topics = const [],
    this.takeX = 20,
  ]);

  final Iterable<String> topics;
  final int takeX;
}

class ReadAllDsaProblemsWithPagination
    implements
        StreamQueryUseCase<Iterable<DsaProblemModel>,
            ReadAllDsaProblemsWithPaginationData> {
  ReadAllDsaProblemsWithPagination(
    this.crossDsaFacade,
    this.repository,
  );

  final CrossDsaFacade crossDsaFacade;
  final DsaRepository repository;

  // review this don't sent iterable
  @override
  Stream<Iterable<DsaProblemModel>> call(
      ReadAllDsaProblemsWithPaginationData data) {
    return crossDsaFacade.readAllDsaProblems
        .call(const ReadAllDsaProblemsData())
        .switchMap((items) => data.topics.isEmpty
            ? _allElementsStream(items, data)
            : _filteringStream(items, data));
  }

  Stream<Iterable<DsaProblemModel>> _allElementsStream(
    Iterable<DsaProblemModel> items,
    ReadAllDsaProblemsWithPaginationData data,
  ) =>
      Stream.value(items.take(data.takeX));

  Stream<Iterable<DsaProblemModel>> _filteringStream(
    Iterable<DsaProblemModel> items,
    ReadAllDsaProblemsWithPaginationData data,
  ) =>
      Stream.value(items
          .where(
            (item) => data.topics.any(
              (element) => item.topics.contains(element),
            ),
          )
          .take(data.takeX));
}
