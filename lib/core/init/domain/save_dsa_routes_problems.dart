import 'package:lecode_app/base/base.dart';
import 'package:lecode_app/core/core.dart';

class SaveDsaRoutesProblemsData implements CommandData {
  DsaContentProblemsAggregateDto dsaProblemsAggregate;

  SaveDsaRoutesProblemsData(this.dsaProblemsAggregate);
}

class SaveDsaRoutesProblems
    implements FutureCommandUseCase<SaveDsaRoutesProblemsData> {
  final AppRepository _repository;

  SaveDsaRoutesProblems(
    this._repository,
  );

  @override
  Future<void> call(SaveDsaRoutesProblemsData data) =>
      _repository.saveDsaRoutesProblems(data.dsaProblemsAggregate);
}
