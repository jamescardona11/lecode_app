import 'dart:async';

import 'package:lepath_app/base/base.dart';
import 'package:lepath_app/core/core.dart';
import 'package:lepath_app/core/dsa/domain/entities/filtering_data.dart';
import 'package:rxdart/rxdart.dart';

class ReadAllDsaProblemsFilteringData implements CommandData {
  const ReadAllDsaProblemsFilteringData({
    this.filteringData = const FilteringData(),
    this.takeX = 20,
  });

  final FilteringData filteringData;
  final int takeX;
}

class ReadAllDsaProblemsFiltering
    implements
        StreamQueryUseCase<Iterable<DsaProblemModel>,
            ReadAllDsaProblemsFilteringData> {
  ReadAllDsaProblemsFiltering(
    this.crossDsaFacade,
    this.repository,
  );

  final CrossDsaFacade crossDsaFacade;
  final DsaRepository repository;

  // review this don't sent iterable
  @override
  Stream<Iterable<DsaProblemModel>> call(ReadAllDsaProblemsFilteringData data) {
    return crossDsaFacade.readAllDsaProblems
        .call(const ReadAllDsaProblemsData())
        .switchMap((items) => data.filteringData.isTopicsEmpty
            ? _allElementsStream(items, data)
            : _filteringStream(items, data));
  }

  Stream<Iterable<DsaProblemModel>> _allElementsStream(
    Iterable<DsaProblemModel> items,
    ReadAllDsaProblemsFilteringData data,
  ) =>
      Stream.value(items.take(data.takeX));

  Stream<Iterable<DsaProblemModel>> _filteringStream(
    Iterable<DsaProblemModel> items,
    ReadAllDsaProblemsFilteringData data,
  ) =>
      Stream.value(items
          .where(
            (item) => data.filteringData.topics.any(
              (element) => item.topics.contains(element),
            ),
          )
          .take(data.takeX));
}
