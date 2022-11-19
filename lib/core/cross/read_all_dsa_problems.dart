import 'dart:async';

import 'package:lepath_app/base/base.dart';
import 'package:lepath_app/core/core.dart';
import 'package:rxdart/rxdart.dart';

class ReadAllDsaProblemsData implements CommandData {
  const ReadAllDsaProblemsData();
}

class ReadAllDsaProblems
    implements
        StreamQueryUseCase<Iterable<DsaProblemModel>, ReadAllDsaProblemsData> {
  ReadAllDsaProblems(this.repository) {
    _listenStreams();
  }

  final DsaRepository repository;
  final BehaviorSubject<Iterable<DsaProblemModel>> _dsaProblemsListStream =
      BehaviorSubject<Iterable<DsaProblemModel>>.seeded([]);

  void _listenStreams() {
    repository.readAllDsaProblemsStream.listen((items) {
      _dsaProblemsListStream.add(items);
    });
  }

  // review this don't sent iterable
  @override
  Stream<Iterable<DsaProblemModel>> call(ReadAllDsaProblemsData data) =>
      _dsaProblemsListStream;
}
