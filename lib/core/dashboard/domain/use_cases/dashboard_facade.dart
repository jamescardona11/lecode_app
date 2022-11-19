import 'package:lepath_app/base/base.dart';
import 'package:lepath_app/core/core.dart';

class DashboardFacade {
  DashboardFacade(
    this.readSimilarExercises,
    this.readStatsUseCase,
    this.readRandomExercise,
  );

  final StreamQueryUseCase<StatsModel, ReadStatsData> readStatsUseCase;

  final StreamQueryUseCase<Iterable<DsaExerciseModel>, ReadSimilarExercisesData>
      readSimilarExercises;

  final StreamQueryUseCase<DsaExerciseModel?, ReadRandomExercisesData>
      readRandomExercise;
}
