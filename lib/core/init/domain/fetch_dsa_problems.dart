import 'package:lecode_app/base/base.dart';
import 'package:lecode_app/core/core.dart';

class FetchDsaProblemsData implements CommandData {
  final bool shouldFetch;

  const FetchDsaProblemsData(this.shouldFetch);
}

class FetchDsaProblems
    implements
        FutureQueryUseCase<RemoteAppResponse<DsaContentProblemsAggregateDto>,
            FetchDsaProblemsData> {
  final AppRepository _repository;

  FetchDsaProblems(
    this._repository,
  );

  @override
  Future<RemoteAppResponse<DsaContentProblemsAggregateDto>> call(
      FetchDsaProblemsData data) async {
    if (!data.shouldFetch) {
      return AppRight(RemoteSuccess(DsaContentProblemsAggregateDto.def()));
    }

    return await _repository.fetchDSAProblemsInformation();
  }
}
