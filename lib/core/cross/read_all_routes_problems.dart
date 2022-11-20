import 'dart:async';

import 'package:lepath_app/base/base.dart';
import 'package:lepath_app/core/core.dart';
import 'package:rxdart/rxdart.dart';

class ReadAllRoutesProblemsData implements CommandData {
  const ReadAllRoutesProblemsData();
}

class ReadAllRoutesProblems
    implements
        StreamQueryUseCase<Iterable<DsaRouteProblemsModel>,
            ReadAllRoutesProblemsData> {
  ReadAllRoutesProblems(
    this.readAllDsaProblems,
    this.readAllRoutes,
  ) {
    _listenStreams();
  }

  final StreamQueryUseCase<Iterable<DsaProblemModel>, ReadAllDsaProblemsData>
      readAllDsaProblems;
  final StreamQueryUseCase<Iterable<DsaRouteModel>, ReadAllRoutesData>
      readAllRoutes;

  final BehaviorSubject<Iterable<DsaRouteProblemsModel>>
      _dsaRoutesProblemsListStream =
      BehaviorSubject<Iterable<DsaRouteProblemsModel>>.seeded([]);

  @override
  Stream<Iterable<DsaRouteProblemsModel>> call(
          ReadAllRoutesProblemsData data) =>
      _dsaRoutesProblemsListStream;

  void _listenStreams() {
    final allDsaStream =
        readAllDsaProblems.call(const ReadAllDsaProblemsData());

    final routesStream = readAllRoutes.call(const ReadAllRoutesData());

    CombineLatestStream.combine2(
        allDsaStream,
        routesStream,
        (Iterable<DsaProblemModel> dsa, Iterable<DsaRouteModel> routes) =>
            routes.map((route) {
              Iterable<DsaProblemModel> problems = dsa.where((element) =>
                  route.setProblems.contains(int.parse(element.id)));

              final secureLength = problems.isEmpty ? 1 : problems.length;
              double averageRate = 0.0;
              double averageAcceptance = 0.0;

              for (var problem in problems) {
                averageRate += problem.myRate;
                averageAcceptance += problem.acceptanceRate;
              }

              averageRate = averageRate / secureLength;
              averageAcceptance = averageAcceptance / secureLength;

              return DsaRouteProblemsModel(
                id: route.id,
                description: route.description,
                setProblems: problems,
                averageRate: averageRate,
                averageAcceptance: averageAcceptance,
              );
            })).listen((value) {
      _dsaRoutesProblemsListStream.add(value);
    });
  }
}
