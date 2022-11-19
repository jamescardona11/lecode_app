import 'dart:math';

import 'package:lepath_app/base/base.dart';
import 'package:lepath_app/core/core.dart';

class ReadRandomExercisesData extends CommandData {}

class ReadRandomExercisesUseCase
    implements StreamQueryUseCase<DsaExerciseModel?, ReadRandomExercisesData> {
  const ReadRandomExercisesUseCase(
    this.dsaFacade,
    this.repository,
  );

  final DsaRepository repository;
  final DsaUseCasesFacade dsaFacade;

  @override
  Stream<DsaExerciseModel?> call(ReadRandomExercisesData data) {
    return dsaFacade.readAllDsaExercises
        .call(const ReadAllDsaExercisesData())
        .map((all) {
      final noSolved = all.where((element) => element.solvedDate == null);
      if (noSolved.isEmpty) return null;

      final randomIndex = Random().nextInt(noSolved.length);
      return noSolved.elementAt(randomIndex);
    });
  }
}
