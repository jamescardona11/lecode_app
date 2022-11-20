import 'package:lecode_app/base/base.dart';
import 'package:lecode_app/core/core.dart';

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
