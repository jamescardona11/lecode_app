import 'dart:async';

import 'package:lepath_app/base/base.dart';
import 'package:lepath_app/core/core.dart';
import 'package:rxdart/rxdart.dart';

class ReadAllDsaProblemsFilteringData implements CommandData {
  const ReadAllDsaProblemsFilteringData({
    this.filteringData = const FilteringData(),
    this.takeX = 40,
  });

  final FilteringData filteringData;
  final int takeX;
}

class ReadAllDsaProblemsFiltering
    implements
        StreamQueryUseCase<Iterable<DsaProblemModel>,
            ReadAllDsaProblemsFilteringData> {
  ReadAllDsaProblemsFiltering(
    this.readAllRoutesProblems,
    this.repository,
  );

  final StreamQueryUseCase<Iterable<DsaRouteProblemsModel>,
      ReadAllRoutesProblemsData> readAllRoutesProblems;
  final DsaRepository repository;

  // review this don't sent iterable
  @override
  Stream<Iterable<DsaProblemModel>> call(ReadAllDsaProblemsFilteringData data) {
    return readAllRoutesProblems
        .call(const ReadAllRoutesProblemsData())
        .switchMap((items) => Stream.value(_getElementsStream(items, data)))
        .switchMap((items) => data.filteringData.isEmpty
            ? _allElementsStream(items, data)
            : _filteringStream(items, data));
  }

  Iterable<DsaProblemModel> _getElementsStream(
    Iterable<DsaRouteProblemsModel> items,
    ReadAllDsaProblemsFilteringData data,
  ) {
    if (data.filteringData.route.isEmpty) {
      return items.fold<List<DsaProblemModel>>(
          <DsaProblemModel>[],
          (previousValue, element) =>
              previousValue + element.setProblems.toList());
    }

    return items
        .firstWhere((element) => element.id == data.filteringData.route)
        .setProblems;
  }

  Stream<Iterable<DsaProblemModel>> _allElementsStream(
    Iterable<DsaProblemModel> items,
    ReadAllDsaProblemsFilteringData data,
  ) =>
      Stream.value(items.take(data.takeX));

  Stream<Iterable<DsaProblemModel>> _filteringStream(
    Iterable<DsaProblemModel> items,
    ReadAllDsaProblemsFilteringData data,
  ) {
    return Stream.value(items.where(
      (item) {
        bool matchTopics = data.filteringData.topics.any(
          (topic) => item.topics.contains(topic),
        );

        bool matchDifficulty = data.filteringData.byAnyDifficulty
            ? true
            : data.filteringData.difficulty
                .any((difficulty) => item.difficulty == difficulty);

        return matchTopics || matchDifficulty;
      },
    ).take(data.takeX));
  }
}
