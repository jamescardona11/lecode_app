import 'package:lepath_app/core/base/base.dart';

import '../entities/dsa_exercise.dart';
import 'use_cases.dart';

class DsaContentUseCasesFacade {
  DsaContentUseCasesFacade(
    this.markAsComplete,
    this.fetchDsaProblems,
    this.saveDsaProblems,
  );

  final FutureCommandUseCase<MarkAsCompleteData> markAsComplete;

  final FutureCommandUseCase<SaveDsaProblemsData> saveDsaProblems;

  final FutureQueryUseCase<RemoteAppResponse<DsaExerciseModel>,
      FetchDsaProblemsData> fetchDsaProblems;
}
