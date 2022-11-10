import 'package:lepath_app/app/dsa_content/model/entities/dsa_exercise.dart';
import 'package:lepath_app/core/base/base.dart';
import 'package:lepath_app/core/base/remote/remote_app_response.dart';

import 'use_cases.dart';

class DsaContentUseCasesFacade {
  DsaContentUseCasesFacade(
    this.markAsComplete,
    this.fetchAllPathContent,
    this.saveAllPathContentData,
  );

  final FutureCommandUseCase<MarkAsCompleteData> markAsComplete;

  final FutureCommandUseCase<SaveAllDsaExercisesData> saveAllPathContentData;

  final FutureQueryUseCase<RemoteAppResponse<DsaExerciseModel>,
      FetchAllDsaExercisesData> fetchAllPathContent;
}
