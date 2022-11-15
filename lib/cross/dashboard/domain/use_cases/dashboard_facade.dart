import 'package:lepath_app/core/core.dart';
import 'package:lepath_app/cross/cross.dart';

class DashboardFacade {
  DashboardFacade(
    this.readSimilarExercises,
    this.readStatsUseCase,
  );

  final StreamQueryUseCase<StatsModel, ReadStatsData> readStatsUseCase;

  final StreamQueryUseCase<Iterable<DsaExerciseModel>, ReadSimilarExercisesData>
      readSimilarExercises;
}
