import 'dart:async';

import 'package:lepath_app/base/base.dart';
import 'package:lepath_app/core/core.dart';
import 'package:rxdart/rxdart.dart';

class ReadAllGroupsProblemsData implements CommandData {
  const ReadAllGroupsProblemsData();
}

class ReadAllGroupsProblems
    implements
        StreamQueryUseCase<Iterable<DsaGroupsProblemsModel>,
            ReadAllGroupsProblemsData> {
  ReadAllGroupsProblems(
    this.crossDsaFacade,
    this.readAllGroups,
  ) {
    _listenStreams();
  }

  final CrossDsaFacade crossDsaFacade;
  final StreamQueryUseCase<Iterable<DsaGroupsModel>, ReadAllGroupsData>
      readAllGroups;

  final BehaviorSubject<Iterable<DsaGroupsProblemsModel>>
      _dsaGroupsProblemsListStream =
      BehaviorSubject<Iterable<DsaGroupsProblemsModel>>.seeded([]);

  @override
  Stream<Iterable<DsaGroupsProblemsModel>> call(
          ReadAllGroupsProblemsData data) =>
      _dsaGroupsProblemsListStream;

  void _listenStreams() {
    final allDsaStream =
        crossDsaFacade.readAllDsaProblems.call(const ReadAllDsaProblemsData());

    final groupsStream = readAllGroups.call(const ReadAllGroupsData());

    CombineLatestStream.combine2(
        allDsaStream,
        groupsStream,
        (dsa, groups) => groups.map((group) {
              Iterable<DsaProblemModel> problems = dsa.where((element) =>
                  group.setProblems.contains(int.parse(element.id)));

              final secureLength = problems.isEmpty ? 1 : problems.length;
              double averageRate = 0.0;
              double averageAcceptance = 0.0;

              for (var problem in problems) {
                averageRate += problem.myRate;
                averageAcceptance += problem.acceptanceRate;
              }

              averageRate = averageRate / secureLength;
              averageAcceptance = averageAcceptance / secureLength;

              return DsaGroupsProblemsModel(
                id: group.id,
                description: group.description,
                setProblems: problems,
                averageRate: averageRate,
                averageAcceptance: averageAcceptance,
              );
            })).listen((value) {
      _dsaGroupsProblemsListStream.add(value);
    });
  }
}
