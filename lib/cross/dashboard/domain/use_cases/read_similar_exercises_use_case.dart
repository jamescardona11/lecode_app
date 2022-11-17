import 'package:lepath_app/core/core.dart';
import 'package:lepath_app/cross/cross.dart';
import 'package:lepath_app/utils/utils.dart';
import 'package:rxdart/rxdart.dart';

class ReadSimilarExercisesData extends CommandData {}

class ReadSimilarExercisesUseCase
    implements
        StreamQueryUseCase<Iterable<DsaExerciseModel>,
            ReadSimilarExercisesData> {
  ReadSimilarExercisesUseCase(this.repository) {
    _listenDsaExercises();
  }

  final DsaRepository repository;

  final BehaviorSubject<Iterable<DsaExerciseModel>> readAllDsaExercisesStream =
      BehaviorSubject<Iterable<DsaExerciseModel>>();

  void _listenDsaExercises() {
    repository.readAllDsaExercises.listen((items) {
      readAllDsaExercisesStream.add(items);
    });
  }

  @override
  Stream<Iterable<DsaExerciseModel>> call(ReadSimilarExercisesData data) =>
      repository.readAllDsaExercises
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

          return newList.take(10);
        },
      );

  Iterable<DsaExerciseModel> _getSimilar(
    DsaExerciseModel solved,
    Iterable<DsaExerciseModel> list,
  ) {
    return list.where(
      (element) =>
          element.difficulty == solved.difficulty ||
          (element.acceptanceRate - solved.acceptanceRate).abs() < 10 ||
          element.topics.any((element) => solved.topics.contains(element)),
    );
  }
}
