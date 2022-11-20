import 'package:lepath_app/base/base.dart';
import 'package:lepath_app/core/core.dart';

class InitUseCasesFacade {
  InitUseCasesFacade(
    this.fetchDsaProblems,
    this.saveDsaRoutesProblems,
    this.saveDsaProblem,
  );

  final FutureCommandUseCase<SaveDsaRoutesProblemsData> saveDsaRoutesProblems;

  final FutureCommandUseCase<SaveDsaProblemData> saveDsaProblem;

  final FutureQueryUseCase<RemoteAppResponse<DsaContentProblemsAggregateDto>,
      FetchDsaProblemsData> fetchDsaProblems;
}
