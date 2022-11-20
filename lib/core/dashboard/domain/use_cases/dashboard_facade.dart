import 'package:lecode_app/base/base.dart';
import 'package:lecode_app/core/core.dart';

class DashboardFacade {
  DashboardFacade(
    this.readSimilarProblems,
    this.readStatsUseCase,
    this.readRandomProblem,
  );

  final StreamQueryUseCase<StatsModel, ReadStatsData> readStatsUseCase;

  final StreamQueryUseCase<Iterable<DsaProblemModel>, ReadSimilarProblemsData>
      readSimilarProblems;

  final StreamQueryUseCase<DsaProblemModel?, ReadRandomProblemsData>
      readRandomProblem;
}
