import 'dart:async';

import 'package:lepath_app/base/base.dart';
import 'package:lepath_app/core/core.dart';
import 'package:rxdart/rxdart.dart';

class ReadAllGroupsData implements CommandData {
  const ReadAllGroupsData();
}

class ReadAllGroups
    implements StreamQueryUseCase<Iterable<DsaGroupsModel>, ReadAllGroupsData> {
  ReadAllGroups(this.dsaRepository, this.dsaContentRepository) {
    _listenElements();
  }

  final DsaRepository dsaRepository;
  final DsaContentRepository dsaContentRepository;

  final BehaviorSubject<Iterable<DsaGroupsModel>> _dsaExercisesListStream =
      BehaviorSubject<Iterable<DsaGroupsModel>>.seeded([]);

  void _listenElements() {
    // dsaC.readAllGroupsModelStream.listen((items) {
    //   _dsaExercisesListStream.add(items);
    // });
  }

  // review this don't sent iterable
  @override
  Stream<Iterable<DsaGroupsModel>> call(ReadAllGroupsData data) =>
      _dsaExercisesListStream;
}
