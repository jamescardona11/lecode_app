import 'package:lepath_app/core/core.dart';
import 'package:lepath_app/cross/cross.dart';
import 'package:lepath_app/utils/utils.dart';
import 'package:pocket/pocket.dart';
import 'package:rxdart/rxdart.dart';

class DashboardRepository with PocketMultiDataSourceMixin<IPocketAdapter> {
  DashboardRepository(
    this.adapterDb,
  ) {
    _listenElements();
  }

  @override
  final IPocketAdapter adapterDb;

  final BehaviorSubject<Iterable<DsaExerciseModel>>
      _similarExercisesListStream =
      BehaviorSubject<Iterable<DsaExerciseModel>>.seeded([]);

  Stream<Iterable<DsaExerciseModel>> get readSimilarExercises =>
      _similarExercisesListStream;

  void _listenElements() {
    readWhere<DsaExerciseModel>(tableDsaExercise, DsaExerciseDto.toEntityByJson)
        .map((items) => items.splitMatch(
              (element) => element.solvedDate != null,
            ))
        .map(
      (listMatch) {
        if (listMatch.matched.isEmpty || listMatch.unmatched.isEmpty) {
          return <DsaExerciseModel>[];
        }
        listMatch.matched
            .sort((a, b) => b.solvedDate!.compareTo(a.solvedDate!));

        Iterable<DsaExerciseModel> newList = [];
        for (var element in listMatch.matched) {
          newList = _getSimilar(element, listMatch.unmatched);
          if (newList.length > 3) break;
        }

        return newList;
      },
    ).listen((event) {});
  }

  Iterable<DsaExerciseModel> _getSimilar(
    DsaExerciseModel solved,
    Iterable<DsaExerciseModel> list,
  ) {
    return list.where(
      (element) =>
          element.difficulty == solved.difficulty ||
          (element.acceptanceRate - solved.acceptanceRate).abs() < 10 ||
          element.topics.any((element) => solved.topics.contains(element)) ||
          element.groups.any((element) => solved.groups.contains(element)),
    );
  }
}
