import 'package:lepath_app/base/base.dart';
import 'package:lepath_app/core/core.dart';

class DsaUseCasesFacade {
  DsaUseCasesFacade(
    this.markAsSolved,
    this.readAllDsaProblemsWithPagination,
    this.readAllSolvedDsaProblems,
  );

  final FutureCommandUseCase<MarkAsSolvedData> markAsSolved;

  final StreamQueryUseCase<Iterable<DsaProblemModel>,
      ReadAllDsaProblemsFilteringData> readAllDsaProblemsWithPagination;

  final StreamQueryUseCase<Iterable<DsaProblemModel>,
      ReadAllSolvedDsaProblemsData> readAllSolvedDsaProblems;
}
