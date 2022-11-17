import 'package:lepath_app/core/core.dart';
import 'package:lepath_app/cross/cross.dart';

class FetchDsaProblemsData implements CommandData {
  final bool shouldFetch;

  const FetchDsaProblemsData(this.shouldFetch);
}

class FetchDsaProblems
    implements
        FutureQueryUseCase<RemoteAppResponse<DsaProblemsAggregateDto>,
            FetchDsaProblemsData> {
  final AppRepository _repository;

  FetchDsaProblems(
    this._repository,
  );

  @override
  Future<RemoteAppResponse<DsaProblemsAggregateDto>> call(
      FetchDsaProblemsData data) async {
    if (!data.shouldFetch) {
      return AppRight(RemoteSuccess(DsaProblemsAggregateDto.def()));
    }

    return await _repository.fetchDSAExercisesInformation();
  }
}