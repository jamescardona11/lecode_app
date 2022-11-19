import 'dart:async';

import 'package:lepath_app/base/base.dart';
import 'package:lepath_app/core/core.dart';
import 'package:rxdart/rxdart.dart';

class ReadAllGroupsExercisesData implements CommandData {
  const ReadAllGroupsExercisesData();
}

class ReadAllGroupsExercises
    implements
        StreamQueryUseCase<Iterable<DsaGroupsExercisesModel>,
            ReadAllGroupsExercisesData> {
  ReadAllGroupsExercises(
    this.crossDsaFacade,
    this.readAllGroups,
  ) {
    _listenStreams();
  }

  final CrossDsaFacade crossDsaFacade;
  final StreamQueryUseCase<Iterable<DsaGroupsModel>, ReadAllGroupsData>
      readAllGroups;

  final BehaviorSubject<Iterable<DsaGroupsExercisesModel>>
      _dsaGroupsExercisesListStream =
      BehaviorSubject<Iterable<DsaGroupsExercisesModel>>.seeded([]);

  @override
  Stream<Iterable<DsaGroupsExercisesModel>> call(
          ReadAllGroupsExercisesData data) =>
      _dsaGroupsExercisesListStream;

  void _listenStreams() {
    final allDsaStream = crossDsaFacade.readAllDsaExercises
        .call(const ReadAllDsaExercisesData());

    final groupsStream = readAllGroups.call(const ReadAllGroupsData());

    CombineLatestStream.combine2(
        allDsaStream,
        groupsStream,
        (dsa, groups) => groups.map((group) {
              Iterable<DsaExerciseModel> exercises = dsa.where((element) =>
                  group.setProblems.contains(int.parse(element.id)));

              final secureLength = exercises.isEmpty ? 1 : exercises.length;
              double averageRate = 0.0;
              double averageAcceptance = 0.0;

              for (var exercise in exercises) {
                averageRate += exercise.myRate;
                averageAcceptance += exercise.acceptanceRate;
              }

              averageRate = averageRate / secureLength;
              averageAcceptance = averageAcceptance / secureLength;

              return DsaGroupsExercisesModel(
                id: group.id,
                description: group.description,
                setProblems: exercises,
                averageRate: averageRate,
                averageAcceptance: averageAcceptance,
              );
            })).listen((value) {
      _dsaGroupsExercisesListStream.add(value);
    });
  }
}
