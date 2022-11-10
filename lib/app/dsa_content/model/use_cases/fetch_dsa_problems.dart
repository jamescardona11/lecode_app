import 'package:lepath_app/app/dsa_content/model/entities/dsa_exercise.dart';
import 'package:lepath_app/app/dsa_content/repository/dsa_repository.dart';
import 'package:lepath_app/core/base/base.dart';
import 'package:lepath_app/core/base/misc/either/app_right.dart';
import 'package:lepath_app/core/base/remote/remote_app_response.dart';

class FetchDsaProblemsData implements CommandData {
  final bool shouldFetch;

  const FetchDsaProblemsData(this.shouldFetch);
}

class FetchDsaProblems
    implements
        FutureQueryUseCase<RemoteAppResponse<DsaExerciseModel>,
            FetchDsaProblemsData> {
  final DsaRepository _repository;

  FetchDsaProblems(
    this._repository,
  );

  @override
  Future<RemoteAppResponse<DsaExerciseModel>> call(
      FetchDsaProblemsData data) async {
    print('here');
    // if (!data.shouldFetch) return AppRight(RemoteSuccess([]));

    return await _repository.fetchDSAExercisesInformation();
  }
}
