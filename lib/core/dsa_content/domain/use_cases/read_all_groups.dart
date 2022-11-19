import 'dart:async';

import 'package:lepath_app/base/base.dart';
import 'package:lepath_app/core/core.dart';
import 'package:rxdart/rxdart.dart';

class ReadAllGroupsData implements CommandData {
  const ReadAllGroupsData();
}

class ReadAllGroups
    implements StreamQueryUseCase<Iterable<DsaGroupsModel>, ReadAllGroupsData> {
  ReadAllGroups(this.repository) {
    _listenStreams();
  }

  final DsaContentRepository repository;

  final BehaviorSubject<Iterable<DsaGroupsModel>> _groupsListStream =
      BehaviorSubject<Iterable<DsaGroupsModel>>.seeded([]);

  void _listenStreams() {
    repository.readAllGroupsModelStream.listen((items) {
      _groupsListStream.add(items);
    });
  }

  @override
  Stream<Iterable<DsaGroupsModel>> call(ReadAllGroupsData data) =>
      _groupsListStream;
}
