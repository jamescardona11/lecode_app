import 'dart:async';

import 'package:lecode_app/base/base.dart';
import 'package:lecode_app/core/core.dart';
import 'package:rxdart/rxdart.dart';

class ReadAllRoutesData implements CommandData {
  const ReadAllRoutesData();
}

class ReadAllRoutes
    implements StreamQueryUseCase<Iterable<DsaRouteModel>, ReadAllRoutesData> {
  ReadAllRoutes(this.repository) {
    _listenStreams();
  }

  final DsaRoutesRepository repository;

  final BehaviorSubject<Iterable<DsaRouteModel>> _routesListStream =
      BehaviorSubject<Iterable<DsaRouteModel>>.seeded([]);

  void _listenStreams() {
    repository.readAllRoutesModelStream.listen((items) {
      _routesListStream.add(items);
    });
  }

  @override
  Stream<Iterable<DsaRouteModel>> call(ReadAllRoutesData data) =>
      _routesListStream;
}
