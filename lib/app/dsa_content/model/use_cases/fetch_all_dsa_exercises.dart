import 'package:lepath_app/app/dsa_content/model/entities/dsa_exercise.dart';
import 'package:lepath_app/app/dsa_content/repository/dsa_repository.dart';
import 'package:lepath_app/core/base/base.dart';
import 'package:lepath_app/core/base/misc/either/app_right.dart';
import 'package:lepath_app/core/base/remote/remote_app_response.dart';

class FetchAllDsaExercisesData implements CommandData {
  final bool shouldFetch;

  const FetchAllDsaExercisesData(this.shouldFetch);
}

class FetchAllDsaExercises
    implements
        FutureQueryUseCase<RemoteAppResponse<DsaExerciseModel>,
            FetchAllDsaExercisesData> {
  final PathContentDatabase _repository;

  FetchAllDsaExercises(
    this._repository,
  );

  @override
  Future<RemoteAppResponse<DsaExerciseModel>> call(
      FetchAllDsaExercisesData data) async {
    print('here');
    // if (!data.shouldFetch) return AppRight(RemoteSuccess([]));

    return await _repository.fetchDSAExercisesInformation();
  }
}
