import 'package:lepath_app/core/core.dart';
import 'package:lepath_app/base/base.dart';

class SaveDsaProblemsData implements CommandData {
  DsaProblemsAggregateDto dsaProblemsAggregate;

  SaveDsaProblemsData(this.dsaProblemsAggregate);
}

class SaveDsaProblems implements FutureCommandUseCase<SaveDsaProblemsData> {
  final AppRepository _repository;

  SaveDsaProblems(
    this._repository,
  );

  @override
  Future<void> call(SaveDsaProblemsData data) =>
      _repository.saveDsaProblems(data.dsaProblemsAggregate);
}
