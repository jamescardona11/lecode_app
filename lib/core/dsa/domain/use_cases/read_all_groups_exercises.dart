import 'dart:async';

import 'package:lepath_app/base/base.dart';
import 'package:lepath_app/core/core.dart';
import 'package:rxdart/rxdart.dart';

class ReadAllGroupsExercisesData implements CommandData {
  const ReadAllGroupsExercisesData();
}

class ReadAllExercisesGroups
    implements
        StreamQueryUseCase<Iterable<DsaGroupsModel>,
            ReadAllGroupsExercisesData> {
  ReadAllExercisesGroups(this.repository) {
    _listenElements();
  }

  final DsaRepository repository;
  final BehaviorSubject<Iterable<DsaGroupsModel>> _dsaExercisesListStream =
      BehaviorSubject<Iterable<DsaGroupsModel>>.seeded([]);

  void _listenElements() {
    // CombineLatestStream.combine2(streamOne, streamTwo, (a, b) => null)

    // repository.readAllGroupsModelStream.listen((items) {
    //   _dsaExercisesListStream.add(items);
    // });
  }

  // review this don't sent iterable
  @override
  Stream<Iterable<DsaGroupsModel>> call(ReadAllGroupsExercisesData data) =>
      _dsaExercisesListStream;
}
