import 'package:lepath_app/base/base.dart';
import 'package:lepath_app/core/core.dart';

class InitUseCasesFacade {
  InitUseCasesFacade(
    this.fetchDsaProblems,
    this.saveDsaGroupsProblems,
    this.saveDsaProblem,
  );

  final FutureCommandUseCase<SaveDsaGroupsProblemsData> saveDsaGroupsProblems;

  final FutureCommandUseCase<SaveDsaProblemData> saveDsaProblem;

  final FutureQueryUseCase<RemoteAppResponse<DsaContentProblemsAggregateDto>,
      FetchDsaProblemsData> fetchDsaProblems;
}
